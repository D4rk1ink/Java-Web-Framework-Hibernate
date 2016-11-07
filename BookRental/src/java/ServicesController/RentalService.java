/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServicesController;

import HibernateUtil.Chapter;
import HibernateUtil.HibernateUtil;
import HibernateUtil.Rental;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RentalService {
    public Connection connect = null;
    public RentalService(){
        connect = Database.DatabaseController.connect;
    }
    
    public List selectUserOverdue(){
        List<Object[]> QueryList = null;;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Users u, Rental r where r.quantity > 0 and u.userId = r.userId group by r.userId");
            QueryList = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return QueryList;
    }
    
    public List selectUserOverdueById(String id){
        List<Object[]> QueryList = null;;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Users u, Rental r, Chapter c where r.userId = "+id+" and r.quantity > 0 and u.userId = r.userId and r.chapterId = c.chapterId");
            QueryList = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return QueryList;
    }
    
    public boolean addRental(ArrayList<Rental> rantal){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.getTransaction();
        try {
            tx.begin();
            for(Rental _rantal : rantal){
                session.save(_rantal);
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
    
    public boolean updateRetuen(String userId, String[] rentalId, String[] quantity){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.getTransaction();
        try {
            tx.begin();
            for (int i = 0; i < rentalId.length; i++){
                Query query = session.createSQLQuery("update Rental r set r.quantity = r.quantity - :Quantity where r.userId = :UserId and r.rentalId = :RentalId");
                query.setParameter("UserId", userId);
                query.setParameter("RentalId", rentalId[i]);
                query.setParameter("Quantity", quantity[i]);
                query.executeUpdate();
            }
            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
            return false;
        } finally {
            session.close();
        }
    }
    
}
