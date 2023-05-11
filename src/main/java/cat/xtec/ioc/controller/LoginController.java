/**
 *Classe java que actua de Controlador de Spring MVC per gestionar el login de l'usuari.
 * Comprova si l'usuari s'ha validat correctament al formulari de login de la pàgina principal index.jsp
 * Comprova el ROL de l'usuari i mostra opcions en funció del rol.
 * Mostra les dades de l'usuari (nom, cognoms...)
 *
 * @author: Grup 11 - Xavi, Carlos, Ingrid, Denís
 * @version:05/2023
 */
package cat.xtec.ioc.controller;

import cat.xtec.ioc.domain.Usuari;
import cat.xtec.ioc.service.UsuariService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

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
     * ACCEDEIX AL LOGIN SI S'HAN INTRODUIT CORRECTAMENT LES CREDENCIALS
     *
     * @param session
     * @param request
     * @param response
     * @return vista en funcio el rol:
     * \WEB-INF\views\inici\**ROL(usuari,administrador,tecnic).jsp
     * @throws Exception
     */
    @RequestMapping("login")
    public ModelAndView login(HttpSession session, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        String idusuari = request.getParameter("idusuari").toUpperCase();
        String password = request.getParameter("password");
        String message;
        System.out.println(idusuari);

        /**
         * CAPTURA USUARI PASSAT
         */
        usuari = usuariService.getUsuariById(idusuari);

        /**
         * SI EL CAMP NO ES BUIT, L'USUARI NO ES NULL I COINCIDEIX AMB ELS
         * USUARIS REGISTRATS PASSA A PANTALLA LOGIN OPCIONS
         */
        if (idusuari != null
                && !idusuari.equals("")
                && usuari != null
                && idusuari.equals(usuari.getIdUsuari())
                && password != null
                && !password.equals("")
                && password.equals(usuari.getPassword())) {

            message = "Welcome " + usuari.getNom() + ".";

            /**
             * ACTUA EN FUNCIÓ DEL ROL DE L'USUARI
             */
            if ("Administrador".equals(usuari.getRol())) {
                ModelAndView modelview = new ModelAndView("/inici/administrador");
                session.setAttribute("id", usuari.getIdUsuari());
                session.setAttribute("usuari", usuari.getNom());
                session.setAttribute("cognoms", usuari.getCognoms());
                session.setAttribute("email", usuari.getEmail());
                session.setAttribute("telefon", usuari.getTelefon());
                session.setAttribute("password", usuari.getPassword());
                session.setAttribute("rol", usuari.getRol());
                return modelview;

            }

            if ("Tecnic".equals(usuari.getRol())) {
                ModelAndView modelview = new ModelAndView("/inici/tecnic");
                session.setAttribute("id", usuari.getIdUsuari());
                session.setAttribute("usuari", usuari.getNom());
                session.setAttribute("cognoms", usuari.getCognoms());
                session.setAttribute("email", usuari.getEmail());
                session.setAttribute("telefon", usuari.getTelefon());
                session.setAttribute("password", usuari.getPassword());
                session.setAttribute("rol", usuari.getRol());
                return modelview;

            }

            if ("Usuari".equals(usuari.getRol())) {
                ModelAndView modelview = new ModelAndView("/inici/usuari");
                session.setAttribute("id", usuari.getIdUsuari());
                session.setAttribute("usuari", usuari.getNom());
                session.setAttribute("cognoms", usuari.getCognoms());
                session.setAttribute("email", usuari.getEmail());
                session.setAttribute("telefon", usuari.getTelefon());
                session.setAttribute("password", usuari.getPassword());
                session.setAttribute("rol", usuari.getRol());

                return modelview;
            }

            return new ModelAndView("/usuari/frontPageUsuari",
                    "message", message);

            /**
             * SI L'USUARI NO ÉS CORRECTE RETORNA ERROR A LA PÀGINA PRINCIPAL
             */
        } else {
            message = "Usuari o contrasenya incorrectes.";
            return new ModelAndView("login",
                    "message", message);
        }
    }

}
