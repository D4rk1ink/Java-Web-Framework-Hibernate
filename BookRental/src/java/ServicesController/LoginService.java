package ServicesController;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginService {
    Connection connect = null;
    public LoginService(){
        connect = Database.DatabaseController.connect;
    }
    
    public ResultSet AdminLogin(String Email, String Password){
        String query = "SELECT * FROM admin WHERE Email = '"+Email+"' AND Password = '"+Password+"'";
        try {
            Statement st = connect.createStatement();
            ResultSet rs = st.executeQuery(query);
            return rs;
        }catch (SQLException ex) {
            
        }
        return null;
    }
}
