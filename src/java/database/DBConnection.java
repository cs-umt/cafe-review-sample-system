/**
 *
 * @author Wan Aisyah Amirah, Aliesa, Aminah, Dennis
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    
    // database url = jdbc:mysql://localhost:<port_no>/<name_of_database_on_xampp>
    private static final String URL = "jdbc:mysql://localhost:3306/cafereviewsystem";
    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    
    // xampp password, check your xampp username and password for mysql
    private static final String USERNAME = "root";
    private static final String PASSWORD = "admin";
    
    private static Connection conn;
    
    public static Connection getConnection() throws ClassNotFoundException{
        try {
            Class.forName(DRIVER_NAME);
            
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e){
            e.getMessage();
        }
        return conn;
    }
    
}
