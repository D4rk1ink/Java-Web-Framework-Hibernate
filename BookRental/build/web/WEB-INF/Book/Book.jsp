<%@page import="HibernateUtil.Chapter"%>
<%@page import="HibernateUtil.Books"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Object[]> lt = (List<Object[]>)request.getAttribute("chapter");
    String bookname = ((Books)lt.get(0)[0]).getBookName();
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
                    <h3><%= bookname %></h3>
                </div>
                <table class="table-list table table-hover">
                    <thead>
                        <tr>
                          <th width="15%">ID</th>
                          <th width="50%">Name</th>
                          <th width="20%">Price</th>
                          <th width="15%">Manage</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            for (Object[] aRow : lt) {
                                Books book = (Books)aRow[0];
                                Chapter chapter = (Chapter)aRow[1];
                                Integer chapterId = chapter.getChapterId();
                                String name = chapter.getChapterName();
                                Double price = chapter.getPrice();
                                %>
                                    <tr>
                                        <td><%= chapterId %></td>
                                        <td><%= name %></td>
                                        <td><%= price %></td>
                                        <td><a href="/Admin/Book/Chapter/<%= chapterId %>"><button class="btn btn-primary">View</button></a></td>
                                    </tr>
                                <%
                            }
                            request.removeAttribute("chapter");
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
