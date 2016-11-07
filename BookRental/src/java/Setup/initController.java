package Setup;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ServicesController.SetupService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author D@rkL!nk
 */
public class initController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SetupService Setup = new SetupService();
        if(Setup.getInit())
            request.getRequestDispatcher("/WEB-INF/Setup/index.jsp").forward(request, response);
        else
            response.sendRedirect("/Admin-Login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String AdminId = request.getParameter("id");
        String Email = request.getParameter("email");
        String Password = request.getParameter("pwd");
        String CPassword = request.getParameter("cpwd");
        String FirstName = request.getParameter("fname");
        String LastName = request.getParameter("lname");
        String Phone = request.getParameter("phone");
        if(Password.equals(CPassword)){
            SetupService Setup = new SetupService();
            if(Setup.getInit()){
                boolean rs = Setup.setInit(AdminId,Email,Password,FirstName,LastName,Phone);
                if(rs){
                    response.sendRedirect("/Admin-Login");
                    return ;
                }
            }
        }
        response.sendRedirect("/Setup");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
