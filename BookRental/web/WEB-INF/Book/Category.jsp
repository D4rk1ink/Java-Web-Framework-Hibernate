<%@page import="HibernateUtil.Category"%>
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
                    <h3>Category List</h3>
                </div>
                <form action="" method="POST" class="form-horizontal">
                    <div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" name="newcategory" class="form-control" placeholder="Create Category">
                        </div>
                        <div class="col-md-2">
                            <input type="submit" class="form-control">
                        </div>
                    </div>
                </form>
                <hr>
                <div>
                    <table class="table-list table table-hover">
                        <thead>
                            <tr>
                              <th width="15%">ID</th>
                              <th width="65%">Category Name</th>
                              <th width="20%">Manage</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                List<Category> lt = (List<Category>)request.getAttribute("category");
                                for(Category category : lt){
                                    int id = category.getCategoryId();
                                    String name = category.getCategoryName();
                                    %>
                                        <tr>
                                            <td><%= id %></td>
                                            <td><%= name %></td>
                                            <td><a href="Category/<%= id %>"><button class="btn btn-primary">Edit</button></a></td>
                                        </tr>
                                    <%
                                    
                                }
                                request.removeAttribute("category");
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
