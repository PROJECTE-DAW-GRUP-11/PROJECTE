/**
 * Classe java que actua de Controlador de Spring MVC que gestiona inici i tancament de l'aplicació.
 *
 * @author: Grup 11 - Xavi, Carlos, Ingrid, Denís
 * @version:05/2023
 */
package cat.xtec.ioc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    /**
     * GESTIONA L'INICI DE LA PAGINA.
     *
     * @param request Procesa peticions del tipus HTTP.
     * @param response Conté la resposta del servlet davant la petició.
     * @return modelview: Retorna una vista: \WEB-INF\views\equips\nouEquip.jsp.
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ModelAndView modelview = new ModelAndView("login");
        return modelview;
    }

    /**
     * GESTIONA EL TANCAMENT DE SESSIÓ DE L'USUARI.
     *
     * @param request Procesa peticions del tipus HTTP.
     * @param response Conté la resposta del servlet davant la petició.
     * @return modelview: Retorna una vista: \WEB-INF\views\equips\nouEquip.jsp.
     * @throws ServletException
     * @throws IOException
     */
    @GetMapping({"*/*/logout", "*/logout", "logout"})
    public String logout(HttpServletRequest request, SessionStatus session) {
        session.setComplete();
        request.getSession().invalidate();
        return "redirect:/";
    }

}
