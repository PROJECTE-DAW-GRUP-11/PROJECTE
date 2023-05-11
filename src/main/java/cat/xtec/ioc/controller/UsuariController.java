/**
 * Classe java que actua de Controlador de Spring MVC per gestionar usuaris
 * Permet crear llistar, modificar i carregar perfils d'usuari.
 *
 * @author: Grup 11 - Xavi, Carlos, Ingrid, Denís
 * @version:05/2023
 *
 */
package cat.xtec.ioc.controller;

import cat.xtec.ioc.domain.*;
import cat.xtec.ioc.service.UsuariService;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/usuaris")
public class UsuariController {

    /**
     * Injecció dels serveis
     */
    @Autowired
    UsuariService usuariService;

    /**
     * Carrega un objecte usuari per treballar amb ell
     */
    public Usuari usuari = new Usuari();

    /**
     * MÉTODE PER LLISTAR USUARI
     *
     * @param request
     * @param response
     * @return modelview vista: usuaris.jsp
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/llistar")
    public ModelAndView allUsuaris(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("usuari/usuaris");
        modelview.getModelMap().addAttribute("usuaris", usuariService.getAllUsuaris());
        return modelview;
    }

    /**
     * MÉTODE PER AFEGIR UN USUARI
     *
     * @param request
     * @param response
     * @return modelview vista: nouUsuari.jsp
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/afegir")
    public ModelAndView addUsuari(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("usuari/nouUsuari");

        Usuari formUsuari = null;

        formUsuari = new Usuari();

        modelview.getModelMap().addAttribute("formNouUsuari", formUsuari);

        return modelview;
    }

    /**
     * MÉTODE PER ELIMINAR UN USUARI
     *
     * @param idUsuari
     * @param request
     * @param response
     * @return redirecciona a llistat d'usuaris.
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     * @throws Exception
     */
    @RequestMapping("/eliminar")
    public String deleteUserFromList(@RequestParam("idusuari") String idUsuari, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        ModelAndView modelview = new ModelAndView("usuari/usuari");
        if (idUsuari != "") {
            //GUARDA LES DADES OBTINGUDES A L'USUARI EN MEMORIA QUE S'ESTÀ TREBALLANT
            usuari = usuariService.getUsuariById(idUsuari);
            usuariService.deleteUsuari(usuari);
        }
        return "redirect:/usuaris/llistar";
    }

    //MODIFICAR UN USUARI
    @RequestMapping("/modificar")
    public ModelAndView getUsuariById(@RequestParam("idusuari") String idUsuari, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        ModelAndView modelview = new ModelAndView("usuari/usuari");

        Usuari formUsuari = null;

        if (idUsuari != "") {
            /**
             * GUARDA LES DADES OBTINGUDES A L'USUARI EN MEMORIA QUE S'ESTÀ
             * TREBALLANT
             */
            usuari = usuariService.getUsuariById(idUsuari);

            /**
             * CARREGA LES DADES AL FORMULARI DE L'USUARI OBTINGUT
             */
            formUsuari = usuariService.getUsuariById(idUsuari);
        } else {

            formUsuari = new Usuari();
        }
        modelview.getModelMap().addAttribute("formUsuari", formUsuari);
        return modelview;
    }

