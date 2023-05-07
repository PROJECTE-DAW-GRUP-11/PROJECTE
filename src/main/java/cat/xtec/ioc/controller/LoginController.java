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


/*
Controlador per la pantalla de login d'usuaris.
    - Comprova si l'usuari s'ha validat correctament al formulari de login de la pàgina principal index.jsp
    - Mostra les dades de l'usuari (nom, cognoms...)
    - Comprova el ROL de l'usuari i mostra opcions en funció del rol.
 */
@Controller
public class LoginController {

    @Autowired
    UsuariService usuariService;

    public Usuari usuari = new Usuari();

    //ACCEDEIX AL LOGIN SI S'HAN INTRODUIT CORRECTAMENT LES CREDENCIALS
    @RequestMapping("login")
    public ModelAndView login(HttpSession session, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        String idusuari = request.getParameter("idusuari");
        String password = request.getParameter("password");
        String message;
        System.out.println(idusuari);

        //CAPTURA USUARI PASSAT
        usuari = usuariService.getUsuariById(idusuari);

        //SI EL CAMP NO ES BUIT, L'USUARI NO ES NULL I COINCIDEIX AMB ELS USUARIS REGISTRATS PASSA A PANTALLA LOGIN OPCIONS
        if (idusuari != null
                && !idusuari.equals("")
                && usuari != null
                && idusuari.equals(usuari.getIdUsuari())
                && password != null
                && !password.equals("")
                && password.equals(usuari.getPassword())) {

            //MOSTRA LES DADES DE L'USUARI 
            message = "Welcome " + usuari.getNom() + ".";
            
            //ACTUA EN FUNCIÓ DEL ROL DE L'USUARI
            if ("Administrador".equals(usuari.getRol())) {
                ModelAndView modelview = new ModelAndView("/inici/administrador");
                 session.setAttribute("rol", usuari.getRol());
                session.setAttribute("usuari",usuari.getNom());
                session.setAttribute("cognoms",usuari.getCognoms());
                return modelview;

            }

            if ("Tecnic".equals(usuari.getRol())) {
                ModelAndView modelview = new ModelAndView("/inici/tecnic");
                session.setAttribute("usuari",usuari.getNom());
                session.setAttribute("cognoms",usuari.getCognoms());
                return modelview;

            }

            if ("Usuari".equals(usuari.getRol())) {
                ModelAndView modelview = new ModelAndView("/inici/usuari");
                session.setAttribute("id",usuari.getIdUsuari());
                session.setAttribute("usuari",usuari.getNom());
                session.setAttribute("cognoms",usuari.getCognoms());
                session.setAttribute("email", usuari.getEmail());
                session.setAttribute("telefon", usuari.getTelefon());
                session.setAttribute("password", usuari.getPassword());
                session.setAttribute("rol", usuari.getRol());
                
                return modelview;
            }

            return new ModelAndView("/usuari/frontPageUsuari",
                    "message", message);

        //SI L'USUARI NO ÉS CORRECTE RETORNA ERROR A LA PÀGINA PRINCIPAL
        } else {
            message = "Usuari o contrasenya incorrectes.";
            return new ModelAndView("login",
                    "message", message);
        }
    }


}
