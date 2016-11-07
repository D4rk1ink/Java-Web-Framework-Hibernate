package Book;

import ServicesController.BookService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookDetailController extends HttpServlet {

    final private String view = "/WEB-INF/Book/Book.jsp";
    
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
                List lt = book.selectChapterByBook(id);
                if(lt != null){
                    request.setAttribute("chapter", lt);
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
