package cat.xtec.ioc.repository;

import cat.xtec.ioc.domain.Equip;
import cat.xtec.ioc.domain.Espai;
import java.sql.SQLException;
import java.util.List;

public interface EspaiRepository {

    Espai getEspaiByCodi(String codi) throws Exception;

    Espai getEspaiByPlanta(int planta) throws Exception;

    Espai getEspaiByZona(String zona) throws Exception;

    Espai getEspaiByPosicio(int posicio) throws Exception;

    List<Espai> getAllEspais() throws SQLException;

    void addEspai(Espai espai) throws Exception;

    void deleteEspai(Espai espai) throws Exception;

    void updateEspai(Espai espai) throws Exception;

    /*Gestiona equips assignats a espais */
    
    void addEquipEspai(String codiEspai, String codiEquip) throws Exception;

    List<Equip> getEquipsAssignats(String codiEspai) throws SQLException;
    
    void deleteEquipEspai(String codiEquip) throws Exception;
    

}
