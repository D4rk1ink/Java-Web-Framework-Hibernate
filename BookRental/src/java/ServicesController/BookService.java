package ServicesController;

import HibernateUtil.Books;
import HibernateUtil.Category;
import HibernateUtil.Chapter;
import HibernateUtil.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class BookService {
    
    public BookService(){
        
    }
    
    public List selectBooks(){
        List<Object[]> QueryList = null;;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Books");
            QueryList = q.list();
        } catch (Exception e) {}
        return QueryList;
    }
    
    public List selectBooksCategory() {
        List<Object[]> QueryList = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Books b, Category c where b.categoryId = c.categoryId");
            QueryList = q.list();
        } catch (Exception e) {}
        return QueryList;
    }
    
    public List selectBookById(String id) {
        List<Object[]> QueryList = null;;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Books b,Category c where b.bookId = "+id+" and b.categoryId = c.categoryId");
            QueryList = q.list();
        } catch (Exception e) {}
        return QueryList;
    }
    
    public List selectBooksByTitle(String search){
        List<Object[]> QueryList = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Books b,Category c where b.categoryId = c.categoryId and LOWER(b.bookName) REGEXP LOWER('"+search+"')");
            QueryList = q.list();
        } catch (Exception e) {}
        return QueryList;
    }
    
    public List selectChapterByBook(String id){
        List<Object[]> QueryList = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Books b, Chapter c where b.bookId = c.bookId and c.bookId = "+id);
            QueryList = q.list();
        } catch (Exception e) {}
        return QueryList;
    }
    
    public List selectChapterById(String id){
        List<Object[]> QueryList = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Chapter c where c.chapterId = "+id);
            QueryList = q.list();
        } catch (Exception e) {}
        return QueryList;
    }
    
    public List selectCategory(){
        List<Object[]> QueryList = null;;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Category");
            QueryList = q.list();
        } catch (Exception e) {}
        return QueryList;
    }
    
    public List selectCategoryById(String id){
        List<Object[]> QueryList = null;;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Category c where c.categoryId = "+id);
            QueryList = q.list();
        } catch (Exception e) {}
        return QueryList;
    }
    
    public boolean addBook(Books book,ArrayList<Chapter> chapters){
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.getTransaction();
        try {
            tx.begin();
            session.save(book);
            int bookId = book.getBookId();
            for(Chapter chapter : chapters){
                chapter.setBookId(bookId);
                session.save(chapter);
            }
            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            return false;
        } finally {
            session.close();
        }
    }
    
    public boolean addChapter(ArrayList<Chapter> chapters){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.getTransaction();
        try {
            tx.begin();
            for(Chapter chapter : chapters){
                session.save(chapter);
            }
            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            return false;
        } finally {
            session.close();
        }
    }
    
    public boolean addCategory(Category category){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.getTransaction();
        try {
            tx.begin();
            session.save(category);
            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            return false;
        } finally {
            session.close();
        }
    }
    
    public boolean updateChapter(String id,String name,int no,double price,int quantity){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.getTransaction();
        try {
            tx.begin();
            Query query = session.createSQLQuery("update Chapter c set c.chapterName = :ChapterName, c.no = :No, c.price = :Price, c.quantity = :Quantity where c.chapterId = :ChapterId");
            query.setParameter("ChapterName", name);
            query.setParameter("No", no);
            query.setParameter("Price", price);
            query.setParameter("Quantity", quantity);
            query.setParameter("ChapterId", id);
            query.executeUpdate();
            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            return false;
        } finally {
            session.close();
        }
    }
    
    public boolean editCategory(int id,String name){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.getTransaction();
        try {
            tx.begin();
            Query query = session.createSQLQuery("update Category c set c.categoryName = :CategoryName where c.categoryId = :CategoryId");
            query.setParameter("CategoryName", name);
            query.setParameter("CategoryId", id);
            query.executeUpdate();
            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            return false;
        } finally {
            session.close();
        }
    }

    public List command(String query){
        List<Object[]> QueryList = null;;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery(query);
            QueryList = q.list();
        } catch (Exception e) {}
        return QueryList;
    }
    
}
