package Book;

import HibernateUtil.Category;
import ServicesController.BookService;
import static ServicesController.CheckService.isEmptyRow;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CategoryController extends HttpServlet {
    private String view = "/WEB-INF/Book/Category.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            BookService book = new BookService();
            List lt = book.selectCategory();
            if(!isEmptyRow(lt)){
                request.setAttribute("category", lt);
            }
        }catch(Exception ex){}
        request.getRequestDispatcher(view).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            HttpSession session = request.getSession();
            session.setAttribute("AlertHead", false);
            session.setAttribute("AlertDes", "Add Fail");

            String categoryname = request.getParameter("newcategory");
            if(!categoryname.isEmpty()){
                BookService book = new BookService();
                Category category = new Category(categoryname);
                if(book.addCategory(category)){
                    session.setAttribute("AlertHead", true);
                    session.setAttribute("AlertDes", "Add Complete");
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
