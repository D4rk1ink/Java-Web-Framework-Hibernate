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

public class RentalDetailController extends HttpServlet {

    private String view = "/WEB-INF/Service/RentalDetail.jsp";
    
    public Object getID(HttpServletRequest request){
        String pathInfo = request.getPathInfo();
        String[] pathParts = pathInfo.split("/");
        try{
           Long.parseLong(pathParts[1]);
           return pathParts[1];
        }catch(Exception ex){ex.printStackTrace();}
        return false;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Object resultGetID = getID(request);
            if(resultGetID instanceof String){
                String id = (String)resultGetID;
                RentalService rental = new RentalService();
                List lt = rental.selectUserOverdueById(id);
                if(!isEmptyRow(lt)){
                    request.setAttribute("detail", lt);
                }
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
