<%@page import="HibernateUtil.Users"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String id;
    String fname;
    String lname;
    String email;
    String birthday;
    String address;
    String gender;
    String phone;
    
%>
<%
    List<Users> lt = (List<Users>)request.getAttribute("user");
    Users user = (Users)lt.get(0);
    id = user.getUserId();
    fname = user.getFirstName();
    lname = user.getLastName();
    gender = user.getGender();
    birthday = user.getBirthday().toString();
    email = user.getEmail();
    address = user.getAddress();
    phone = user.getPhone();
    request.removeAttribute("user");
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
                    <h3>User : <%= id %></h3>
                </div>
                <div class="form-infouser">
                    <form action="" method="POST" class="form-horizontal">
                        <div class="form-group row">
                            <label class="col-md-2 control-label">ID Card</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" value="<%= id %>" disabled>
                                <input type="hidden" name="id" value="<%= id %>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">First Name</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="fname" value="<%= fname %>" required>
                            </div>
                            <label class="col-md-2 control-label">Last Name</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="lname" value="<%= lname %>" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">Email</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="email" value="<%= email %>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">Birthday</label>
                            <div class="col-md-4">
                                <input type="date" class="form-control" name="birthday" value="<%= birthday %>" required>
                            </div>
                            <label class="col-md-2 control-label">Gender</label>
                            <div class="col-md-4">
                                <select name="gender" class="form-control" value="<%= gender %>" required>
                                    <option value="Male" <% if(gender.equals("Male")){ %> selected <% } %>>Male</option>
                                    <option value="Female" <% if(gender.equals("Female")){ %> selected <% } %>>Female</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">Address</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="address" value="<%= address %>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">Phone Number</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="phone" value="<%= phone %>">
                            </div>
                        </div>
                        <hr>
                        <div class="form-group form-group-submit">
                            <div class="col-md-2 col-md-offset-10">
                                <input type="submit" class="form-control" value="Update">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
