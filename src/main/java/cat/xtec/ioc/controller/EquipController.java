/**
 * Classe java que actua de Controlador de Spring MVC per gesionar equips.
 * Permet crear equips, llistar, eliminar i actuar sobre altres classes.
 *
 * @author: Grup 11 - Xavi, Carlos, Ingrid, Denís
 * @version:05/2023
 */
package cat.xtec.ioc.controller;

import cat.xtec.ioc.domain.*;

import java.io.IOException;
import java.sql.SQLException;

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
import cat.xtec.ioc.service.EquipService;
import cat.xtec.ioc.service.EspaiService;
import java.util.List;

@Controller
@RequestMapping("/equips")
public class EquipController {

    /**
     * Injecció dels serveis
     */
    @Autowired
    EquipService equipService;

    @Autowired
    EspaiService espaiService;

    /**
     * Carrega un objecte equip per treballar amb ell
     */
    public Equip equip = new Equip();

    /**
     * MÈTODE LLISTAR EQUIPS
     *
     * @param request Procesa peticions del tipus HTTP.
     * @return modelview: Retorna una vista: \WEB-INF\views\equips\equips.jsp
     * throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/llistar")
    public ModelAndView allEquips(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("equips/equips");
        modelview.getModelMap().addAttribute("equips", equipService.getAllEquips());
        return modelview;
    }

    /**
     * MÉTODE PER AFEGIR NOU EQUIP
     *
     * @param request Procesa peticions del tipus HTTP.
     * @param response Conté la resposta del servlet davant la petició.
     * @return modelview: Retorna una vista: \WEB-INF\views\equips\nouEquip.jsp.
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/afegir")
    public ModelAndView addEquip(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("equips/nouEquip");
        Equip formEquip = null;
        formEquip = new Equip();
        modelview.getModelMap().addAttribute("formNouEquip", formEquip);
        return modelview;
    }

    /**
     * Métode per accedir a un equip mitjançant el seu codi. Carrega un
     * formulari amb la informació de l'equip per posteriorment editar.
     *
     * @param codi Rebrà un codi per buscar al servei l'equip amb aquest codi.
     * @param request Procesa peticions del tipus HTTP.
     * @param response Conté la resposta del servlet davant la petició.
     * @return modelview: retorna una visa: \WEB-INF\views\equips\equip.jsp
     * @return modelview amb modelMapCarregant: codi espai assignat.
     * @throws ServletException
     * @throws IOException
     * @throws Exception
     */
    @RequestMapping("/equip")
    public ModelAndView getEquipByCodi(@RequestParam("codi") String codi, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        ModelAndView modelview = new ModelAndView("equips/equip");

        /**
         * Crea un nou formEquip per processar la informacío del formulari de la
         * vista. Crea un objecte equip mitjançant el métode del servei
         * .getEquipByCodi(codi). Carrega l'objecte equip al formulari.
         */
        Equip formEquip = null;
        if (codi != "") {
            equip = equipService.getEquipByCodi(codi);
            formEquip = equipService.getEquipByCodi(codi);
        } else {
            formEquip = new Equip();
        }
        modelview.getModelMap().addAttribute("formEquip", formEquip);

        /**
         * Carrega un llisat d'espais mitjançant el mètode getAllEspais del
         * servei espais. Mostra espai equip assignat si l'equip es troba en
         * servei Si l'equp es troba en estat: En servei captura el codi de
         * l'espai on s'ha assignat.
         */
        List<Espai> espais = null;
        espais = espaiService.getAllEspais();
        if (espais != null) {
            modelview.getModelMap().addAttribute("espais", espais);
        }

        /**/
        if (equip.getEstat().equals("Servei")) {
            String espaiAssignat = equipService.getCodiEspaiAssignat(codi);
            modelview.getModelMap().addAttribute("espaiAssignat", espaiAssignat);

        }

        return modelview;
    }

    /**
     * ACTUALITZA EQUIP LLEGINT LES DADES DEL FORMULARI AQUEST BLOC APLICA SOBRE
     * CONTROLADOR EN EL FORMULARI D'EQUIP: Actualitza les dades de l'equip
     * llegint informació el formulari Per editar un equip a través del
     * formulari de equip.jsp Per eliminar un equip a través del formulari
     * equip.jsp
     *
     * @param formEquip
     * @param model
     * @param request
     * @param result
     * @return redirecció al mateix equip per visualitzar la informació
     * carregada: redirect:/equips/equip?codi=" + equip.getCodi();
     * @throws Exception
     */
    @RequestMapping(value = "/equip", method = RequestMethod.POST, params = "desar")
    public String processEquipForm(@ModelAttribute("formEquip") Equip formEquip, Model model, HttpServletRequest request, BindingResult result) throws Exception {

        if (formEquip.getEstat().matches("Stock")) {

            espaiService.deleteEquipEspai(equip.getCodi()); //Treure l'equip de l'espai assignat.
            equipService.updateEquip(formEquip);//Actualitza les dades de l'equip

            /*SERVEI - ASSIGNA L'EQUIP A UN ESPAI */
        } else if (formEquip.getEstat().matches("Servei")) {

            String codiEspai = request.getParameter("espais");
            equipService.updateEquip(formEquip);
            //Actualiza l'espai on s'assigna l'equip.
            espaiService.deleteEquipEspai(equip.getCodi());
            espaiService.addEquipEspai(codiEspai, equip.getCodi());
            return "redirect:/equips/equip?codi=" + equip.getCodi();

        } else {
            equipService.updateEquip(formEquip);
            return "redirect:/equips/llistar";
        }

        return "redirect:/equips/equip?codi=" + equip.getCodi();
    }

    /**
     * ELIMINAR UN EQUIP
     * Utilitza el métode .deleteEquip del servei injectat
     * @return @throws Exception
     */
    @RequestMapping(value = "/equip", method = RequestMethod.POST, params = "eliminar")
    public String deleteEquip() throws Exception {
        equipService.deleteEquip(equip);
        return "redirect:/equips/llistar";
    }

    /*CREAR EQUIP --> nouEquip.jsp */
    
    /**
     * PROCESSAR FORMULARI D'UN NOU EQUIP.
     * @param formEquip
     * @param model
     * @param result
     * @return redirigeix al llistat d'equips. 
     * @throws Exception  Genera error si ja existeix.
     */
    @RequestMapping(value = "/nouEquip", method = RequestMethod.POST, params = "desar")
    public String processFormNouEquip(@ModelAttribute("formNouEquip") Equip formEquip, Model model, BindingResult result) throws Exception {

        //Comprova si l'equip ja existeix.
        //String idEquip = formEquip.getCodi().toUpperCase();
        Equip equipExisteix = equipService.getEquipByCodi(formEquip.getCodi().toUpperCase());

        if (equipExisteix != null) {
            model.addAttribute("message", "Equip ja existeix");
            return "equips/nouEquip";
        } else {
            equipService.addEquip(formEquip);
            return "redirect:/equips/llistar";
        }
    }

}
