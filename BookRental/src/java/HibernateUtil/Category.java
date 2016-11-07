package HibernateUtil;

public class Category  implements java.io.Serializable {

    private Integer categoryId;
    private String categoryName;
    
    public Category() {
    }

    public Category(String categoryName) {
       this.categoryName = categoryName;
    }
   
    public Integer getCategoryId() {
        return this.categoryId;
    }
    
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
    public String getCategoryName() {
        return this.categoryName;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

}


