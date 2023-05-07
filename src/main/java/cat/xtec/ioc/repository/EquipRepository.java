package cat.xtec.ioc.repository;

import cat.xtec.ioc.domain.Equip;
import java.sql.SQLException;
import java.util.List;

public interface EquipRepository {

    Equip getEquipByCodi(String codi) throws Exception;

    Equip getEquipByTipus(String tipus) throws Exception;

    Equip getEquipByNumSerie(String numserie) throws Exception;

    List<Equip> getEquipByEstat(String estat) throws Exception;

    List<Equip> getAllEquips() throws SQLException;

    List<Equip> getEquipsByMarca(String marca) throws Exception;

    String getCodiEspaiAssignat(String codiEquip) throws Exception;

    void addEquip(Equip equip) throws Exception;

    void updateEquip(Equip equip) throws Exception;

    void deleteEquip(Equip equip) throws Exception;

}