    /**
     * CARREGA PÀGINA INICI PERFIL ADMINISTRADOR
     *
     * @param request
     * @param response
     * @return modelview vista administrador.jsp
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/administrador")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("inici/administrador");

        return modelview;
    }

    /**
     * CARREGA PÀGINA INICI PERFIL USUARI
     *
     * @param request
     * @param response
     * @return modelview vista usuari.jsp
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/user")
    public ModelAndView usuari(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("inici/usuari");

        return modelview;
    }

    /**
     * CARREGAR PÀGINA INICI PERFIL TÈCNIC
     *
     * @param request
     * @param response
     * @return movdelview vista tecnic.jsp
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/tecnic")
    public ModelAndView tecnic(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("inici/tecnic");

        return modelview;
    }

    /**
     * MOSTRA INFORMACIÓ I EL PERFIL DE L'USUARI
     *
     * @param request
     * @param response
     * @return modelview retorna vista perfil.jsp
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/perfil")
    public ModelAndView perfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("usuari/perfil");

        return modelview;
    }

    /**
     * MOSTRAR PÀGINA PRIVACITAT PERFIL
     *
     * @param request
     * @param response
     * @return modelview retorna vista: privacitat.jsp
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/privacitat")
    public ModelAndView privacitat(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ModelAndView modelview = new ModelAndView("usuari/privacitat");

        return modelview;
    }

    /**
     * AQUEST BLOC APLICA CONTROLADOR EN EL FORMULARI D'USUARI - Per editar un
     * usuari a través del formulari de usuari.jsp. - Per eliminar un usuari a
     * través del formulari usuari.jsp.
     */
    /**
     * Mostrar i actualitzar dades d'un usuari que es carreguen a formUsuari de
     * usuari.jsp
     *
     * @param formUsuari
     * @param result
     * @param session
     * @return en funció de si és administrador o Tècnic retorna redirigeix a
     * vistes diferents
     * @throws Exception
     */
    @RequestMapping(value = "/usuari", method = RequestMethod.POST, params = "desar")
    public String processForm(@ModelAttribute("formUsuari") Usuari formUsuari, BindingResult result, HttpSession session) throws Exception {

        /**
         * Captura el ROL de l'usuari que té sessió iniciada.
         */
        String rolUsuari = (String) session.getAttribute("rol");

        /**
         * Determina el rol de l'usuari que s'està editant (en cas de Usuari o
         * Tecnic aquest sinó quedaria a null al tenir el selector deshabilitat
         * a la pàgina usuari.jsp
         */
        if (rolUsuari.equals("Usuari") || rolUsuari.equals("Tecnic")) {
            formUsuari.setRol(rolUsuari);
        }

        usuariService.updateUsuari(formUsuari);

        /**
         * Si l'usuari loguejat és usuari normal al modificar el seu perfil
         * redirigeix a la pàgina per de visualització del perfil
         */
        if (!"Administrador".equals(rolUsuari)) {
            return "redirect:/usuaris/perfil";
            /**
             * Si l'usuari loguejat és Administrador, redirigeix a llistar
             * usuaris
             */
        } else {
            return "redirect:/usuaris/llistar";
        }
    }

    /**
     * BOTO ELIMINA USUARI 
     * @return redirecciona a /usuaris/llistar.jsp
     * @throws Exception 
     */
    @RequestMapping(value = "/usuari", method = RequestMethod.POST, params = "eliminar")
    public String deleteUsuari() throws Exception {
        usuariService.deleteUsuari(usuari);
        return "redirect:/usuaris/llistar";
    }

    /**
     * Per crear un usuari a través del formulari usuariNou.jsp
     * @param formUsuari
     * @param model
     * @param result
     * @return si l'usuari existeix dona error a la mateixa pàgina, sino retorna vista usuaris.jsp
     * @throws Exception 
     */
    @RequestMapping(value = "/nouUsuari", method = RequestMethod.POST, params = "desar")
    public String processFormNouUsuari(@ModelAttribute("formNouUsuari") Usuari formUsuari, Model model, BindingResult result) throws Exception {
        //Comprova si l'usuari ja existeix.
        String idUsuari = formUsuari.getIdUsuari().toUpperCase();
        Usuari usuariExisteix = usuariService.getUsuariById(idUsuari);

        if (usuariExisteix != null) {
            model.addAttribute("message", "Usuari ja existeix");
            return "usuari/nouUsuari";
        } else {
            usuariService.addUsuari(formUsuari);
            return "redirect:/usuaris/llistar";

        }
    }

}
