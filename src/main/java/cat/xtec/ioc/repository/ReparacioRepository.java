package cat.xtec.ioc.repository;

import cat.xtec.ioc.domain.Reparacio;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public interface ReparacioRepository {

    Reparacio getReparacioById(int idReparacio) throws Exception;

    List<Reparacio> getAllReparacions() throws SQLException;

    void addEquipReparacio(Reparacio reparacio) throws Exception;
    
    void updateReparacio(Reparacio reparacio) throws Exception;
    
}
