/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.xtec.ioc.controller;

import cat.xtec.ioc.domain.Reserve;
import cat.xtec.ioc.service.EspaiService;
import cat.xtec.ioc.service.ReserveService;
import cat.xtec.ioc.service.UsuariService;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Charlie-Home
 */
@Controller
@RequestMapping("/reserves")
public class ReserveController {
    
    @Autowired
    ReserveService reserveService;
    
    @Autowired
    EspaiService espaiService;
    
    @Autowired
    UsuariService usuariService;
    
      //RETORNA TOTES LES REPARACIONS
    @RequestMapping("/llistar")
    public ModelAndView allReserves(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        ModelAndView modelview = new ModelAndView("reserves/reserves");
        
       String usuari=(String) request.getSession().getAttribute("id");
        if (usuari != null) {
            modelview.getModelMap().addAttribute("reservesusuari", reserveService.getReservesByUsuari(usuari));
          //   modelview.getModelMap().addAttribute("reserves", reserveService.getAllReserves());
        } 

        modelview.getModelMap().addAttribute("sales", espaiService.getAllEspais());
        return modelview;
    }
    
     @RequestMapping("/reservesSala")
    public ModelAndView reservesSala(@RequestParam("idsala") String idSala,
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        
        ModelAndView modelview = new ModelAndView("reserves/reserve");
        
            if (idSala != null) {
                modelview.getModelMap().addAttribute("reserves", reserveService.getReservesBySala(idSala));
            } 
        
         modelview.getModelMap().addAttribute("idsala", idSala);
        
        return modelview;
    }

  @RequestMapping("/reserveNova")
    public ModelAndView reserveNova(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {

String idUsuario=request.getParameter("idusuari");
String idSala=request.getParameter("idsala");
int setmana=Integer.parseInt(request.getParameter("setmana"));
int hora=Integer.parseInt(request.getParameter("hora"));
String dia=request.getParameter("dia");
int temps=Integer.parseInt(request.getParameter("temps"));

Reserve reserve=new Reserve();
reserve.setIdUsuari(idUsuario);
reserve.setIdSala(idSala);
reserve.setSetmana(setmana);
reserve.setDia(dia);
reserve.setTemps(temps);
reserve.setHora(hora);


if(idUsuario!="null"){
    reserveService.addReserve(reserve);

}


ModelAndView modelview = new ModelAndView("reserves/reserve");
      modelview.getModelMap().addAttribute("idsala", idSala);
         modelview.getModelMap().addAttribute("reserves", reserveService.getReservesBySala(idSala));
         


       return modelview;

}
 @RequestMapping("/eliminarReserva")
    public String eliminarReserve(@RequestParam("idreserve") String idReserve
            ,HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        
        
        Reserve reserve=new Reserve();
        
        reserve.setIdReserve(Integer.parseInt(idReserve));
        
  reserveService.deleteReserve(reserve);

        return "redirect:/reserves/llistar";
    }
}
