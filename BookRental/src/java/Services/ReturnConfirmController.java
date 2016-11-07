package Services;

import ServicesController.BookService;
import static ServicesController.CheckService.isEmptyRow;
import ServicesController.RentalService;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReturnConfirmController extends HttpServlet {

private String view = "/WEB-INF/Service/ReturnComfirm.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            
        }catch(Exception ex){}
        request.getRequestDispatcher(view).forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String UserId = request.getParameter("userid");
        String[] RentalId = request.getParameterValues("id");
        String[] Quantity = request.getParameterValues("quantity");
        try{
            String pattern = "dd-MM-yyyy";
            SimpleDateFormat dt = new SimpleDateFormat(pattern, Locale.ENGLISH);
            Date dateTime = dt.parse("9-11-2016"/*dt.format(new Date())*/);
            RentalService rental = new RentalService();
            if(rental.updateRetuen(UserId,RentalId,Quantity)){
                HttpSession session = request.getSession();
                BookService book = new BookService();
                String value = "";
                for (int i = 0; i < RentalId.length; i++){
                    if(i != 0) value += " or ";
                    value += "r.rentalId = "+RentalId[i];
                }
                String query = "from Rental r, Chapter c where r.chapterId = c.chapterId and r.userId = "+UserId+" having "+value;
                List lt = book.command(query);
                System.out.print(lt.size());
                if(!isEmptyRow(lt)){
                    request.setAttribute("return", lt);
                    request.setAttribute("Quantity", Quantity);
                    request.setAttribute("dateReturn", dateTime);
                }
            }
        }catch(Exception ex){}
        request.getRequestDispatcher(view).forward(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
