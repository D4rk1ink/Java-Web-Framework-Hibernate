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
    <title>Rental List</title>
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
<body>
    <jsp:include page="../Partials/Admin-left-col.jsp" />
    <div class="right-col" id="right-col">
        <jsp:include page="../Partials/Admin-Navbar.jsp" />
        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                <div class="header-title">
                    <h3>Rental List</h3>
                </div>
                <div class="form-return">
                    <form action="../Return/Confirm" method="POST" class="form-horizontal">
                        <table class="table-list table table-hover">
                            <thead>
                                <tr>
                                  <th width="10%"></th>
                                  <th width="25%">Book ID</th>
                                  <th width="50%">Book Name</th>
                                  <th width="15%">Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    List<Object[]> lt = (List<Object[]>)request.getAttribute("return");
                                    for(Object[] aRow : lt){
                                        Users user = (Users)aRow[0];
                                        Rental rental = (Rental)aRow[1];
                                        Chapter chapter = (Chapter)aRow[2];
                                        String UserId = user.getUserId();
                                        Integer ChapterId = rental.getChapterId();
                                        Integer RentalId = rental.getRentalId();
                                        String ChapterName = chapter.getChapterName();
                                        Integer Quantity = rental.getQuantity();
                                        %>
                                            <tr>
                                                <td><input type="checkbox" name="id" value="<%= RentalId %>" id="checkboxbook" checked></td>
                                                <td><%= ChapterId %></td>
                                                <td><%= ChapterName %></td>
                                                <input type="hidden" name="userid" value="<%= UserId %>" >
                                                <td><input type="number" name="quantity" value="<%= Quantity %>" class="form-control" id="quantity" min="1" max="<%= Quantity %>"></td>
                                            </tr>
                                        <%
                                    }
                                    request.removeAttribute("return");
                                %>
                            </tbody>
                        </table>
                        <hr>
                        <div class="form-group form-group-submit">
                            <div class="col-md-2 col-md-offset-10">
                                <input type="submit" class="form-control">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    $("table").on("change","#checkboxbook",function(){
        if($(this).is(":checked")){
            $(this).parent().parent().find("#quantity").first().prop("disabled", false);
        }else{
            $(this).parent().parent().find("#quantity").first().prop("disabled", true);
        }
    });
</script>
</html>
