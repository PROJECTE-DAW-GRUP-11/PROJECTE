/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cat.xtec.ioc.service.impl;

import cat.xtec.ioc.domain.Reparacio;
import cat.xtec.ioc.repository.ReparacioRepository;
import cat.xtec.ioc.service.ReparacioService;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReparacioServiceImpl implements ReparacioService {

    @Autowired
    private ReparacioRepository reparacioRepository;

    @Override
    public Reparacio getReparacioById(int idReparacio) {
        try {

            return reparacioRepository.getReparacioById(idReparacio);
        } catch (Exception ex) {
            Logger.getLogger(ReparacioServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Reparacio> getAllReparacions() throws SQLException {
        return reparacioRepository.getAllReparacions();
    }

    @Override
    public void addReparacio(Reparacio reparacio) throws Exception {

        reparacioRepository.addEquipReparacio(reparacio);
    }
    
    @Override
    public void updateReparacio(Reparacio reparacio) throws Exception{
        reparacioRepository.updateReparacio(reparacio);
    }

}
