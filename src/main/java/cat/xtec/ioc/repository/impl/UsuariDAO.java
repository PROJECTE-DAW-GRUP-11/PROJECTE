package cat.xtec.ioc.repository.impl;

import cat.xtec.ioc.domain.Usuari;
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
import org.springframework.stereotype.Repository;
import cat.xtec.ioc.repository.UsuariRepository;
import cat.xtec.ioc.service.UsuariService;

@Repository
public class UsuariDAO implements UsuariRepository {

    private Dbconnection dBConnection;
    private Connection connection;

    private UsuariService usuariService;

    public UsuariDAO(Dbconnection dBConnection) {
        this.dBConnection = dBConnection;
    }

    public UsuariDAO() {
        try {
            dBConnection = (Dbconnection) new InitialContext().lookup("java:global/PROJECTE/Dbconnection");
            dBConnection.setConnectionFile("db.properties");
        } catch (NamingException ex) {
            Logger.getLogger(UsuariServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Usuari getUsuariById(String idUsuari) throws Exception {

        String qry = "select * from usuaris where idusuari ='" + idUsuari + "'";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
        return findUniqueResult(preparedStatement);

    }

    @Override
    public Usuari getUsuariByName(String nom) throws Exception {
        String qry = "select * from usuaris where nom ='" + nom + "'";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
        return findUniqueResult(preparedStatement);

    }

    @Override
    public List<Usuari> getAllUsuaris() throws SQLException {

        String qry = "select * from usuaris";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
        List<Usuari> users = executeQuery(preparedStatement);
        return users;
    }

    @Override
    public void addUsuari(Usuari usuari) throws Exception {


            String qry = "INSERT INTO usuaris(idusuari,nom,cognoms,password,email,rol,telefon) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement = getPreparedStatement(qry);
            preparedStatement.setString(1, usuari.getIdUsuari().toUpperCase());
            preparedStatement.setString(2, usuari.getNom());
            preparedStatement.setString(3, usuari.getCognoms());
            preparedStatement.setString(4, usuari.getPassword());
            preparedStatement.setString(5, usuari.getEmail());
            preparedStatement.setString(6, usuari.getRol());
            preparedStatement.setString(7, usuari.getTelefon());

            createOrUpdateUsuaris(usuari.getIdUsuari(), preparedStatement);

        

    }

    @Override
    public void updateUsuari(Usuari usuari) throws Exception {
        System.out.println("Entro a update usuari");
        System.out.println(usuari.getIdUsuari());
        String qry = "DELETE FROM usuaris WHERE idusuari = '" + usuari.getIdUsuari() + "'";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
        createOrUpdateUsuaris(usuari.getIdUsuari(), preparedStatement);
        addUsuari(usuari);

    }

    @Override
    public void deleteUsuari(Usuari usuari) throws Exception {
        System.out.println("Entro a eliminar usuari");
        System.out.println(usuari.getIdUsuari());
        String qry = "DELETE FROM usuaris WHERE idusuari = '" + usuari.getIdUsuari() + "'";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
        createOrUpdateUsuaris(usuari.getIdUsuari(), preparedStatement);
    }

    private Usuari createOrUpdateUsuaris(String idUsuari, PreparedStatement preparedStatement) throws Exception {

        int result = executeUpdateQuery(preparedStatement);
        return getUsuariById(idUsuari);
    }

    private Usuari findUniqueResult(PreparedStatement preparedStatement) throws Exception {

        List<Usuari> usuaris = executeQuery(preparedStatement);

        if (usuaris.isEmpty()) {
            return null;
        }
        if (usuaris.size() > 1) {
            throw new Exception("Only one result expected");
        }
        return usuaris.get(0);
    }

    private List<Usuari> executeQuery(PreparedStatement preparedStatement) {

        List<Usuari> usuaris = new ArrayList<Usuari>();
        try (
                ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                Usuari usuari = buildUsuariFromResultSet(rs);
                usuaris.add(usuari);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuaris;
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

    private Usuari buildUsuariFromResultSet(ResultSet rs) throws SQLException {
        /*
        Objectiu: retorna un nou objecte de usuari a partir del de ResultSet        
         */
        String idUsuari = rs.getString("idusuari");
        String nom = rs.getString("nom");
        String cognoms = rs.getString("cognoms");
        String password = rs.getString("password");
        String email = rs.getString("email");
        String rol = rs.getString("rol");
        String telefon = rs.getString("telefon");

        Usuari usuari = new Usuari(idUsuari, nom, cognoms, password, email, rol, telefon);
        return usuari;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<Usuari> getUsuarisByRol(String rol) throws SQLException {
         String qry = "select * from usuaris where rol ='"+ rol +"' ";
        PreparedStatement preparedStatement = getPreparedStatement(qry);
         List<Usuari> users = executeQuery(preparedStatement);
        return users;
    }

}
