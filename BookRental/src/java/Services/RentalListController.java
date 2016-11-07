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

public class RentalListController extends HttpServlet {

    private String view = "/WEB-INF/Service/RentalList.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            RentalService rental = new RentalService();
            List lt = rental.selectUserOverdue();
            if(!isEmptyRow(lt)){
                request.setAttribute("users", lt);
            }
        }catch(Exception ex){}
        request.getRequestDispatcher(view).forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
