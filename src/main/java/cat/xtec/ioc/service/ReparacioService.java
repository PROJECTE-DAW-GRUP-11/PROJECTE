package cat.xtec.ioc.service;

import cat.xtec.ioc.domain.Reparacio;
import java.sql.SQLException;
import java.util.List;

public interface ReparacioService {

    Reparacio getReparacioById(int idReparacio) throws Exception;

    List<Reparacio> getAllReparacions() throws SQLException;

    void addReparacio(Reparacio reparacio) throws Exception;
    
    void updateReparacio(Reparacio reparacio) throws Exception;

}
