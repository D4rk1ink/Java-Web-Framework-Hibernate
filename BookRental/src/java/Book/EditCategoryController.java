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

public class EditCategoryController extends HttpServlet {
    private String view = "/WEB-INF/Book/EditCategory.jsp";
    
    public Object getID(HttpServletRequest request){
        String pathInfo = request.getPathInfo(); // /{value}/test
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
                List lt = book.selectCategoryById(id);   
                if(isOneRow(lt)){
                    request.setAttribute("Category", lt);
                    request.getRequestDispatcher(view).forward(request, response);
                    return ;
                }
            }
        }catch(Exception ex){}
        response.sendRedirect("/Admin/Book/Category");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            HttpSession session = request.getSession();
            session.setAttribute("AlertHead", false);
            session.setAttribute("AlertDes", "Edit Fail");
            
            String ids = request.getParameter("id");
            String newname = request.getParameter("newname");
            
            if(!ids.isEmpty() && !newname.isEmpty()){
                try{
                    int id = Integer.parseInt(ids);
                    BookService book = new BookService();
                    if(book.editCategory(id,newname)){
                        session.setAttribute("AlertHead", true);
                        session.setAttribute("AlertDes", "Edit Complete");
                    }
                }catch(Exception ex){}

            }
        }catch(Exception ex){}
        response.sendRedirect(request.getRequestURI());
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
