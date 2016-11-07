package Database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseController {
    public static Connection connect = null;
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect =  DriverManager.getConnection("jdbc:mysql://localhost:3306/shopsystem?user=root&password=");
            connect.setAutoCommit(false);
            if(connect != null){
                    System.out.println("Database Connected.");
            } else {
                    System.out.println("Database Connect Failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
