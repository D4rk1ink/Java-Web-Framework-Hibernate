<%@page import="HibernateUtil.Users"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage Books</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/main.css" rel="stylesheet" type="text/css"/>
    <script src="/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script>
        <%  
            Object AlertHead = session.getAttribute("AlertHead");
            String AlertDes = (String)session.getAttribute("AlertDes");
            if(AlertHead != null){
                if((Boolean)AlertHead){ %>
                    alert("<%= session.getAttribute("AlertDes") %>");
            <% }else{ %>
                    alert("<%= session.getAttribute("AlertDes") %>");
            <% }
                session.removeAttribute("AlertHead");
                session.removeAttribute("AlertDes");
            } 
        %>
    </script>
</head>
<body>
    <jsp:include page="../Partials/Admin-left-col.jsp" />
    <div class="right-col" id="right-col">
        <jsp:include page="../Partials/Admin-Navbar.jsp" />
        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                <div class="header-title">
                    <h3>Users List</h3>
                </div>
                <table class="table-list table table-hover">
                    <thead>
                        <tr>
                          <th width="15%">ID</th>
                          <th width="45%">Name</th>
                          <th width="15%">Manage</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<Users> lt = (List<Users>)request.getAttribute("users");
                            for (Users user : lt) {
                                String id = user.getUserId();
                                String fname = user.getFirstName();
                                String lname = user.getLastName();
                                %>
                                    <tr>
                                        <td><%= id %></td>
                                        <td><%= fname %> <%= lname %></td>
                                        <td><a href="/Admin/User/Info?key=<%= id %>"><button class="btn btn-primary">View</button></a></td>
                                    </tr>
                                <%
                            }
                            request.removeAttribute("users");
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
