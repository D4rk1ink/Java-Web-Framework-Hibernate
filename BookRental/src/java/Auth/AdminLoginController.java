/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Auth;

import HibernateUtil.Login;
import ServicesController.*;
import static ServicesController.CheckService.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminLoginController extends HttpServlet {
    private String view = "/WEB-INF/Auth/Admin-Login.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(view).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String Email = request.getParameter("email");
            String Password = request.getParameter("pwd");
            LoginService login = new LoginService();
            List<Login> lt = (List<Login>)login.AdminLogin(Email, Password);
           if(isOneRow(lt)){
                if(lt.get(0).getEmail().equals(Email) && lt.get(0).getPassword().equals(Password)){
                    response.sendRedirect("/Admin");
                    return ;
                }
            }
        }catch(Exception ex) {}
        response.sendRedirect(request.getRequestURI());
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
