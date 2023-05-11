/**
 * Classe java que actua de controlador de Spring MVC per gestionar espais.
 * Permet llistar i afegir equips als espais
 *
 * @author: Grup 11 - Xavi, Carlos, Ingrid, Denís
 * @version:05/2023
 */
package cat.xtec.ioc.controller;

import cat.xtec.ioc.domain.*;
import cat.xtec.ioc.service.EquipService;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;
import cat.xtec.ioc.service.EspaiService;
import java.util.List;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/espais")
public class EspaiController {

    /**
     * Injecció dels serveis
     */
    @Autowired
    EspaiService espaiService;

    @Autowired
    EquipService equipService;

    public Espai espai = new Espai();

    /**
     * LLISTAR TOTS ELS ESPAIS
     *
     * @param request
     * @param response
     * @return modelview: Retorna una vista: \WEB-INF\views\espais\espais.jsp
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     * @throws Exception
     */
    @RequestMapping("/llistar")
    public ModelAndView allEspais(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        ModelAndView modelview = new ModelAndView("espais/espais");

        modelview.getModelMap().addAttribute("espais", espaiService.getAllEspais());
        return modelview;
    }

    /**
     * AFEGIR ESPAI - No s'utilitza. Els espais només es poden crear des la base
     * de dades.
     *
     * @deprecated
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/afegir")
    public ModelAndView addEspai(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("espais/nouEspai");
        Espai formNouEspai = null;
        formNouEspai = new Espai();
        modelview.getModelMap().addAttribute("formNouEspai", formNouEspai);
        return modelview;
    }

    /**
     * Métode per accedir a un espai mitjançant el seu codi.
     *
     * @param codi
     * @param request
     * @param response
     * @return modelview: retorna una vista: \WEB-INF\views\espais\espai.jsp
     * @throws ServletException
     * @throws IOException
     * @throws Exception
     */
    @RequestMapping("/espai")
    public ModelAndView getEspaiBycodi(@RequestParam("codi") String codi, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        ModelAndView modelview = new ModelAndView("espais/espai");

        /**
         * Retorna els equips que té l'espai assignats amb el codi.
         */
        List<Equip> equipsAssignats = null;
        equipsAssignats = espaiService.getEquipsAssignats(codi);
        modelview.getModelMap().addAttribute("equipsAssignats", equipsAssignats);

        /**
         * Retorna un llistat d'equips en Estat Stock que estaràn disponibles
         * per afegir a l'espai. Ho retornara a la pagina espai.jsp amb el nom
         * equipsDisponibles
         */
        List<Equip> equipsStock = null;
        equipsStock = equipService.getEquipByEstat("Stock");
        modelview.getModelMap().addAttribute("equipsDisponibles", equipsStock);
        /* --------------------------------------------------------------------------*/

        Espai formEspai = null;

        /**
         * GUARDA ESPAI CARREGAT EN UN OBJECTE espai. GUARDA LES DADES PER
         * ACTUALITZAR L'ESPAI A processFormEspai
         */
        if (codi != "") {
            espai = espaiService.getEspaiByCodi(codi);
            formEspai = espaiService.getEspaiByCodi(codi);
        } else {
            formEspai = new Espai();
        }

        modelview.getModelMap().addAttribute("espai", espaiService.getEspaiByCodi(codi));
        return modelview;
    }

    /**
     * PROCESSAR FORMULARI ESPAI
     *
     * @deprecated
     * @param formNouEspai
     * @param model
     * @param result
     * @return
     * @throws Exception
     */
    /*CREAR ESPAI --> nouEspai.jsp */
    @RequestMapping(value = "/nouEspai", method = RequestMethod.POST, params = "desar")
    public String processFormNouEspai(@ModelAttribute("formNouEspai") Espai formNouEspai, Model model, BindingResult result) throws Exception {

        //Comprova si l'espai ja existeix.
        Espai espaiExisteix = espaiService.getEspaiByCodi(formNouEspai.getCodi());

        if (espaiExisteix != null) {
            model.addAttribute("message", "Espai ja existeix");
            return "espais/nouEspai";
        } else {
            espaiService.addEspai(formNouEspai);
            return "redirect:/espais/llistar";
        }
    }

    /**
     * ACTUALIZA INFORMACÍO ESPAI A TRAVÉS DEL FORMULARI.
     *
     * @deprecated
     * @param formEspai
     * @param result
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/espai", method = RequestMethod.POST, params = "desar")
    public String processForm(@ModelAttribute("formEspai") Espai formEspai, BindingResult result) throws Exception {
        System.out.println("estic fent servir update espai");
        espaiService.updateEspai(formEspai);

        return "redirect:/espais/llistar";

    }

    /**
     * AFEGIR EQUIPS A ESPAIS
     *
     * @param codiEspai
     * @param codiEquip
     * @param request
     * @param response
     * @return redirecciona al mateix espai amb la informacío actualitzada. Ho
     * fa carregant vista \WEB-INF\views\espais\espais.jsp + codiEspai
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     * @throws Exception
     */
    @RequestMapping("/afegirEquipEspai")
    public String addEquipEspais(@RequestParam("codiEspai") String codiEspai, @RequestParam("codiEquip") String codiEquip, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {

        /**
         * Actualiza l'estat de l'equip en Servei
         */
        Equip equip = equipService.getEquipByCodi(codiEquip);
        equip.setEstat("Servei");
        equipService.updateEquip(equip);

        /**
         * Afegir a la taula espais_equips el codi de l'espai i l'id de l'equip
         */
        espaiService.addEquipEspai(codiEspai, codiEquip);

        /*
        *Retorna a la mateixa pagina d'espai amb informacio actualitzada. L'equip seleccionat hauria d'apareixer a dalt (ha pasat a estat Servei)
         */
        return "redirect:/espais/espai?codi=" + codiEspai;
    }

    /*
    **********************************************
    
    ***********************************************
     */
    /**
     * TREURE EQUIPS A ESPAIS
     *
     * @param codiEspai
     * @param codiEquip
     * @param request
     * @param response
     * @return Carrega la mateixa visa espai amb la informació actualizada dels
     * equips retirats.
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     * @throws Exception
     */
    @RequestMapping("/eliminarEquipEspai")
    public String deleteEquipEspais(@RequestParam("codiEspai") String codiEspai, @RequestParam("codiEquip") String codiEquip, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {

        espaiService.deleteEquipEspai(codiEquip);
        /**
         * Actualiza l'estat de l'equip en Servei
         */
        Equip equip = equipService.getEquipByCodi(codiEquip);
        equip.setEstat("Stock");
        equipService.updateEquip(equip);

        /**
         * Afegir a la taula espais_equips el codi de l'espai i l'id de l'equip
         * Afegit) Retorna a la mateixa pagina d'espai amb informacio
         * actualitzada. L'equip seleccionat hauria d'apareixer a dalt (ha pasat
         * a estat Servei)
         */
        return "redirect:/espais/espai?codi=" + codiEspai;
    }
}
