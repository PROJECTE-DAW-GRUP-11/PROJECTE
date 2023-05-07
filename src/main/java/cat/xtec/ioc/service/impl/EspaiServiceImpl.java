/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cat.xtec.ioc.service.impl;

import cat.xtec.ioc.domain.Equip;
import cat.xtec.ioc.domain.Espai;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cat.xtec.ioc.repository.EspaiRepository;
import cat.xtec.ioc.service.EspaiService;

@Service
public class EspaiServiceImpl implements EspaiService {

    @Autowired
    private EspaiRepository espaiRepository;

    @Override
    public Espai getEspaiByCodi(String codi) {
        try {
            return espaiRepository.getEspaiByCodi(codi);
        } catch (Exception ex) {
            Logger.getLogger(EspaiServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Espai getEspaiByPlanta(int planta) {
        try {
            return espaiRepository.getEspaiByPlanta(planta);
        } catch (Exception ex) {
            Logger.getLogger(EspaiServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Espai getEspaiByZona(String zona) {
        try {
            return espaiRepository.getEspaiByZona(zona);
        } catch (Exception ex) {
            Logger.getLogger(EspaiServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Espai getEspaiByPosicio(int posicio) {
        try {
            return espaiRepository.getEspaiByPosicio(posicio);
        } catch (Exception ex) {
            Logger.getLogger(EspaiServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Espai> getAllEspais() throws SQLException {
        return espaiRepository.getAllEspais();
    }

    @Override
    public void addEspai(Espai espai) throws Exception {
        espaiRepository.addEspai(espai);
    }

    @Override
    public void deleteEspai(Espai espai) throws Exception {
        espaiRepository.deleteEspai(espai);
    }

    @Override
    public void updateEspai(Espai espai) throws Exception {
        espaiRepository.updateEspai(espai);
    }

    /*Gestiona equips assignats a espais */
    @Override
    public void addEquipEspai(String codiEspai, String codiEquip) throws Exception {
        espaiRepository.addEquipEspai(codiEspai, codiEquip);
    }

    @Override
    public List<Equip> getEquipsAssignats(String codiEspai) throws SQLException {
        return espaiRepository.getEquipsAssignats(codiEspai);
    }
    
    @Override
    public void deleteEquipEspai(String codiEquip) throws Exception{
        
        espaiRepository.deleteEquipEspai(codiEquip);
    }
}
