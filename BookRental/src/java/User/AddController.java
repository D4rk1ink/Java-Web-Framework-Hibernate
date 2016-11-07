/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import HibernateUtil.Users;
import static ServicesController.CheckService.isEmptyRow;
import ServicesController.UserService;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author D@rkL!nk
 */
public class AddController extends HttpServlet {
    private String view = "/WEB-INF/User/Add.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(view).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService user = new UserService();
        
        try{
            HttpSession session = request.getSession();
            session.setAttribute("AlertHead", false);
            session.setAttribute("AlertDes", "Add Fail");
            
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            String id = request.getParameter("id");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            Date birthday = df.parse(request.getParameter("birthday"));
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            if(!id.isEmpty() && !fname.isEmpty() &&!lname.isEmpty() && birthday != null && !gender.isEmpty() && (gender.equals("Male") || gender.equals("Female"))){
                List lt = user.selectUserById(id);
                if(isEmptyRow(lt)){
                    Users _user = new Users(id,fname,lname,birthday,address,phone,email,gender);
                    if(user.addUser(_user)){
                        session.setAttribute("AlertHead", true);
                        session.setAttribute("AlertDes", "Add Complete");
                        response.sendRedirect("/Admin/User/Info?key="+id);
                        return ;
                    }
                }
            }
        }catch(Exception ex){System.out.print(ex);}
        response.sendRedirect(request.getRequestURI());
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
