package ServicesController;

import HibernateUtil.Chapter;
import HibernateUtil.HibernateUtil;
import HibernateUtil.Users;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UserService {
    public Connection connect = null;
    public UserService(){
        connect = Database.DatabaseController.connect;
    }
    
    public List selectUser(){
        List<Object[]> QueryList = null;;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Users");
            QueryList = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return QueryList;
    }
    
    public List selectUserById(String id){
        List<Object[]> QueryList = null;;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Users u where u.userId = "+id);
            QueryList = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return QueryList;
    }
    
    public boolean addUser(Users user){
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.getTransaction();
        try {
            tx.begin();
            session.save(user);
            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            return false;
        } finally {
            session.close();
        }
    }
    
    public boolean updateUser(String id,String fname,String lname,String gender,Date birthday,String email,String address,String phone){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.getTransaction();
        try {
            tx.begin();
            Query query = session.createSQLQuery("update Users u set "
                    + "u.firstName = :FirstName, "
                    + "u.lastName = :LastName, "
                    + "u.gender = :Gender, "
                    + "u.birthday = :Birthday, "
                    + "u.email = :Email, "
                    + "u.address = :Address, "
                    + "u.phone = :Phone "
                    + "where u.userId = :UserId");
            query.setParameter("FirstName", fname);
            query.setParameter("LastName", lname);
            query.setParameter("Gender", gender);
            query.setParameter("Birthday", birthday);
            query.setParameter("Email", email);
            query.setParameter("Address", address);
            query.setParameter("Phone", phone);
            query.setParameter("UserId", id);
            int result = query.executeUpdate();
            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            return false;
        } finally {
            session.close();
        }
    }
    
    
}
