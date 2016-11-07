package HibernateUtil;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Chapter  implements java.io.Serializable {

    private Integer chapterId;
    private int bookId;
    private Integer no;
    private Double price;
    private Integer quantity;
    private String chapterName;

    public Chapter() {
    }

    public Chapter(int bookId) {
        this.bookId = bookId;
    }
    public Chapter(int bookId, Integer no, Double price, Integer quantity, String chapterName) {
       this.bookId = bookId;
       this.no = no;
       this.price = price;
       this.quantity = quantity;
       this.chapterName = chapterName;
    }
   
    public Integer getChapterId() {
        return this.chapterId;
    }
    
    public void setChapterId(Integer chapterId) {
        this.chapterId = chapterId;
    }
    public int getBookId() {
        return this.bookId;
    }
    
    public void setBookId(int bookId) {
        this.bookId = bookId;
    }
    public Integer getNo() {
        return this.no;
    }
    
    public void setNo(Integer no) {
        this.no = no;
    }
    public Double getPrice() {
        return this.price;
    }
    
    public void setPrice(Double price) {
        this.price = price;
    }
    public Integer getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    public String getChapterName() {
        return this.chapterName;
    }
    
    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }
    
}


