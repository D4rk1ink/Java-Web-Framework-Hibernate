<%@page import="HibernateUtil.Rental"%>
<%@page import="HibernateUtil.Users"%>
<%@page import="HibernateUtil.Chapter"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Double allAmount = 0d;
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment</title>
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
                    <h3>Payment</h3>
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
                                List<Object[]> lt = (List<Object[]>)request.getAttribute("return");
                                String[] quantity = (String[])request.getAttribute("Quantity");
                                Date date1 = (Date)request.getAttribute("dateReturn");
                                int i = 0;
                                for(Object[] aRow : lt){
                                    Rental rental = (Rental)aRow[0];
                                    Chapter chapter = (Chapter)aRow[1];
                                    
                                    Integer ChapterId = rental.getChapterId();
                                    String ChapterName = chapter.getChapterName();
                                    Date date2 = (Date)rental.getDateRental();
                                    Double Price = chapter.getPrice();
                                    Integer Quantity = Integer.parseInt(quantity[i++]);
                                    //out.print(Price*Quantity);
                                    Double amount = ((date1.getTime() - date2.getTime()) / (1000 * 60 * 60 * 24)) * Price * Quantity;
                                    allAmount += amount;
                                    //out.println(date2-date1);
                                    %>
                                        <tr>
                                            <td><%= ChapterId %></td>
                                            <td><%= ChapterName %></td>
                                            <td><%= Quantity %></td>
                                            <td><%= amount %></td>
                                        </tr>
                                    <%
                                }
                                request.removeAttribute("return");
                            %>
                        </tbody>
                    </table>
                </div>
                <div>
                    <h2 align="right">Amount : <%= allAmount %></h2>
                </div>
                <form action="" method="POST" class="form-horizontal">
                    <div class="form-group form-group-submit">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="col-md-2 col-md-offset-10">
                                    <button type="button" id="btn-back" class="form-control">Back</button>
                                </div>
                                <!--<div class="col-md-2">
                                    <input type="submit" class="form-control" name="confirm" value="Confirm">
                                </div>-->
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
