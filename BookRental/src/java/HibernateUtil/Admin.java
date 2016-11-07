package HibernateUtil;

import java.util.Date;

public class Admin  implements java.io.Serializable {

    private String adminId;
    private String email;
    private String password;
    private Date lastLogin;
    private String firstName;
    private String lastName;
    private String phone;

    public Admin() {
    }

    public Admin(String adminId, String email, String password) {
        this.adminId = adminId;
        this.email = email;
        this.password = password;
    }
    
    public Admin(String adminId, String email, String password, Date lastLogin, String firstName, String lastName, String phone) {
       this.adminId = adminId;
       this.email = email;
       this.password = password;
       this.lastLogin = lastLogin;
       this.firstName = firstName;
       this.lastName = lastName;
       this.phone = phone;
    }
   
    public String getAdminId() {
        return this.adminId;
    }
    
    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Date getLastLogin() {
        return this.lastLogin;
    }
    
    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }

}


