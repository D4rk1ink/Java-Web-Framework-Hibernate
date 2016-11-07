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
<body onload="init()">
    <jsp:include page="../Partials/Admin-left-col.jsp" />
    <div class="right-col" id="right-col">
        <jsp:include page="../Partials/Admin-Navbar.jsp" />
        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                <div class="header-title">
                    <h3>Rental</h3>
                </div>
                <div class="form-rental">
                    <form action="Rental/Confirm" method="POST" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-2 control-label">User Id</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="userid" required>
                            </div>
                        </div>
                        <hr>
                        <div id="listbook">

                        </div>
                        <div class="form-group form-group-submit">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="col-md-2 col-md-offset-8">
                                        <button type="button" id="btn-addlist" class="form-control">Add Book</button>
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
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="col-md-2 control-label">Id</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="bookid" required>
                        </div>
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
    }
    
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
