package HibernateUtil;

import java.util.Date;

public class Login  implements java.io.Serializable {

    private String userId;
    private String password;
    private Date lastLogin;
    private String email;
    private String level;

    public Login() {
    }

    public Login(String userId, String password, String email, String level) {
        this.userId = userId;
        this.password = password;
        this.email = email;
        this.level = level;
    }
    public Login(String userId, String password, Date lastLogin, String email, String level) {
       this.userId = userId;
       this.password = password;
       this.lastLogin = lastLogin;
       this.email = email;
       this.level = level;
    }
   
    public String getUserId() {
        return this.userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
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
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getLevel() {
        return this.level;
    }
    
    public void setLevel(String level) {
        this.level = level;
    }

}


