/** * Classe encarregada de manipular la BD Espai * * @author: Grup 11 - Xavi, Carlos, Ingrid, Denís * @version:05/2023 */package cat.xtec.ioc.repository.impl;import cat.xtec.ioc.domain.Equip;import cat.xtec.ioc.domain.Espai;import java.io.IOException;import java.sql.Connection;import java.sql.PreparedStatement;import java.sql.ResultSet;import java.sql.SQLException;import java.util.ArrayList;import java.util.List;import java.util.logging.Level;import java.util.logging.Logger;import javax.naming.InitialContext;import javax.naming.NamingException;import org.springframework.stereotype.Repository;import cat.xtec.ioc.repository.EspaiRepository;import cat.xtec.ioc.service.EquipService;import cat.xtec.ioc.service.impl.EspaiServiceImpl;import org.springframework.beans.factory.annotation.Autowired;@Repositorypublic class EspaiDAO implements EspaiRepository {    private Dbconnection dBConnection;    private Connection connection;    public EspaiDAO(Dbconnection dBConnection) {        this.dBConnection = dBConnection;    }    @Autowired    EquipService equipService;    public EspaiDAO() {        try {            dBConnection = (Dbconnection) new InitialContext().lookup("java:global/PROJECTE/Dbconnection");            dBConnection.setConnectionFile("db.properties");        } catch (NamingException ex) {            Logger.getLogger(EspaiServiceImpl.class.getName()).log(Level.SEVERE, null, ex);        }    }    /**     * OBTENIR UN ESPAI PER CODI     *     * @param codi     * @return espai     * @throws Exception     */    @Override    public Espai getEspaiByCodi(String codi) throws Exception {        String qry = "select * from espais where codi ='" + codi + "'";        PreparedStatement preparedStatement = getPreparedStatement(qry);        return findUniqueResult(preparedStatement);    }    /**     * OBTENIR UN ESPAI PER PLANTA     *     * @param planta     * @return espai     * @throws Exception     */    @Override    public Espai getEspaiByPlanta(int planta) throws Exception {        String qry = "select * from espais where planta ='" + planta + "'";        PreparedStatement preparedStatement = getPreparedStatement(qry);        return findUniqueResult(preparedStatement);    }    /**     * OBTENIR UN ESPAI PER POSICÍO     *     * @param posicio     * @return espai     * @throws Exception     */    @Override    public Espai getEspaiByPosicio(int posicio) throws Exception {        String qry = "select * from espais where posicio ='" + posicio + "'";        PreparedStatement preparedStatement = getPreparedStatement(qry);        return findUniqueResult(preparedStatement);    }    /**     * OBTENIR UN ESPAI PER ZONA     *     * @param zona     * @return espai     * @throws Exception     */    @Override    public Espai getEspaiByZona(String zona) throws Exception {        String qry = "select * from espais where zona ='" + zona + "'";        PreparedStatement preparedStatement = getPreparedStatement(qry);        return findUniqueResult(preparedStatement);    }    /**     * LLISTAR TOTS ELS ESPAIS     *     * @return llistat d'espais     * @throws SQLException     */    @Override    public List<Espai> getAllEspais() throws SQLException {        String qry = "select * from espais";        PreparedStatement preparedStatement = getPreparedStatement(qry);        List<Espai> espais = executeQuery(preparedStatement);        return espais;    }    /**     * AFEGIR UN NOU ESPAI     *     * @deprecated     * @param espai     * @throws Exception     */    @Override    public void addEspai(Espai espai) throws Exception {        System.out.println("entro a addEspai");        String qry = "INSERT INTO espais(codi,planta,zona,posicio) VALUES (?,?,?,?)";        PreparedStatement preparedStatement = getPreparedStatement(qry);        preparedStatement.setString(1, espai.getCodi());        preparedStatement.setInt(2, espai.getPlanta());        preparedStatement.setString(3, espai.getZona());        preparedStatement.setInt(4, espai.getPosicio());        createOrUpdateEspai(espai.getCodi(), preparedStatement);    }    /**     * ACTUALITZAR INFORMACIÓ D'UN ESPAI     *     * @deprecated     * @param espai     * @throws Exception     */    @Override    public void updateEspai(Espai espai) throws Exception {        String qry = "DELETE FROM espais WHERE codi = '" + espai.getCodi() + "'";        PreparedStatement preparedStatement = getPreparedStatement(qry);        createOrUpdateEspai(espai.getCodi(), preparedStatement);        addEspai(espai);    }    /**     * ELIMINAR UN ESPAI     *     * @deprecated     * @param espai     * @throws Exception     */    @Override    public void deleteEspai(Espai espai) throws Exception {        String qry = "DELETE FROM espais WHERE codi = '" + espai.getCodi() + "'";        PreparedStatement preparedStatement = getPreparedStatement(qry);        createOrUpdateEspai(espai.getCodi(), preparedStatement);    }    /**     * AFEGIR EQUIP A UN ESPAI     *     * @param codiEspai     * @param codiEquip     * @throws Exception     */    @Override    public void addEquipEspai(String codiEspai, String codiEquip) throws Exception {        System.out.println("Entro a addEquipEspai de EspaiDAO");        String qry = "INSERT INTO espais_equips (codiespai,codiequip) VALUES (?,?)";        PreparedStatement preparedStatement = getPreparedStatement(qry);        preparedStatement.setString(1, codiEspai);        preparedStatement.setString(2, codiEquip);        preparedStatement.executeUpdate();    }    /**     * ELIMINAR EQUIP D'UN ESPAI     * @param codiEquip     * @throws Exception      */    @Override    public void deleteEquipEspai(String codiEquip) throws Exception {        System.out.println("Entro a deleteEqupiEspai a EspaiDAO");        String qry = "DELETE FROM espais_equips WHERE codiequip = ?";        PreparedStatement preparedStatement = getPreparedStatement(qry);        preparedStatement.setString(1, codiEquip);        preparedStatement.executeUpdate();    }    /**     * OBTENIR EQUIPS ASSIGNATS A UN ESPAI     * @param codiEspai     * @return llisat d'equips assignats a un espai     * @throws SQLException      */    @Override    public List<Equip> getEquipsAssignats(String codiEspai) throws SQLException {        String qry = "SELECT * FROM espais_equips WHERE codiespai = ?";        PreparedStatement preparedStatement = getPreparedStatement(qry);        preparedStatement.setString(1, codiEspai);        ResultSet resultSet = preparedStatement.executeQuery();        List<Equip> equipsAssignats = new ArrayList<Equip>();        while (resultSet.next()) {            /* Retorna un llistat d'equips */            Equip equip = new Equip();            String codiEquip = resultSet.getString("codiequip");            try {                equip = equipService.getEquipByCodi(codiEquip);            } catch (Exception ex) {                Logger.getLogger(EspaiDAO.class.getName()).log(Level.SEVERE, null, ex);            }            equipsAssignats.add(equip);        }        System.out.println("Resultat consulta equips assignats de EspaiDAO: " + equipsAssignats);        return equipsAssignats;    }    private Espai createOrUpdateEspai(String codi, PreparedStatement preparedStatement) throws Exception {        int result = executeUpdateQuery(preparedStatement);        return getEspaiByCodi(codi);    }    private Espai findUniqueResult(PreparedStatement preparedStatement) throws Exception {        List<Espai> espais = executeQuery(preparedStatement);        if (espais.isEmpty()) {            return null;        }        if (espais.size() > 1) {            throw new Exception("Only one result expected");        }        return espais.get(0);    }    private List<Espai> executeQuery(PreparedStatement preparedStatement) {        List<Espai> espais = new ArrayList<Espai>();        try (                ResultSet rs = preparedStatement.executeQuery()) {            while (rs.next()) {                Espai espai = buildEspaiFromResultSet(rs);                espais.add(espai);            }        } catch (SQLException e) {            e.printStackTrace();        }        return espais;    }    private PreparedStatement getPreparedStatement(String query) throws SQLException {        if (getConnection() == null) {            try {                setConnection(dBConnection.getConnection());            } catch (SQLException | IOException e) {                e.printStackTrace();            }        }        return getConnection().prepareStatement(query);    }    private int executeUpdateQuery(PreparedStatement preparedStatement) {        int resultat = 0;        if (getConnection() == null) {            try {                setConnection(dBConnection.getConnection());;            } catch (SQLException | IOException e) {                e.printStackTrace();            }        }        try {            resultat = preparedStatement.executeUpdate();        } catch (SQLException e) {            e.printStackTrace();        }        return resultat;    }    /**     * INSEREIX INFORMACIÓ ESPAI A BD     * @param rs     * @return     * @throws SQLException      */    private Espai buildEspaiFromResultSet(ResultSet rs) throws SQLException {        String codi = rs.getString("codi");        int planta = rs.getInt("planta");        String zona = rs.getString("zona");        int posicio = rs.getInt("posicio");        Espai espai = new Espai(codi, planta, zona, posicio);        return espai;    }    public Connection getConnection() {        return connection;    }    public void setConnection(Connection connection) {        this.connection = connection;    }}