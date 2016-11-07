<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <h3>Add User</h3>
                </div>
                <div class="form-adduser">
                    <form action="" method="POST" class="form-horizontal">
                        <div class="form-group row">
                            <label class="col-md-2 control-label">ID Card</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="id" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">First Name</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="fname" required>
                            </div>
                            <label class="col-md-2 control-label">Last Name</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="lname" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">Email</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="email">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">Birthday</label>
                            <div class="col-md-4">
                                <input type="date" class="form-control" name="birthday" required>
                            </div>
                            <label class="col-md-2 control-label">Gender</label>
                            <div class="col-md-4">
                                <select name="gender" class="form-control" required>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">Address</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="address">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">Phone Number</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="phone">
                            </div>
                        </div>
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
<script>
    
</script>
</body>
</html>
