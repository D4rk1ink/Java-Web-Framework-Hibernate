<script>
    function sideEvent() {
        if($("#mySidenav").hasClass("sideOff")){
            $("#mySidenav").removeClass("sideOff").addClass("sideOn");
            $(".sidenav-on").removeClass("sidenav-hided");
            document.getElementById("right-col").style.marginLeft  = "200px";
            document.getElementById("mySidenav").style.width = "200px";
        }else{
            $("#mySidenav").removeClass("sideOn").addClass("sideOff");
            $(".sidenav-on").addClass("sidenav-hided");
            document.getElementById("right-col").style.marginLeft  = "50px";
            document.getElementById("mySidenav").style.width = "50px";
        }
    }
</script> 
<div class="left-col sideOff" id="mySidenav">
    <div class="sidenav">
        <div class="sidenav-on sidenav-hided">
            <ul class="list-unstyled">
                <li><a href="#">Dashboard</a></li>
            </ul>
            <ul class="list-unstyled">
                <li><a href="#">Rental</a></li>
                <li><a href="#">Return</a></li>
                <li><a href="#">Rental List</a></li>
            </ul>
            <ul class="list-unstyled">
                <li><a href="#">Manage Books</a></li>
                <li><a href="#">Manage Category</a></li>
                <li><a href="#">Add Books</a></li>
            </ul>
            <ul class="list-unstyled">
                <li><a href="#">Manage Users</a></li>
                <li><a href="#">Add User</a></li>
            </ul>
        </div>
        <div class="sidenav-off">
            <ul class="list-unstyled" >
                <li><a href="/Admin"><span class="glyphicon glyphicon-home"></span></a></li>
            </ul>
            <ul class="list-unstyled">
                <li><a href="/Admin/Rental"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
                <li><a href="/Admin/Return"><span class="glyphicon glyphicon-repeat"></span></a></li>
                <li><a href="/Admin/Rental/List"><span class="glyphicon glyphicon-list-alt"></span></a></li>
            </ul>
            <ul class="list-unstyled">
                <li><a href="/Admin/Book"><span class="glyphicon glyphicon-book"></span></a></li>
                <li><a href="/Admin/Book/Category"><span class="glyphicon glyphicon-tags"></span></a></li>
                <li><a href="/Admin/Book/Add"><span class="glyphicon glyphicon-pencil"></span></a></li>
            </ul>
            <ul class="list-unstyled">
                <li><a href="/Admin/User"><span class="glyphicon glyphicon-user"></span></a></li>
                <li><a href="/Admin/User/Add"><span class="glyphicon glyphicon-plus"></span></a></li>
            </ul>
        </div>
    </div>
</div>