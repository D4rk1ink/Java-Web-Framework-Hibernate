package HibernateUtil;

public class Books  implements java.io.Serializable {

    private Integer bookId;
    private String bookName;
    private String categoryId;
    private String note;

    public Books() {
    }
	
    public Books(String bookName) {
        this.bookName = bookName;
    }
    public Books(String bookName, String categoryId, String note) {
       this.bookName = bookName;
       this.categoryId = categoryId;
       this.note = note;
    }
   
    public Integer getBookId() {
        return this.bookId;
    }
    
    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }
    public String getBookName() {
        return this.bookName;
    }
    
    public void setBookName(String bookName) {
        this.bookName = bookName;
    }
    public String getCategoryId() {
        return this.categoryId;
    }
    
    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }
    public String getNote() {
        return this.note;
    }
    
    public void setNote(String note) {
        this.note = note;
    }
    
}


