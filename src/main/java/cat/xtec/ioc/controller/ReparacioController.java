/**
 * Classe java que actua de Controlador de Spring MVC per gestionar reparacions
 *
 * @author: Grup 11 - Xavi, Carlos, Ingrid, Denís
 * @version:05/2023
 */
package cat.xtec.ioc.controller;

import cat.xtec.ioc.domain.*;
import cat.xtec.ioc.service.EquipService;
import cat.xtec.ioc.service.ReparacioService;
import cat.xtec.ioc.service.UsuariService;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reparacions")
public class ReparacioController {

    /**
     * Injecció dels serveis
     */
    @Autowired
    ReparacioService reparacioService;

    @Autowired
    EquipService equipService;

    @Autowired
    UsuariService usuariService;

    /**
     * Carrega un objecte reparació per treballar amb ell.
     */
    public Reparacio reparacio = new Reparacio();
    
    
    private static final String REPARACIO_ESTAT_TANCADA = "Tancada";
    private static final String USUARI_ROL_TECNIC = "Tecnic";
    private static final String EQUIP_ESTAT_STOCK = "Stock";
    private static final String EQUIP_ESTAT_REPARACIO = "Reparacio";

    /**
     * LLISTAR TOTES LES REPARACIONS
     *
     * @param request
     * @param response
     * @return modelview: Retorna una vista
     * \WEB-INF\views\reparacions\reparacions.jsp
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/llistar")
    public ModelAndView allReparacions(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("reparacions/reparacions");
        modelview.getModelMap().addAttribute("reparacions", reparacioService.getAllReparacions());
        return modelview;
    }

    /**
     * Métode per accedir a una reparació mitjançant el seu id. Carrega
     * formulari amb la informació de la reparació.
     *
     * @param idReparacio
     * @param model
     * @param request
     * @param response
     * @return modelview Retorna una vista:
     * \WEB-INF\views\reparacions\reparacio.jsp
     * @throws ServletException
     * @throws IOException
     * @throws Exception
     */
    @RequestMapping("/reparacio")
    public ModelAndView getEquipByCodi(@RequestParam("idreparacio") int idReparacio, Model model, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        /**
         * Crea la vista repracions/reparacio.jsp
         */
        ModelAndView modelview = new ModelAndView("reparacions/reparacio");

        /**
         * Carrega una reparació per generar la vista capturant idReparacio
         * carregant dades al formulari
         */
        Reparacio formReparacio = null;
        reparacio = reparacioService.getReparacioById(idReparacio);
        formReparacio = reparacioService.getReparacioById(idReparacio);//GUARDA LES DADES PER ACTUALITZAR L'EQUIP A processEquipForm

        modelview.getModelMap().addAttribute("formReparacio", formReparacio);

        /**
         * Comprova si la reparació carregada està tancada - Si ho està
         * deshabilita botó tancar i només permet eliminar reparació. - Mostra
         * comentari de tancament al textbox
         */
        boolean botoDeshabilitat = true;
        boolean textDeshabilitat = true;

        /**
         * Si la reparació està tancada, deshabilita opció d'editar text
         * comentari tancament i boto Desar
         */
        if (reparacio.getEstat().equals(REPARACIO_ESTAT_TANCADA)) {
            model.addAttribute("botoDeshabilitat", botoDeshabilitat); //Deshabilita boto Tancar
            model.addAttribute("reparacio", reparacio); // Afegir objecte reparació a la vista reparacio.jsp -> Per passar comentariTancament
            model.addAttribute("textDeshabilitat", textDeshabilitat); //Deshabilita txtComentariTancament

        }

        /**
         * Mostrar usuaris en rol Tecnic
         */
        List<Usuari> usuaris = null;
        usuaris = usuariService.getUsuarisByRol(USUARI_ROL_TECNIC);
        if (usuaris != null) {
            modelview.getModelMap().addAttribute("tecnics", usuaris);
        }

        modelview.getModelMap().addAttribute("reparacio", reparacioService.getReparacioById(idReparacio));

        return modelview;
    }

    /**
     * GUARDAR CANVIS A REPARACIO
     */
    @RequestMapping(value = "/reparacio", method = RequestMethod.POST, params = "desar")
    public String processForm(@ModelAttribute("formReparacio") Reparacio formReparacio, BindingResult result) throws Exception {

        /**
         * Actualitza les dades de la reparació
         */
        reparacio.setComentariTancament(formReparacio.getComentariTancament());
        reparacio.setEstat(formReparacio.getEstat());

        /**
         * Si la reparació es tanca
         */
        if (formReparacio.getEstat().equals(REPARACIO_ESTAT_TANCADA)) {
            LocalDate dataFi = LocalDate.now();
            reparacio.setDataFi(dataFi.toString());
            /*Actualitza l'estat de l'equip reparat a Stock */
            Equip equip = equipService.getEquipByCodi(reparacio.getIdEquip());
            equip.setEstat(EQUIP_ESTAT_STOCK);
            equipService.updateEquip(equip);
        }
        reparacio.setTecnic(formReparacio.getTecnic());

        /**
         * Actualiza la reparació al servei
         */
        reparacioService.updateReparacio(reparacio);

        return "redirect:/reparacions/reparacio?idreparacio=" + reparacio.getIdReparacio();

    }

    /**
     * SOL·LICITAR REPARACIO PER PART DE L'USUARI
     *
     * @param request
     * @param response
     * @return modelview Retorna vista:
     * \WEB-INF\views\reparacions\solReparacio.jsp
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/sollicitud")
    public ModelAndView solReparacio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("reparacions/solReparacio");
        List<Equip> equips = equipService.getAllEquips();
        modelview.addObject("equips", equips);
        return modelview;
    }

    /**
     * Processa el formulari reparacio
     *
     * @param formReparacio
     * @return modelview Retorna vista: user
     * @throws Exception
     */
    @RequestMapping(value = "/solReparacio", method = RequestMethod.POST, params = "desar")
    public String processFormNovaReparacio(@ModelAttribute("formNovaReparacio") Reparacio formReparacio)
            throws Exception {

        /**
         * Actualitza l'estat de l'equip: Reparacio
         */
        Equip equip = equipService.getEquipByCodi(formReparacio.getIdEquip());;
        equip.setEstat(EQUIP_ESTAT_REPARACIO);
        equipService.updateEquip(equip);

        /**
         * Escriu una data d'inici data actual
         */
        String dataInici = LocalDate.now().toString();

        String comentari = formReparacio.getComentaris();

        /**
         * Crea la reparació
         */
        Reparacio reparacio = new Reparacio(0, formReparacio.getIdEquip(),
                dataInici, null, comentari, null,
                null, "Nova");

        reparacioService.addReparacio(reparacio);
        return "redirect:/usuaris/user";

    }
}
