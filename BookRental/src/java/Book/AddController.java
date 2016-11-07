package Book;

import HibernateUtil.Books;
import HibernateUtil.Chapter;
import ServicesController.BookService;
import static ServicesController.CheckService.isEmptyRow;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddController extends HttpServlet {
    
    final private String view = "/WEB-INF/Book/Add.jsp";
    
    private boolean isValidateData(String[] name, String[] no, String[] price, String[] quantity){
        boolean isNotEmpty = name.length != 0 && no.length != 0 && price.length != 0 && quantity.length != 0;
        boolean isEquals = name.length == no.length && no.length == price.length && price.length == quantity.length;
        return isNotEmpty && isEquals;
    }
    
    private ArrayList<Chapter> CreateChapters(int bookId, String[] no, String[] price, String[] quantity, String[] name) {
        ArrayList<Chapter> _chapters = new ArrayList<Chapter>();
        for (int i = 0; i < name.length; i++){
            Integer _no = Integer.parseInt(no[i]);
            Double _price = Double.parseDouble(price[i]);
            Integer _quantity = Integer.parseInt(quantity[i]);
            Chapter chapter = new Chapter(bookId,_no,_price,_quantity,name[i]);
            _chapters.add(chapter);
        }
        return _chapters;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            BookService book = new BookService();
            List books = book.selectBooks();
            List category = book.selectCategory();
            if(books != null && category != null){
                request.setAttribute("books", books);
                request.setAttribute("category", category);
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
            
            String bookname = request.getParameter("bookname");
            String newbookname = request.getParameter("newbookname");
            String categoryid = request.getParameter("category");
            String[] name = request.getParameterValues("name");
            String[] no = request.getParameterValues("no");
            String[] price = request.getParameterValues("price");
            String[] quantity = request.getParameterValues("quantity");
            if(isValidateData(name,no,price,quantity)){
                BookService book = new BookService();
                if(bookname.equals("create") && newbookname != null && !newbookname.isEmpty() && categoryid != null && !categoryid.isEmpty()){
                    Integer.parseInt(categoryid);
                    Books _book = new Books(newbookname,categoryid,"");
                    ArrayList<Chapter> _chapters = CreateChapters(0,no,price,quantity,name);

                    List lt = book.selectCategoryById(categoryid);   
                    if(!isEmptyRow(lt)){
                        if(book.addBook(_book,_chapters)){
                            session.setAttribute("AlertHead", true);
                            session.setAttribute("AlertDes", "Add Complete");
                            response.sendRedirect("/Admin/Book");
                            return ;
                        }
                    }
                }else{
                    int bookid = Integer.parseInt(bookname);
                    ArrayList<Chapter> _chapters = CreateChapters(bookid,no,price,quantity,name);
                    List lt = book.selectBookById(bookname);   
                    if(!isEmptyRow(lt)){
                        if(book.addChapter(_chapters)){
                            session.setAttribute("AlertHead", true);
                            session.setAttribute("AlertDes", "Add Complete");
                            response.sendRedirect("/Admin/Book");
                            return ;
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
