/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.xtec.ioc.service.impl;

import cat.xtec.ioc.domain.Reserve;
import cat.xtec.ioc.repository.ReserveRepository;
import cat.xtec.ioc.service.ReserveService;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Charlie-Home
 */
@Service
public class ReserveServiceImpl implements ReserveService{
    
     @Autowired
    private ReserveRepository reserveRepository;

    @Override
    public List<Reserve> getAllReserves() throws SQLException {
  return reserveRepository.getAllReserves();
    }

    @Override
    public List<Reserve> getReservesBySala(String sala) throws Exception {
     return reserveRepository.getReservesBySala(sala);
    }

    @Override
    public List<Reserve> getReservesByUsuari(String usuari) throws Exception {
       return reserveRepository.getReservesByUsuari(usuari);
    }

    @Override
    public Reserve getReserveByIdReserve(int idReserve) throws Exception {
       return reserveRepository.getReserveByIdReserve(idReserve);
    }

    @Override
    public void addReserve(Reserve reserve) throws Exception {
        reserveRepository.addReserve(reserve);
    }

    @Override
    public void updateReserve(Reserve reserve) throws Exception {
        reserveRepository.updateReserve(reserve);
    }

    @Override
    public void deleteReserve(Reserve reserve) throws Exception {
        reserveRepository.deleteReserve(reserve);
    }
    
}
