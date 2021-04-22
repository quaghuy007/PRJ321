<%@page import="Model.User"%>
<%@page import="Model.Inventory"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <title>Carts</title>
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
                            <div class="slogan">"Raise your style !"</div>
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
    <div class="main-container no-sidebar">
        <div class="container">
            <div class="main-content">
                <div class="page-title">
                    <h3>SHOPPING CART</h3>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-8">
                        <table class="shop_table cart">
                            <thead>
                                <tr>
                                    <th colspan="2" class="product-name">Product</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Qty</th>
                                    <th class="product-subtotal">Total</th>
                                    <th class="product-remove">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="total" value="40000"></c:set>
                                <c:forEach var="item" items="${sessionScope.cart}">
                                    <c:set var="total" value="${total + item.inventory.price * item.quantity }"></c:set>
                                <tr>
                                    <td class="product-thumbnail"><img src=${item.inventory.urlImg} alt=""></td>

                                    <td class="product-name"><a href="#">${item.inventory.name}</a></td>
                                    <td>${item.inventory.price} VND</td>
                                    <td><input class="qty" type="text" disabled value=${item.quantity }></td>
                                    <td>${item.inventory.price * item.quantity} VND</td>
                                    <td class="product-remove"><a href="${pageContext.request.contextPath }/cart?action=remove&id=${item.inventory.id}"><i class="fa fa-close"></i></a></td>
                                </tr>
                                </c:forEach>
                               
                            </tbody>
                        </table>
                        <div class="box-coupon">
                            <div class="coupon">
                                <h3 class="coupon-box-title">Coupon</h3>
                                <div class="inner-box">
                                    <input type="text" name="coupon_code" class="input-text" id="coupon_code" value=""
                                        placeholder="Coupon code">
                                    <input type="submit" class="button" name="apply_coupon" value="Apply Coupon">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4">
                        <div class="box-cart-total">
                            <h2 class="title">Cart Totals</h2>
                            <table>
                                <tr>
                                    <td>Phí vận chuyển</td>
                                    <td><span class="price">40.000 VND</span></td>
                                </tr>
                                <tr class="order-total">
                                    <td>Tổng cộng</td>
                                    <td><span class="price">${total} VND</span></td>
                                </tr>
                            </table>
                            <button class="button medium">Xóa tất cả</button>
                            <c:forEach var="item" items="${sessionScope.cart}">
                            <button class="button btn-primary medium checkout-button"><a href="${pageContext.request.contextPath }/CheckOut?id=${item.inventory.id}&name=${String.valueOf(request.getAtrribute("account"))}">Đặt Hàng</a></button>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer">
        <div class="footer-top">
            <div class="container">
                <div class="row flex-flow">


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

</html>