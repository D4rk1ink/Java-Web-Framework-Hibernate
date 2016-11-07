package Services;

import static ServicesController.CheckService.*;
import ServicesController.RentalService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReturnListController extends HttpServlet {

    private String view = "/WEB-INF/Service/ReturnList.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(view).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            HttpSession session = request.getSession();
            session.setAttribute("AlertHead", false);
            session.setAttribute("AlertDes", "You not have a book");
            String userid = request.getParameter("userid");
            if(userid != null){
                RentalService rental = new RentalService();
                List lt = rental.selectUserOverdueById(userid);
                if(!isEmptyRow(lt)){
                    request.setAttribute("return", lt);
                    session.removeAttribute("AlertHead");
                    session.removeAttribute("AlertDes");
                    request.getRequestDispatcher(view).forward(request, response);
                    return ;
                }
            }
        }catch(Exception ex){;}
        response.sendRedirect("/Admin/Return");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
