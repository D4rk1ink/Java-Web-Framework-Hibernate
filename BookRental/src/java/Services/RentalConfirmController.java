package Services;

import HibernateUtil.Chapter;
import HibernateUtil.Rental;
import static ServicesController.CheckService.*;
import ServicesController.*;
import ServicesController.UserService;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RentalConfirmController extends HttpServlet {

    private String view = "/WEB-INF/Service/RentalConfirm.jsp";
    
    private void remveSession(HttpSession session){
        session.removeAttribute("userid");
        session.removeAttribute("quantity");
        session.removeAttribute("rental");
    }
    
    private ArrayList<Rental> CreateRental(String UserId, List<Chapter> chapter, String[] Quantity) throws ParseException {
        String pattern = "dd-MM-yyyy";
        SimpleDateFormat dt = new SimpleDateFormat(pattern, Locale.ENGLISH);
        Date dateTime = dt.parse(dt.format(new Date()));
        ArrayList<Rental> _rental = new ArrayList<Rental>();
        for(Chapter _chapter : chapter){
            int i = 0;
            Integer id = _chapter.getChapterId();
            Integer quantity = Integer.parseInt(Quantity[i++]);
            _rental.add(new Rental(UserId,id,quantity,dateTime,true));
        }
        return _rental;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            HttpSession session = request.getSession();
            session.setAttribute("AlertHead", false);
            session.setAttribute("AlertDes", "Rental Fail");

            String Confirm = request.getParameter("confirm");
            String UserId = (String) session.getAttribute("userid");
            String[] Quantity = (String[])session.getAttribute("quantity");
            List<Chapter> ConfirmSet = (List<Chapter>)session.getAttribute("rental");
            if(UserId != null && ConfirmSet != null && Quantity != null && Confirm != null && Confirm.equals("Confirm")){
                RentalService rental = new RentalService();
                ArrayList<Rental> _rental = CreateRental(UserId,ConfirmSet,Quantity);
                if(rental.addRental(_rental)){
                    session.setAttribute("AlertHead", true);
                    session.setAttribute("AlertDes", "Rental Complete");
                    response.sendRedirect("/Admin/Rental/"+UserId);
                    remveSession(session);
                    return ;
                }
                remveSession(session);
            }else{
                String userid = request.getParameter("userid");
                String[] bookid = request.getParameterValues("bookid");
                String[] quantity = request.getParameterValues("quantity");
                if(!userid.isEmpty() && bookid.length != 0 && quantity.length != 0){
                    UserService user = new UserService();
                    List ltuser = user.selectUserById(userid);
                    if(isOneRow(ltuser)){
                            BookService book = new BookService();
                            String value = "";
                            for (int i = 0; i < bookid.length; i++){
                                if(i != 0) value += " or ";
                                value += "c.chapterId = "+bookid[i];
                            }
                            String query = "from Chapter c where "+value+"";
                            List lt = book.command(query);
                            if(!isEmptyRow(lt)){
                                if(lt.size() == bookid.length && bookid.length == quantity.length){
                                    session.setAttribute("userid", userid);
                                    session.setAttribute("rental", lt);
                                    session.setAttribute("quantity", quantity);
                                    session.removeAttribute("AlertHead");
                                    session.removeAttribute("AlertDes");
                                    request.getRequestDispatcher(view).forward(request, response);
                                    return ;
                                }else{
                                    session.setAttribute("AlertDes", "Not Found Some Book ");
                                }
                            }else{
                                session.setAttribute("AlertDes", "Not Found Some Book ");
                            }
                    }else{
                        session.setAttribute("AlertDes", "Not Found User ID ");
                    }
                }
            }
        }catch(Exception ex){}
        response.sendRedirect("/Admin/Rental");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
