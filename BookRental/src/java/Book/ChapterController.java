package Book;

import ServicesController.BookService;
import static ServicesController.CheckService.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChapterController extends HttpServlet {

    final private String view = "/WEB-INF/Book/Chapter.jsp";
    
    public Object getID(HttpServletRequest request){
        String pathInfo = request.getPathInfo();
        String[] pathParts = pathInfo.split("/");
        try{
           Integer.parseInt(pathParts[1]);
           return pathParts[1];
        }catch(Exception ex){}
        return false;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Object resultGetID = getID(request);
            if(resultGetID instanceof String){
                String id = (String)resultGetID;
                BookService book = new BookService();
                List lt = book.selectChapterById(id);
                if(isOneRow(lt)){
                    request.setAttribute("chapter", lt);
                }
            }
        }catch(Exception ex){}
        request.getRequestDispatcher(view).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            HttpSession session = request.getSession();
            session.setAttribute("AlertHead", false);
            session.setAttribute("AlertDes", "Update Fail");
            
            Object resultGetID = getID(request);
            if(resultGetID instanceof String){
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String tno = request.getParameter("no");
                String tprice = request.getParameter("price");
                String tquantity = request.getParameter("quantity");
                String key = (String)resultGetID;
                if(key.equals(id)){
                    if(!name.isEmpty() && !tno.isEmpty() && !tprice.isEmpty() && !tquantity.isEmpty()){
                        BookService book = new BookService();
                        int no = Integer.parseInt(tno);
                        double price = Double.parseDouble(tprice);
                        int quantity = Integer.parseInt(tquantity);
                        if(book.updateChapter(id, name, no, price, quantity)){
                            session.setAttribute("AlertHead", true);
                            session.setAttribute("AlertDes", "Update Complete");
                        }
                    }
                }
            }
        }catch(Exception ex){}
        response.sendRedirect(request.getRequestURI());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
