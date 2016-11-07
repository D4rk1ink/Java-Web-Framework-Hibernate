<%@page import="HibernateUtil.Category"%>
<%@page import="HibernateUtil.Books"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    List<Books> books;
    List<Category> category;
%>
<%
    books = (List<Books>)request.getAttribute("books");
    category = (List<Category>)request.getAttribute("category");
    request.removeAttribute("listBooks");
    request.removeAttribute("listCategory");
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
        .list-remove{
            float: right;
            padding: 0 15px;
            margin-bottom: 5px;
        }
        .listbook-book .form-group:last-child{
            margin-bottom: 0px;
        }
        .create-newbook{
            max-height: 0px;
            overflow: hidden;
            transition: max-height 0.5s ease-out, visibility 0.5s, opacity 0.5s;
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
<body onload="init()">
    <jsp:include page="../Partials/Admin-left-col.jsp" />
    <div class="right-col" id="right-col">
        <jsp:include page="../Partials/Admin-Navbar.jsp" />
        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                <div class="header-title">
                    <h3>Add Book</h3>
                </div>
                <div class="form-addbook">
                    <form action="" method="POST" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Book Name</label>
                            <div class="col-md-10">
                                <select name="bookname" class="form-control" id="select-bookname">
                                    <%
                                        for (Books book : books) {
                                            Integer id = book.getBookId();
                                            String bookname = book.getBookName();
                                            %>
                                                <option value="<%= id %>"><%= bookname %></option>
                                            <%
                                        }
                                    %>
                                    <option value="create" id="create">New Create</option>
                                </select>
                            </div>
                        </div>
                        <div class="create-newbook" id="create-newbook">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label"></label>
                                        <div class="col-md-6">
                                            <input type="text" name="newbookname" class="form-control" placeholder="Book Name" id="newbookname">
                                        </div>
                                        <label class="col-md-1 control-label">Category</label>
                                        <div class="col-md-3">
                                            <select name="category" class="form-control" required>
                                                <%
                                                    for(Category c : category) {
                                                        Integer id = c.getCategoryId();
                                                        String categoryname = c.getCategoryName();
                                                        %>
                                                        <option value="<%= id %>"><%= categoryname %></option>
                                                        <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div id="listbook">

                        </div>
                        <div class="form-group form-group-submit">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="col-md-2 col-md-offset-8">
                                        <button type="button" id="btn-addlist" class="form-control">Add List</button>
                                    </div>
                                    <div class="col-md-2">
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
    <div id="template-book" style="display: none">
        <div class="listbook-book" id="listbook-book">
            <div class="row">
                <div class="list-remove" id="list-remove">
                    <span class="glyphicon glyphicon-remove-sign"></span>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-2 control-label">Chapter Name</label>
                <div class="col-md-10">
                    <input type="text" name="name" class="form-control" required>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="col-md-2 control-label">No</label>
                        <div class="col-md-2">
                            <input type="number" class="form-control" name="no" required>
                        </div>
                        <label class="col-md-2 control-label">Price</label>
                        <div class="col-md-2">
                            <input type="text" class="form-control" name="price" required>
                        </div>
                        <label class="col-md-2 control-label">Quantity</label>
                        <div class="col-md-2">
                            <input type="number" class="form-control" name="quantity" required>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>  
    </div>
<script>
    var template = null;
    function init(){ 
        template = $("#template-book").html();
        $("#listbook").append(template);
        if($("#select-bookname").val() == "create"){
            $("#create-newbook").css("max-height", "40px");
            $("#newbookname").prop("disable",false);
            $("#newbookname").prop("required",true);
        }
    }
    
    $("#select-bookname").on("change", function() {
        if(this.value == "create"){
            $("#create-newbook").css("max-height", "40px");
            $("#newbookname").prop("disable",false);
            $("#newbookname").prop("required",true);
        }else{
            $("#create-newbook").css("max-height", "0px");
            $("#newbookname").prop("disable",true);
            $("#newbookname").prop("required",false);
        }
    });
    
    $("#btn-addlist").on( "click", function() {
        $("#listbook").append(template);
    });
    
    $("#listbook").on( "click", "#list-remove", function() {
        if($("#listbook").children().length > 1){
            $(this).parents("#listbook-book").remove();
        }
    });
</script>
</body>
</html>
