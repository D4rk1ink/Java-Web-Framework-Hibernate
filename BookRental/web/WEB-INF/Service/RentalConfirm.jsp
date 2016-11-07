<%@page import="HibernateUtil.Chapter"%>
<%@page import="HibernateUtil.Rental"%>
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
                    <h3>Confirm</h3>
                </div>
                <div>
                    <table class="table-list table table-hover">
                        <thead>
                            <tr>
                              <th width="20%">ID</th>
                              <th width="50%">Book Name</th>
                              <th width="15%">Quantity</th>
                              <th width="15%">Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                List<Chapter> lt = (List<Chapter>)session.getAttribute("rental");
                                String[] Quantity = (String[])session.getAttribute("quantity");
                                int i = 0;
                                for(Chapter chapter : lt){
                                    Integer id = chapter.getChapterId();
                                    String name = chapter.getChapterName();
                                    String quantity = Quantity[i++];
                                    Double price = chapter.getPrice();
                                    %>
                                        <tr>
                                            <td><%= id %></td>
                                            <td><%= name %></td>
                                            <td><%= quantity %></td>
                                            <td><%= price %></td>
                                        </tr>
                                    <%
                                }
                            %>
                            
                        </tbody>
                    </table>
                </div>
                <form action="" method="POST" class="form-horizontal">
                    <div class="form-group form-group-submit">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="col-md-2 col-md-offset-8">
                                    <button type="button" id="btn-back" class="form-control">Back</button>
                                </div>
                                <div class="col-md-2">
                                    
                                    <input type="submit" class="form-control" name="confirm" value="Confirm">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
