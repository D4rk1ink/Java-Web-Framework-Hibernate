<%@page import="HibernateUtil.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    int id;
    String categoryname;
%>
<%
    if(request.getAttribute("Category") != null){
        List<Category> lt = (List<Category>)request.getAttribute("Category");
        id = lt.get(0).getCategoryId();
        categoryname = lt.get(0).getCategoryName();
        request.removeAttribute("Category");
    }
%>
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
                    <h3>Category Edit : <%= categoryname %></h3>
                </div>
                <div class="form-editcategory">
                    <form action="" method="POST" class="form-horizontal">
                        <div class="form-group row">
                            <div class="col-md-10">
                                <input type="text" name="newname" class="form-control" value="<%= categoryname %>" placeholder="<%= categoryname %>">
                                <input type="hidden" name="id" value="<%= id %>">
                            </div>
                            <div class="col-md-2">
                                <input type="submit" class="form-control" value="Edit">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
