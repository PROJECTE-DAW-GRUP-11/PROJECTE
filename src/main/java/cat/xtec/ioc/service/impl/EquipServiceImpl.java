/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cat.xtec.ioc.service.impl;

import cat.xtec.ioc.domain.Equip;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cat.xtec.ioc.repository.EquipRepository;
import cat.xtec.ioc.service.EquipService;

@Service
public class EquipServiceImpl implements EquipService {

    @Autowired
    private EquipRepository equipRepository;

    @Override
    public Equip getEquipByCodi(String codi) {
        try {
            return equipRepository.getEquipByCodi(codi);
        } catch (Exception ex) {
            Logger.getLogger(EquipServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Equip getEquipByTipus(String tipus) {
        try {
            return equipRepository.getEquipByTipus(tipus);
        } catch (Exception ex) {
            Logger.getLogger(EquipServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Equip getEquipByNumSerie(String numserie) {
        try {
            return equipRepository.getEquipByNumSerie(numserie);
        } catch (Exception ex) {
            Logger.getLogger(EquipServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Equip> getEquipByEstat(String estat) {
        try {
            return equipRepository.getEquipByEstat(estat);
        } catch (Exception ex) {
            Logger.getLogger(EquipServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public String getCodiEspaiAssignat(String codiEquip) {
        try {
            return equipRepository.getCodiEspaiAssignat(codiEquip);
        } catch (Exception ex) {
            Logger.getLogger(EquipServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    @Override
    public List<Equip> getAllEquips() throws SQLException {
        return equipRepository.getAllEquips();
    }

    @Override
    public List<Equip> getEquipsByMarca(String marca) throws Exception {
        return equipRepository.getEquipsByMarca(marca);
    }

    @Override
    public void addEquip(Equip equip) throws Exception {
        equipRepository.addEquip(equip);
    }

    @Override
    public void updateEquip(Equip equip) throws Exception {
        equipRepository.updateEquip(equip);
    }

    @Override
    public void deleteEquip(Equip equip) throws Exception {
        equipRepository.deleteEquip(equip);
    }

}
