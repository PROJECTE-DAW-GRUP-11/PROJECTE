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

    @Autowired
    EquipService equipService;

    @Autowired
    EspaiService espaiService;


    public Equip equip = new Equip();


    /*TOTES ELS EQUIPS*/
    @RequestMapping("/llistar")
    public ModelAndView allEquips(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("equips/equips");
        modelview.getModelMap().addAttribute("equips", equipService.getAllEquips());
        return modelview;
    }

    /*AFEGIR EQUIP */
    @RequestMapping("/afegir")
    public ModelAndView addEquip(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("equips/nouEquip");
        Equip formEquip = null;
        formEquip = new Equip();
        modelview.getModelMap().addAttribute("formNouEquip", formEquip);
        return modelview;
    }

    /*PANTALLA PER codi  --> AIXÒ CREARÀ UN OBJECTE PANTALLA AL CARREGAR LA PAGINA */
    @RequestMapping("/equip")
    public ModelAndView getEquipByCodi(@RequestParam("codi") String codi, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        ModelAndView modelview = new ModelAndView("equips/equip");
        Equip formEquip = null;
        if (codi != "") {
            equip = equipService.getEquipByCodi(codi);//GUARDA EQUIP CARREGAT EN UN OBJECTE equip
            formEquip = equipService.getEquipByCodi(codi);//GUARDA LES DADES PER ACTUALITZAR L'EQUIP A processEquipForm
        } else {
            formEquip = new Equip();
        }
        modelview.getModelMap().addAttribute("formEquip", formEquip);
        
        /*Mostrar llistat d'espais */
        List<Espai> espais = null;
        espais = espaiService.getAllEspais();
        if (espais != null) {
            modelview.getModelMap().addAttribute("espais", espais);
        }

        /*Mostra espai equip assignat si l'equip es troba en servei*/
        if (equip.getEstat().equals("Servei")) {
            String espaiAssignat = equipService.getCodiEspaiAssignat(codi);
            modelview.getModelMap().addAttribute("espaiAssignat", espaiAssignat);

        }

        return modelview;
    }

    /* 
    **********************************************************************************************************************
    AQUEST BLOC APLICA CONTROLADOR EN EL FORMULARI D'EQUIP: Actualitza les dades de l'equip llegint informació el formulari
        - Per editar un equip a través del formulari de equip.jsp
        - Per eliminar un equip a través del formulari equip.jsp
     */
    
 /*ACTUALITZA EQUIP LLEGINT LES DADES DEL FORMULARI  */
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

    /*ELIMINAR EQUIP */
    @RequestMapping(value = "/equip", method = RequestMethod.POST, params = "eliminar")
    public String deleteEquip() throws Exception {
        equipService.deleteEquip(equip);
        return "redirect:/equips/llistar";
    }
       


    /*CREAR EQUIP --> nouEquip.jsp */
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
