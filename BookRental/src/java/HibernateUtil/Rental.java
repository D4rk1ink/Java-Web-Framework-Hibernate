package HibernateUtil;

import java.util.Date;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Rental  implements java.io.Serializable {

    private Integer rentalId;
    private String userId;
    private int chapterId;
    private int quantity;
    private Date dateRental;
    private boolean status;

    public Rental() {
    }

    public Rental(String userId, int chapterId, int quantity, Date dateRental, boolean status) {
       this.userId = userId;
       this.chapterId = chapterId;
       this.quantity = quantity;
       this.dateRental = dateRental;
       this.status = status;
    }
   
    public Integer getRentalId() {
        return this.rentalId;
    }
    
    public void setRentalId(Integer rentalId) {
        this.rentalId = rentalId;
    }
    public String getUserId() {
        return this.userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public int getChapterId() {
        return this.chapterId;
    }
    
    public void setChapterId(int chapterId) {
        this.chapterId = chapterId;
    }
    public int getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public Date getDateRental() {
        return this.dateRental;
    }
    
    public void setDateRental(Date dateRental) {
        this.dateRental = dateRental;
    }
    public boolean isStatus() {
        return this.status;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }

}


