/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package cat.xtec.ioc.repository;

import cat.xtec.ioc.domain.Reserve;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Charlie-Home
 */
public interface ReserveRepository {
    
    List<Reserve> getAllReserves() throws SQLException;
    
    List<Reserve> getReservesBySala(String sala) throws Exception;
    
    List<Reserve> getReservesByUsuari(String usuari) throws Exception;
    
    Reserve getReserveByIdReserve(int idReserve)throws Exception;
    
    void addReserve(Reserve reserve) throws Exception;

    void updateReserve(Reserve reserve) throws Exception;

    void deleteReserve(Reserve reserve) throws Exception;
    
}
