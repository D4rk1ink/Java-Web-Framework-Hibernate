package Book;

import ServicesController.BookService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BookController extends HttpServlet {
    
    final private String view = "/WEB-INF/Book/Index.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            BookService book = new BookService();
            List lt = book.selectBooksCategory();
            if(lt != null){
                HttpSession session = request.getSession();
                request.setAttribute("books", lt);
            }
        }catch(Exception ex){}
        request.getRequestDispatcher(view).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String search = request.getParameter("search");
            String searchtype = request.getParameter("search-type");
            if(searchtype.equals("title") || searchtype.equals("id")){
                BookService book = new BookService();
                List rs = null;
                if(searchtype.equals("title")) rs = book.selectBooksByTitle(search);
                if(searchtype.equals("id")) rs = book.selectBookById(search);
                if(rs != null){
                    HttpSession session = request.getSession();
                    request.setAttribute("searchId", search);
                    request.setAttribute("books", rs);
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
