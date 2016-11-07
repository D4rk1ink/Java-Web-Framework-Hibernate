<%@page import="HibernateUtil.Category"%>
<%@page import="java.util.List"%>
<%@page import="HibernateUtil.Books"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Object[]> lt = (List<Object[]>)request.getAttribute("books");
    String searchId = (String)request.getAttribute("searchId");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Books List</title>
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
                    <% 
                        if(searchId != null){
                            %>
                            <h3>Search : <%= searchId %></h3>
                            <%
                        }else{
                    %>
                        <h3>Books List</h3>
                    <%
                        }
                    %>
                </div>
                <form action="" method="POST" class="form-horizontal"> 
                    <div class="form-group row">
                        <div class="col-md-8">
                            <input type="text" name="search" class="form-control" placeholder="Search Book">
                        </div>
                        <div class="col-md-2">
                            <select class="form-control" name="search-type">
                                <option value="title">Title</option>
                                <option value="id">Id</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <input type="submit" class="form-control" value="Search">
                        </div>
                    </div>
                </form>
                <table class="table-list table table-hover">
                    <thead>
                        <tr>
                          <th width="15%">ID</th>
                          <th width="50%">Name</th>
                          <th width="20%">Category</th>
                          <th width="15%">Manage</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            for (Object[] aRow : lt) {
                                Books book = (Books)aRow[0];
                                Category category = (Category)aRow[1];
                                int id = book.getBookId();
                                String bookName = book.getBookName();
                                String categoryName = category.getCategoryName();
                                %>
                                    <tr>
                                        <td><%= id %></td>
                                        <td><%= bookName %></td>
                                        <td><%= categoryName %></td>
                                        <td><a href="/Admin/Book/<%= id %>"><button class="btn btn-primary">View</button></a></td>
                                    </tr>
                                <%
                            }
                            request.removeAttribute("listBook");
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
