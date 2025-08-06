/**
 * @author: Omar Omar
 * @Date: June, 14 2025
 * @Professor: Marwan Farah
 */
package accessLayer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DataSource {

   public static Connection createConnection() throws SQLException {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); 
    } catch (ClassNotFoundException e) {
    }

    String url = "jdbc:mysql://localhost:3306/books?useSSL=false&allowPublicKeyRetrieval=true";
    String user = "root";
    String pass = "Ionetcool1.";

    return DriverManager.getConnection(url, user, pass);
}

}
