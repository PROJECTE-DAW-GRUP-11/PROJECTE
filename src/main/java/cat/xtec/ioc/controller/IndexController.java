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

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ModelAndView modelview = new ModelAndView("login");
        //modelview.getModelMap().addAttribute("benvinguda", "Benvingut a la gestió de subsidis.");
        //modelview.getModelMap().addAttribute("imageCode", imageCode);
        return modelview;
    }
    
  
    @GetMapping({"*/*/logout","*/logout","logout"})
    public String logout(HttpServletRequest request, SessionStatus session) {
        session.setComplete();
        request.getSession().invalidate();
        return "redirect:/"; 
    }

}
