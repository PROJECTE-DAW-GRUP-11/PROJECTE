/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.xtec.ioc.repository.impl;

import cat.xtec.ioc.domain.Reserve;
import cat.xtec.ioc.repository.ReserveRepository;
import cat.xtec.ioc.service.ReserveService;
import cat.xtec.ioc.service.impl.ReserveServiceImpl;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Charlie-Home
 */
@Repository
public class ReserveDAO implements ReserveRepository {

      private Dbconnection dBConnection;

    private Connection connection;
    
      @Autowired
    ReserveService reserveService;

    public ReserveDAO(Dbconnection dBConnection) {

        this.dBConnection = dBConnection;

    }

    public ReserveDAO() {

        try {

            dBConnection = (Dbconnection) new InitialContext().lookup("java:global/PROJECTE/Dbconnection");

            dBConnection.setConnectionFile("db.properties");

        } catch (NamingException ex) {

            Logger.getLogger(ReserveServiceImpl.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

    @Override
    public List<Reserve> getAllReserves() throws SQLException {
        String qry = "select * from reserves";

        PreparedStatement preparedStatement = getPreparedStatement(qry);

        List<Reserve> reserves = executeQuery(preparedStatement);

        return reserves;
    }

    @Override
    public List<Reserve> getReservesBySala(String idSala) throws Exception {
         String qry = "select * from reserves where idsala ='" + idSala + "' ";

        PreparedStatement preparedStatement = getPreparedStatement(qry);

        List<Reserve> reserves = executeQuery(preparedStatement);

        return reserves;
    }

    @Override
    public List<Reserve> getReservesByUsuari(String idUsuari) throws Exception {
        String qry = "select * from reserves where idusuari ='" + idUsuari + "' ";

        PreparedStatement preparedStatement = getPreparedStatement(qry);

        List<Reserve> reserves = executeQuery(preparedStatement);

        return reserves;

    }

    @Override
    public Reserve getReserveByIdReserve(int idReserve) throws Exception {
         String qry = "select * from reserves where idreserve ='" + idReserve + "'";

        PreparedStatement preparedStatement = getPreparedStatement(qry);

        return findUniqueResult(preparedStatement);
    }

    @Override
    public void addReserve(Reserve reserve) throws Exception {
       String qry = "INSERT INTO reserves(idsala,idusuari,setmana,hora,temps,dia) VALUES (?,?,?,?,?,?)";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
        preparedStatement.setString(1, reserve.getIdSala());
        preparedStatement.setString(2, reserve.getIdUsuari());
        preparedStatement.setInt(3, reserve.getSetmana());
        preparedStatement.setInt(4, reserve.getHora());
        preparedStatement.setInt(5, reserve.getTemps());
        preparedStatement.setString(6, reserve.getDia());
        createOrUpdateReserve(reserve.getIdReserve(), preparedStatement);
    }

    @Override
    public void updateReserve(Reserve reserve) throws Exception {
        String qry = "DELETE FROM reserves WHERE idreserve = '" + reserve.getIdReserve() + "'";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
        createOrUpdateReserve(reserve.getIdReserve(), preparedStatement);
        addReserve(reserve);
    }

    @Override
    public void deleteReserve(Reserve reserve) throws Exception {
       String qry = "DELETE FROM reserves WHERE idreserve = '" + reserve.getIdReserve() + "'";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
        createOrUpdateReserve(reserve.getIdReserve(), preparedStatement);
    }
    
    
    
        private Reserve createOrUpdateReserve(int idReserve, PreparedStatement preparedStatement) throws Exception {

        int result = executeUpdateQuery(preparedStatement);
        return getReserveByIdReserve(idReserve);

    }

    private Reserve findUniqueResult(PreparedStatement preparedStatement) throws Exception {

        List<Reserve> reserves = executeQuery(preparedStatement);
        if (reserves.isEmpty()) {
            return null;
        }

        if (reserves.size() > 1) {

            throw new Exception("Only one result expected");

        }

        return reserves.get(0);

    }

    private List<Reserve> executeQuery(PreparedStatement preparedStatement) {

        List<Reserve> reserves = new ArrayList<Reserve>();

        try (
                ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {

                Reserve reserve = buildReserveFromResultSet(rs);

                reserves.add(reserve);

            }

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return reserves;

    }

    private PreparedStatement getPreparedStatement(String query) throws SQLException {

        if (getConnection() == null) {

            try {

                setConnection(dBConnection.getConnection());

            } catch (SQLException | IOException e) {

                e.printStackTrace();

            }

        }

        return getConnection().prepareStatement(query);

    }

    private int executeUpdateQuery(PreparedStatement preparedStatement) {

        int resultat = 0;

        if (getConnection() == null) {

            try {

                setConnection(dBConnection.getConnection());;

            } catch (SQLException | IOException e) {

                e.printStackTrace();

            }

        }

        try {

            resultat = preparedStatement.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return resultat;

    }

    private Reserve buildReserveFromResultSet(ResultSet rs) throws SQLException {

        int idReserve = rs.getInt("idreserve");

        String idSala = rs.getString("idsala");

        String idUsuari = rs.getString("idusuari");
        
         int setmana = rs.getInt("setmana");      

         int hora = rs.getInt("hora");
         
          int temps = rs.getInt("temps");
          
            String dia = rs.getString("dia");

        Reserve reserve = new Reserve(idReserve, idSala, idUsuari, setmana, dia, hora, temps);

        return reserve;

    }

    public Connection getConnection() {

        return connection;

    }

    public void setConnection(Connection connection) {

        this.connection = connection;

    }
}
