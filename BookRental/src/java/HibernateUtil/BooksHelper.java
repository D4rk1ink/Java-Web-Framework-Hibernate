/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HibernateUtil;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author D@rkL!nk
 */
public class BooksHelper {
    
    Session session = null;

    public BooksHelper() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    public List getBooks(int startID, int endID) {
        List<Books> BookList = null;
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery ("from Books");
            BookList = (List<Books>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BookList;
    }
}
