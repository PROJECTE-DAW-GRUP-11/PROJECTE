package cat.xtec.ioc.service;

import cat.xtec.ioc.domain.Equip;
import cat.xtec.ioc.domain.Espai;
import java.sql.SQLException;
import java.util.List;

public interface EspaiService {
    
    Espai getEspaiByCodi(String codi) throws Exception;
    
    Espai getEspaiByPlanta(int planta) throws Exception;
    
    Espai getEspaiByZona(String zona) throws Exception;
    
    Espai getEspaiByPosicio(int posicio) throws Exception;

    List<Espai> getAllEspais() throws SQLException;

    public void addEspai(Espai espai) throws Exception;

    public void deleteEspai(Espai espai) throws Exception;

    public void updateEspai(Espai espai) throws Exception;
    
    /*Gestiona equips assignats a espais */
    
    public void addEquipEspai(String codiEspai, String codiEquip) throws Exception;
    
    List<Equip> getEquipsAssignats(String codiEspai) throws SQLException;
    
    public void deleteEquipEspai( String codiEquip) throws Exception;

}
