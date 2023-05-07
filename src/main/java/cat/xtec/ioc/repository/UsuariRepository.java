package cat.xtec.ioc.repository;

import cat.xtec.ioc.domain.Usuari;
import java.sql.SQLException;
import java.util.List;

public interface UsuariRepository {
    
    Usuari getUsuariById(String idUsuari) throws Exception;

    Usuari getUsuariByName(String nom) throws Exception;    
   
    List<Usuari> getAllUsuaris() throws SQLException;  
    
    List<Usuari> getUsuarisByRol(String rol) throws SQLException;  
    
    void addUsuari(Usuari usuari)throws Exception;
    
    void updateUsuari(Usuari usuari)throws Exception;
    
    void deleteUsuari(Usuari usuari)throws Exception;
    
   
    
}
