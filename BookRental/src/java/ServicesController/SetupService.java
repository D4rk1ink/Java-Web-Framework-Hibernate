package ServicesController;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import Setup.initController;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SetupService {
    Connection connect = null;
    public SetupService(){
        connect = Database.DatabaseController.connect;
    }
    
    public boolean getInit(){
        String query = "SELECT AdminId FROM Admin";
        try {
            Statement st = connect.createStatement();
            ResultSet rs = st.executeQuery(query);
            rs.last();
            return rs.getRow() == 0;
        }catch (SQLException ex) {
            System.out.print(ex);
        }
        return false;
    }
    
    public boolean setInit(String AdminId, String Email, String Password, String FirstName, String LastName, String Phone){
        String query = "INSERT INTO admin(AdminId,Email,Password,FirstName,LastName,Phone) "
                     + "VALUES('"+AdminId+"','"+Email+"','"+Password+"','"+FirstName+"','"+LastName+"','"+Phone+"')";
        try {
            Statement st = connect.createStatement();
            st.executeUpdate(query);
            connect.commit();
            return true;
        }catch (SQLException ex) {
            try {
                connect.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(initController.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
        return false;
    }
}
