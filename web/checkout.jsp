<%@page import="Model.User"%>
<%@page import="Model.Inventory"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from kute-themes.com/html/boutique/html/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 11 Jul 2020 08:02:01 GMT -->

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <title>Thanh Toán</title>
        <link rel="stylesheet" type="text/css" href="assets/csss/animate.css">
        <link rel="stylesheet" type="text/css" href="assets/csss/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/csss/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/csss/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="assets/csss/chosen.css">
        <link rel="stylesheet" type="text/css" href="assets/csss/lightbox.min.css">
        <link rel="stylesheet" type="text/css" href="assets/csss/pe-icon-7-stroke.css">
        <link rel="stylesheet" type="text/css" href="assets/csss/jquery.mCustomScrollbar.css">
        <link rel="stylesheet" type="text/css" href="assets/csss/magnific-popup.css">
        <link rel="stylesheet" type="text/css" href="assets/csss/style.css">
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Montserrat">
        <link href='https://fonts.googleapis.com/css?family=Playfair+Display:400italic,400,700,700italic,900,900italic'
              rel='stylesheet' type='text/css'>
        <link
            href='https://fonts.googleapis.com/css?family=Roboto:300,100,100italic,300italic,400,400italic,500,500italic,700,700italic,900,900italic'
            rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
    </head>

    <body>
        <div id="box-mobile-menu" class="box-mobile-menu full-height full-width">
            <div class="box-inner">
                <span class="close-menu"><span class="icon pe-7s-close"></span></span>
            </div>
        </div>
        <div id="header-ontop" class="is-sticky"></div>
        <header id="header" class="header style3">
            <div class="container">
                <div class="main-menu-wapper">
                    <div class="row">
                        <div class="col-sm-12 col-md-3 logo-wapper">
                            <div class="logo">
                                <a class="navbar-brand" href="${pageContext.request.contextPath }/IndexController"><strong>Chợ</strong> Online</a>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-9 menu-wapper">
                            <div class="top-header">
                                <span class="mobile-navigation"><i class="fa fa-bars"></i></span>

                                <div class="box-control">
                                    <form class="box-search">
                                        <div class="inner">
                                            <input type="text" class="search" placeholder="Tìm kiếm...">
                                            <button class="button-search"><span class="pe-7s-search"></span></button>
                                        </div>
                                    </form>

                                    <div class="box-settings">
                                        <span class="icon pe-7s-user"></span>
                                        <div class="settings-wrapper ">
                                            <div class="setting-content">
                                                <div class="setting-option">
                                                    <ul>
                                                        <li><a href="404.html"><i class="icon-user icons"></i><span>Thông tin tài
                                                                    khoản</span></a></li>
                                                        <li><a href="404.html"><i class="icon-note icons"></i><span>Lịch sử đặt
                                                                    hàng</span></a></li>
                                                        <li><a href="404.html"><i class="icon-lock-open icons"></i><span>Đổi mật
                                                                    khẩu</span></a></li>
                                                        <li><a href="404.html"><i class="icon-lock-open icons"></i><span>Đăng
                                                                    xuất</span></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <ul class="boutique-nav main-menu clone-main-menu">
                                <li class="active menu-item-has-children item-megamenu">
                                    <a href=""></a>
                                    <div style="width:500px;" class="sub-menu megamenu">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="mega-custom-menu">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="mega-custom-menu">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="mega-custom-menu">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <form action="${pageContext.request.contextPath }/CheckOutController" method="POST">
            <div class="main-container no-sidebar">
                <div class="container">
                    <div class="main-content">
                        <div class="page-title">
                            <h3>CHECKOUT</h3>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-checkout order">
                                    <h5 class="form-title">YOUR ORDER</h5>
                                    <table class="shop-table order">
                                        <thead>
                                            <tr>
                                                <th class="product-name">PRODUCT</th>
                                                <th class="total">TOTAL</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="total" value="40000"></c:set>
                                            <c:forEach var="item" items="${sessionScope.cart}">
                                                <c:set var="total" value="${total + item.inventory.price * item.quantity }"></c:set>
                                                    <tr>
                                                        <td class="product-name">${item.inventory.name}</td>
                                                    <td class="total"><span class="price">${item.inventory.price * item.quantity}</span></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <button href="" class="button btn-primary medium">Thanh toán</button>
                                </div>
                            </div>
                            <div class="col-sm-6">
                            <%
                                User u = (User)request.getAttribute("user");
                            %>
                                    <div class="form-checkout">
                                        <h5 class="form-title">Thông tin nhận hàng</h5>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p><input type="text" name="txtfname" value="<%=u.getName()%>" placeholder="First Name"></p>
                                            </div>
                                            <div class="col-sm-6">
                                                <p><input type="text" name ="txtlname" value="<%=u.getName()%>" placeholder="Last Name"></p>
                                            </div>
                                            <div class="col-sm-6">
                                                Toltal(VND)
                                                <p><input type="text" name ="amount" disabled value="${total}"></p>
                                            </div>
                                            <div class="col-sm-6">
                                                <p><input type="text" name="txtAddress" value="<%=u.getAddress()%>" placeholder="Address"></p>
                                            </div>
                                            <div class="col-sm-6">
                                                <p><input type="text" name="txtPhone" value="<%=u.getPhone()%>" placeholder="Phone"></p>
                                            </div>


                                        </div>
                                    </div>
                                <div class="form-checkout checkout-payment">
                                    <h5 class="form-title">YOUR PAYMENT</h5>
                                    <div class="payment_methods">
                                        <div class="payment_method">
                                            <label><input name="payment_method" type="radio">COST ON DELIVERY</label>
                                            <div class="payment_box">
                                                Nulla laoreet ipsum dignissim magna maximus, vitae euismod turpis iaculis. Sed
                                                phare tra lacus sit amet dui consequat dignissim bibendum ullamcorper sem.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <footer class="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row flex-flow">
                        <div class="col-sm-12 col-md-4 footer-sidebar">
                            <div class="widget contact-info">
                                <span class="text-primary PlayfairDisplay"></span>
                                <h3 class="widget-title">Hệ thống cửa hàng</h3>
                                <div class="content">
                                    <p class="address"></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-4 footer-sidebar">
                            <div class="widget our-service">
                                <span class="text-primary PlayfairDisplay"></span>
                                <h3 class="widget-title">Dịch vụ</h3>
                                <div class="content">
                                    <ul>
                                        <li><a href="#">About us</a></li>
                                        <li><a href="#">Terms & Condition</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-4 footer-sidebar">
                            <div class="widget widget_social">
                                <span class="text-primary PlayfairDisplay"></span>
                                <h3 class="widget-title">FOLLOW US!</h3>
                                <div class="content">
                                    <div class="social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <a href="#" class="scroll_top" title="Scroll to Top" style="display: block;"><i class="fa fa-arrow-up"></i></a>
        <script type="text/javascript" src="assets/js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
        <script type="text/javascript" src="assets/js/chosen.jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/Modernizr.js"></script>
        <script type="text/javascript" src="assets/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
        <script type="text/javascript" src="assets/js/masonry.pkgd.min.js"></script>
        <script type="text/javascript" src="assets/js/imagesloaded.pkgd.min.js"></script>
        <script type="text/javascript" src="assets/js/isotope.pkgd.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.parallax-1.1.3.js"></script>
        <script type="text/javascript" src="assets/js/jquery.magnific-popup.min.js"></script>
        <script type="text/javascript" src="assets/js/masonry.js"></script>
        <script type="text/javascript" src="assets/js/functions.js"></script>
    </body>

    <!-- Mirrored from kute-themes.com/html/boutique/html/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 11 Jul 2020 08:02:01 GMT -->

</html>