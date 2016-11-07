/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import static ServicesController.CheckService.*;
import ServicesController.UserService;
import java.io.IOException;
import java.sql.ResultSet;
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
public class InfoController extends HttpServlet {
    private String view = "/WEB-INF/User/Info.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            UserService user = new UserService();
            String key = request.getParameter("key");
            if(key != null){
                List lt = user.selectUserById(key);
                if(isOneRow(lt)){
                    request.setAttribute("user", lt);
                    request.getRequestDispatcher(view).forward(request, response);
                    return ;
                } 
            }
        }catch(Exception ex){}
        response.sendRedirect("/Admin/User/Add");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService user = new UserService();
        String key = request.getParameter("key");
        try{
            HttpSession session = request.getSession();
            session.setAttribute("AlertHead", false);
            session.setAttribute("AlertDes", "Update Fail");
            
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            String id = request.getParameter("id");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            Date birthday = df.parse(request.getParameter("birthday"));
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            if(key.equals(id)){
                if(!id.isEmpty() && !fname.isEmpty() &&!lname.isEmpty() && birthday != null && !gender.isEmpty() && (gender.equals("Male") || gender.equals("Female"))){
                    if(user.updateUser(id, fname, lname, gender, birthday, email, address, phone)){
                        session.setAttribute("AlertHead", true);
                        session.setAttribute("AlertDes", "Update Complete");
                    }
                }
            }
        }catch(Exception ex){}
        response.sendRedirect(request.getRequestURI()+"?key="+key);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
