<%@page import="HibernateUtil.Chapter"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Chapter> lt = (List<Chapter>)request.getAttribute("chapter");
    Integer ChapterId = lt.get(0).getChapterId();
    String ChapterName = lt.get(0).getChapterName();
    Integer No = lt.get(0).getNo();
    Double Price = lt.get(0).getPrice();
    Integer Quantity = lt.get(0).getQuantity();
    request.removeAttribute("chapter");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Books</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/main.css" rel="stylesheet" type="text/css"/>
    <script src="/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <style>

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
                    <h3><%= ChapterName %></h3>
                </div>
                <div class="form-chapter">
                    <form action="" method="POST" class="form-horizontal">
                        <div class="chapter-detail">
                            <div class="form-group row">
                                <label class="col-md-2 control-label">Chapter Name</label>
                                <div class="col-md-10">
                                    <input type="text" name="name" class="form-control" value="<%= ChapterName %>" required>
                                    <input type="hidden" name="id" value="<%= ChapterId %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">No</label>
                                        <div class="col-md-2">
                                            <input type="number" class="form-control" name="no" value="<%= No %>" required>
                                        </div>
                                        <label class="col-md-2 control-label">Price</label>
                                        <div class="col-md-2">
                                            <input type="text" class="form-control" name="price"  value="<%= Price %>" required>
                                        </div>
                                        <label class="col-md-2 control-label">Quantity</label>
                                        <div class="col-md-2">
                                            <input type="number" class="form-control" name="quantity" value="<%= Quantity %>" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="form-group form-group-submit">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="col-md-2 col-md-offset-10">
                                        <input type="submit" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
