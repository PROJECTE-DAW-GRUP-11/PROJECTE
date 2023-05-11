/**
 * Classe encarregada de manipular la BD reparacions.
 *
 * @author: Grup 11 - Xavi, Carlos, Ingrid, Denís
 * @version:05/2023
 */
package cat.xtec.ioc.repository.impl;

import cat.xtec.ioc.domain.Reparacio;
import cat.xtec.ioc.repository.ReparacioRepository;
import cat.xtec.ioc.service.impl.UsuariServiceImpl;
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

import cat.xtec.ioc.service.ReparacioService;

@Repository
public class ReparacioDAO implements ReparacioRepository {

    private Dbconnection dBConnection;
    private Connection connection;

    @Autowired
    ReparacioService reparacioService;

    public ReparacioDAO(Dbconnection dBConnection) {
        this.dBConnection = dBConnection;
    }

    public ReparacioDAO() {
        try {
            dBConnection = (Dbconnection) new InitialContext().lookup("java:global/PROJECTE/Dbconnection");
            dBConnection.setConnectionFile("db.properties");
        } catch (NamingException ex) {
            Logger.getLogger(UsuariServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * OBTENIR REPARACIÓ PER ID
     *
     * @param idReparacio
     * @return reparacio
     * @throws Exception
     */
    @Override
    public Reparacio getReparacioById(int idReparacio) throws Exception {

        String qry = "select * from reparacions where idreparacio ='" + idReparacio + "'";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
        return findUniqueResult(preparedStatement);

    }

    /**
     * OBTENIR TOTES LES REPARACIONS
     *
     * @return llistat de reparacions
     * @throws SQLException
     */
    @Override
    public List<Reparacio> getAllReparacions() throws SQLException {

        String qry = "select * from reparacions";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
        List<Reparacio> reparacions = executeQuery(preparedStatement);
        return reparacions;
    }

    /**
     * CREAR UNA NOVA REPRACIÓ
     *
     * @param reparacio
     * @throws Exception
     */
    @Override
    public void addEquipReparacio(Reparacio reparacio) throws Exception {
        System.out.println("Entro a addEquipReparacio de ReparacioDAO");
        String qry = "INSERT INTO reparacions(idequip,datainici,datafi,comentaris,tecnic,comentaritancament,estat) VALUES (?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
        preparedStatement.setString(1, reparacio.getIdEquip());
        preparedStatement.setString(2, reparacio.getDataInici());
        preparedStatement.setString(3, reparacio.getDataFi());
        preparedStatement.setString(4, reparacio.getComentaris());
        preparedStatement.setString(5, reparacio.getTecnic());
        preparedStatement.setString(6, reparacio.getComentariTancament());
        preparedStatement.setString(7, reparacio.getEstat());
        createOrUpdateReparacions(reparacio.getIdReparacio(), preparedStatement);
    }

    /**
     * ACTUALTIZAR UNA REPARACIÓ
     *
     * @param reparacio
     * @throws Exception
     */
    public void updateReparacio(Reparacio reparacio) throws Exception {
        System.out.println("Entro a updateReparacio de ReparacioDAO");
        String qry = "UPDATE reparacions SET idequip = ?, datainici = ?, datafi = ?, comentaris = ?, tecnic = ?, comentaritancament = ?, estat = ? WHERE idreparacio = '" + reparacio.getIdReparacio() + "'";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
        preparedStatement.setString(1, reparacio.getIdEquip());
        preparedStatement.setString(2, reparacio.getDataInici());
        preparedStatement.setString(3, reparacio.getDataFi());
        preparedStatement.setString(4, reparacio.getComentaris());
        preparedStatement.setString(5, reparacio.getTecnic());
        preparedStatement.setString(6, reparacio.getComentariTancament());
        preparedStatement.setString(7, reparacio.getEstat());
        createOrUpdateReparacions(reparacio.getIdReparacio(), preparedStatement);
    }

    private Reparacio createOrUpdateReparacions(int idReparacio, PreparedStatement preparedStatement) throws Exception {

        int result = executeUpdateQuery(preparedStatement);
        return getReparacioById(idReparacio);
    }

    private Reparacio findUniqueResult(PreparedStatement preparedStatement) throws Exception {

        List<Reparacio> reparacions = executeQuery(preparedStatement);

        if (reparacions.isEmpty()) {
            return null;
        }
        if (reparacions.size() > 1) {
            throw new Exception("Only one result expected");
        }
        return reparacions.get(0);
    }

    private List<Reparacio> executeQuery(PreparedStatement preparedStatement) {

        List<Reparacio> reparacions = new ArrayList<Reparacio>();
        try (
                ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                Reparacio reparacio = buildUsuariFromResultSet(rs);
                reparacions.add(reparacio);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reparacions;
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

    /**
     * INSEREIX INFORMACIÓ REPARACIÓ A BD
     * @param rs
     * @return reparacio
     * @throws SQLException 
     */
    private Reparacio buildUsuariFromResultSet(ResultSet rs) throws SQLException {
        int idReparacio = rs.getInt("idReparacio");
        String idEquip = rs.getString("idEquip");
        String dataInici = rs.getString("datainici");
        String dataFi = rs.getString("datafi");
        String comentaris = rs.getString("comentaris");
        String tecnic = rs.getString("tecnic");
        String comentariTancament = rs.getString("comentariTancament");
        String estat = rs.getString("estat");

        Reparacio reparacio = new Reparacio(idReparacio, idEquip, dataInici, dataFi, comentaris, tecnic, comentariTancament, estat);
        return reparacio;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

}
