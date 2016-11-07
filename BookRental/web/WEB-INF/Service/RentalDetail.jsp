<%@page import="HibernateUtil.Chapter"%>
<%@page import="HibernateUtil.Rental"%>
<%@page import="HibernateUtil.Users"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detail List</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/main.css" rel="stylesheet" type="text/css"/>
    <script src="/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <style>
        .list-remove{
            float: right;
            padding: 0 15px;
            margin-bottom: 5px;
        }
        .listbook-book .form-group:last-child{
            margin-bottom: 0px;
        }
    </style>
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
<body onload="init()">
    <jsp:include page="../Partials/Admin-left-col.jsp" />
    <div class="right-col" id="right-col">
        <jsp:include page="../Partials/Admin-Navbar.jsp" />
        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                <div class="header-title">
                    <h3>Detail List</h3>
                </div>
                <table class="table-list table table-hover">
                    <thead>
                        <tr>
                          <th width="30%">ID</th>
                          <th width="50%">Name</th>
                          <th width="20%">Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<Object[]> lt = (List<Object[]>)request.getAttribute("detail");
                            for(Object[] aRow : lt){
                                Users user = (Users)aRow[0];
                                Rental rental = (Rental)aRow[1];
                                Chapter chapter = (Chapter)aRow[2];
                                Integer id = rental.getChapterId();
                                String name = chapter.getChapterName();
                                Integer quantity = rental.getQuantity();
                                %>
                                    <tr>
                                        <td><%= id %></td>
                                         <td><%= name %></td>
                                        <td><%= quantity %></td>
                                    </tr>
                                <%
                            }
                            request.removeAttribute("detail");
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
