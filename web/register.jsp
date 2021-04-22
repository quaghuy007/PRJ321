
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <!-- Meta tag Keywords -->
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Flat Sign Up Form Responsive Widget Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Meta tag Keywords -->
        <!-- css files -->
        <link href="assets/css/stylere.css" rel="stylesheet" type="text/css" media="all">
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
        <!-- //css files -->
        <!-- online-fonts -->
        <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'><link href='//fonts.googleapis.com/css?family=Raleway+Dots' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <%
        String c = "";
        if(request.getAttribute("result") != null){
            c = String.valueOf(request.getAttribute("result"));
        }
    %>
            <!--header-->
            <div class="header-w3l">
                <h1>Flat Sign Up Form</h1>
            </div>
            <!--//header-->
            <!--main-->
            <div class="main-agileits">
                <h2 class="sub-head">Sign Up</h2>
                <br>	
                                        <h4 class="error"><%=c%></h4>
                                        <br>
                <div class="sub-main">	
                    <form action="${pageContext.request.contextPath}/RegisterController" method="POST">
                        <input  placeholder="Tên đăng nhập" name="username" class="username" type="text" required="">
                        <span class="icon6"><i class="fa fa-envelope" aria-hidden="true"></i></span><br>
                        <input  placeholder="Mật Khẩu" name="password" class="pass" type="password" required="">
                        <span class="icon5"><i class="fa fa-phone" aria-hidden="true"></i></span><br>
                        <input placeholder="Tên" name="name" class="name" type="text" required="">
                        <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span><br>
                        <input placeholder="Địa Chỉ" name="address" class="address" type="text" required="">
                        <span class="icon2"><i class="fa fa-unlock" aria-hidden="true"></i></span><br>
                        <input placeholder="Số điện thoại" name="phone" class="number" type="text" required="">
                        <span class="icon3"><i class="fa fa-user" aria-hidden="true"></i></span><br>
                        <input placeholder="Email" name="mail" class="mail" type="text" required="">
                        <span class="icon4"><i class="fa fa-home" aria-hidden="true"></i></span><br>
                        <input type="submit"  value="Đăng Ký" name="btnDangKy">
                    </form>
                </div>
                <div class="clear"></div>
            </div>      
    </body>
</html>