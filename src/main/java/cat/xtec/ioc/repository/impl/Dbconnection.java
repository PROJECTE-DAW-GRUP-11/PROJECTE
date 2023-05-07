package cat.xtec.ioc.repository.impl;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import javax.ejb.Stateful;





@Stateful
public class Dbconnection {
    private String connectionFile;

    public Dbconnection() {
    }

    public Dbconnection(String connectionFile) {
        this.connectionFile = connectionFile;
    }

    public String getConnectionFile() {
        return connectionFile;
    }

    public void setConnectionFile(String connectionFile) {
        this.connectionFile = connectionFile;
    }
    
    
    
    public Connection getConnection() throws SQLException, IOException {
        Properties props = new Properties();
        InputStream resourceAsStream = null;
        Connection con = null;
        try {
            ClassLoader classLoader = getClass().getClassLoader();
            URL urlResource = classLoader.getResource(connectionFile);
            if (urlResource != null) {
                resourceAsStream = urlResource.openStream();
                props.load(resourceAsStream);
                Class.forName(props.getProperty("DB_DRIVER_CLASS"));
                con = DriverManager.getConnection(props.getProperty("DB_URL"),
                        props.getProperty("DB_USERNAME"),
                        props.getProperty("DB_PASSWORD"));
            }
        } catch (IOException | ClassNotFoundException | SQLException e) {
        } finally {
            if (resourceAsStream != null) {
                resourceAsStream.close();
            }
        }
        return con;
    }
}
