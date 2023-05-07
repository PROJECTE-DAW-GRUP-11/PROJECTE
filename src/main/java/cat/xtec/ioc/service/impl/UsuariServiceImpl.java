/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cat.xtec.ioc.service.impl;

import cat.xtec.ioc.domain.Usuari;
import cat.xtec.ioc.domain.Usuari;
import cat.xtec.ioc.repository.UsuariRepository;
import cat.xtec.ioc.repository.UsuariRepository;
import cat.xtec.ioc.service.UsuariService;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UsuariServiceImpl implements UsuariService{
    @Autowired
    private UsuariRepository usuariRepository;

    @Override
    public Usuari getUsuariById(String idUsuari){        
        try {
            return usuariRepository.getUsuariById(idUsuari);
        } catch (Exception ex) {
            Logger.getLogger(UsuariServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }    
    
    @Override
    public Usuari getUsuariByName(String nom){
         try {
            return usuariRepository.getUsuariByName(nom);
        } catch (Exception ex) {
            Logger.getLogger(UsuariServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Usuari> getAllUsuaris() throws SQLException {
        return usuariRepository.getAllUsuaris();
    }

    @Override
    public void addUsuari(Usuari usuari) throws Exception {

        usuariRepository.addUsuari(usuari);
    }
    
    @Override
    public void updateUsuari(Usuari usuari) throws Exception {
        usuariRepository.updateUsuari(usuari);
    }
    
    @Override
    public void deleteUsuari(Usuari usuari)throws Exception{
        usuariRepository.deleteUsuari(usuari);
    }

    @Override
    public List<Usuari> getUsuarisByRol(String rol) throws SQLException {
       return usuariRepository.getUsuarisByRol(rol);
    }
    
}
