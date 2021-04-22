<%-- 
    Document   : Index
    Created on : Jul 8, 2020, 8:42:49 PM
    Author     : nqh14
--%>
<%@page import="Model.User"%>
<%@page import="Model.Inventory"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Chợ Online</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!-- Fontawesome core CSS -->
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
        <!--GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
        <!--Slide Show Css -->
        <link href="assets/ItemSlider/css/main-style.css" rel="stylesheet" />
        <!-- custom CSS here -->
        <link href="assets/css/style.css" rel="stylesheet" />
    </head>
    <body>
        
            <nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"><strong>Chợ</strong> Online</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="cart.jsp">Giỏ Hàng</a></li>
                            <%
                                String username = (String) session.getAttribute("account");
                                if (username == null) {
                            %>

                            <li><a href="login.jsp">Đăng Nhập</a></li>
                            <li><a href="register.jsp">Đăng Ký</a></li>

                            <% } else {
                            %>
                            <li>Chào mừng, <%=username%>  <a href="">Đăng xuất</a></li>
                                <% }%>


                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Hỗ Trợ Khác Hàng <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#"><strong>HotLine: </strong>+84386624076</a></li>
                                    <li><a href="#"><strong>Mail: </strong>huynqhe140638@fpt.edu.vn</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#"><strong>Address: </strong>
                                            <div>
                                                Thôn 8, xã Thạch Hòa<br />
                                                Thạch Thất, Hà Nội
                                            </div>
                                        </a></li>
                                </ul>
                            </li>
                        </ul>
                                <form action="${pageContext.request.contextPath}/search" class="navbar-form navbar-right" role="search" method="POST">
                            <div class="form-group">
                                <input type="text" name ="txtSearch" placeholder="Nhập từ khóa ..." class="form-control">
                            </div>
                            &nbsp; 
                            <button type="submit" name="btnSearch" class="btn btn-primary">Tìm Kiếm</button>
                            <button type="submit" name="btnSearchPrice" class="btn btn-primary">Tìm Kiếm(khoảng giá)</button>
                        </form>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="well well-lg offer-box text-center">


                            Ưu đãi ngay hôm nay : &nbsp; <span class="glyphicon glyphicon-cog"></span>&nbsp; Giảm giá 40 % cho hóa đơn thanh toán từ 3 triệu đồng trở lên(tối đa 2 triệu đồng) !                


                        </div>
                        <div class="main box-border">
                            <div id="mi-slider" class="mi-slider">
                                <ul>

                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/1.jpg" alt="img01"><h4>Giày cao cổ</h4>
                                        </a></li>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/2.jpg" alt="img02"><h4>Giày tây</h4>
                                        </a></li>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/3.jpg" alt="img03"><h4>Giày lười</h4>
                                        </a></li>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/4.jpg" alt="img04"><h4>Giày sneaker</h4>
                                        </a></li>
                                </ul>
                                <ul>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/5.jpg" alt="img05"><h4>Thắt Lưng</h4>
                                        </a></li>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/6.jpg" alt="img06"><h4>Mũ</h4>
                                        </a></li>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/7.jpg" alt="img07"><h4>Kính</h4>
                                        </a></li>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/8.jpg" alt="img08"><h4>Khăn</h4>
                                        </a></li>
                                </ul>
                                <ul>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/9.jpg" alt="img09"><h4>Đơn Giản</h4>
                                        </a></li>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/10.jpg" alt="img10"><h4>Thời Thượng</h4>
                                        </a></li>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/11.jpg" alt="img11"><h4>Thể Thao</h4>
                                        </a></li>
                                </ul>
                                <ul>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/12.jpg" alt="img12"><h4>Vali</h4>
                                        </a></li>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/13.jpg" alt="img13"><h4>Túi Xách Tay</h4>
                                        </a></li>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/14.jpg" alt="img14"><h4>Đựng Laptop</h4>
                                        </a></li>
                                    <li><a href="#">
                                            <img src="assets/ItemSlider/images/15.jpg" alt="img15"><h4>Cặp Tài Liệu</h4>
                                        </a></li>
                                </ul>
                                <nav>
                                    <a href="#">Giày</a>
                                    <a href="#">Phụ Kiện</a>
                                    <a href="#">Đồng Hồ</a>
                                    <a href="#">Túi & Cặp</a>
                                </nav>
                            </div>

                        </div>
                        <br />
                    </div>
                    <!-- /.col -->                      
                    <div class="col-md-3 text-center">
                        <div class=" col-md-12 col-sm-6 col-xs-6" >
                            <div class="offer-text">
                                giảm giá 30%
                            </div>
                            <div class="thumbnail product-box">
                                <a href=""><img  src="assets/img/dummyimg.png" id="1" alt="" ></a>
                                <div class="caption">
                                    <h3><a href="#">Samsung Galaxy </a></h3>
                                    <p><a href="#">Mua Ngay </a></p>
                                </div>
                            </div>
                        </div>
                        <div class=" col-md-12 col-sm-6 col-xs-6">
                            <div class="offer-text2">
                                giảm giá 30%
                            </div>
                            <div class="thumbnail product-box">
                                <img src="assets/img/laptop.jpg" alt="" />
                                <div class="caption">
                                    <h3><a href="#">Laptop Dell</a></h3>
                                    <p><a href="#">Mua Ngay</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-md-3">
                        <div>
                            <a href="#" class="list-group-item active">Điện Tử
                            </a>
                            <ul class="list-group">

                                <li class="list-group-item">Điện Thoại Di Động
                                    <span class="label label-primary pull-right">234</span>
                                </li>
                                <li class="list-group-item">Máy Tính
                                    <span class="label label-success pull-right">34</span>
                                </li>
                                <li class="list-group-item">Máy Tính Bảng
                                    <span class="label label-danger pull-right">4</span>
                                </li>
                                <li class="list-group-item">Đồ Trang Trí
                                    <span class="label label-info pull-right">434</span>
                                </li>
                                <li class="list-group-item">Giả Trí
                                    <span class="label label-success pull-right">34</span>
                                </li>
                            </ul>
                        </div>
                        <!-- /.div -->
                        <div>
                            <a href="#" class="list-group-item active list-group-item-success">Quần Áo
                            </a>
                            <ul class="list-group">

                                <li class="list-group-item">Dành cho nam
                                    <span class="label label-danger pull-right">300</span>
                                </li>
                                <li class="list-group-item">Dành cho nữ
                                    <span class="label label-success pull-right">340</span>
                                </li>
                                <li class="list-group-item">Dành cho trẻ em
                                    <span class="label label-info pull-right">735</span>
                                </li>

                            </ul>
                        </div>
                        <!-- /.div -->
                        <div>
                            <a href="#" class="list-group-item active">Phụ Kiện
                            </a>
                            <ul class="list-group">
                                <li class="list-group-item">Dành Cho Điện Thoại
                                    <span class="label label-warning pull-right">456</span>
                                </li>
                                <li class="list-group-item">Dành Cho Nam Giới
                                    <span class="label label-success pull-right">156</span>
                                </li>
                                <li class="list-group-item">Dành Cho Nữ Giới
                                    <span class="label label-info pull-right">400</span>
                                </li>
                                <li class="list-group-item">Dành Cho Trẻ Em
                                    <span class="label label-primary pull-right">89</span>
                                </li>
                                <li class="list-group-item">Sản Phẩm Gia Dụng
                                    <span class="label label-danger pull-right">90</span>
                                </li>
                                <li class="list-group-item">Sản Phẩm Nhà Bếp
                                    <span class="label label-warning pull-right">567</span>
                                </li>
                            </ul>
                        </div>

                        <div class="well well-lg offer-box offer-colors">


                            <span class="glyphicon glyphicon-star-empty"></span>Siêu giảm giá  , Mua ngay!                 

                            <br />
                            <br />
                            <div class="progress progress-striped">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 70%">
                                    <span class="sr-only">70% Complete (success)</span>
                                    còn lại 2 tiếng trước khi chương trình kết thúc
                                </div>
                            </div>
                            <a href="#">click vào đây để xem thêm </a>
                        </div>
                        <!-- /.div -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-9">
                        <div>
                            <ol class="breadcrumb">
                                <li><a href="#">Trang chủ</a></li>
                                <li class="active">Điện tử</li>
                            </ol>
                        </div>
                        <!-- /.div -->
                        <div class="row">
                            <div class="btn-group alg-right-pad">
                                <button type="button" class="btn btn-default"><strong>1235  </strong>sản phẩm</button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                                        Sắp xếp &nbsp;
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Giá từ thấp tới cao</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Giá từ cao tới thấp</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Số lượng mua</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Số lượt review</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.row -->
                        

                            <div class="row">
                                <c:forEach items="${list}" var="i">
                                <div class="col-md-4 text-center col-sm-6 col-xs-6">
                                    <div class="thumbnail product-box">
                                        <img src=${i.getUrlImg()} alt="" />
                                        <div class="caption">
                                            <h3><a href="#">${i.getName()} </a></h3>
                                            <p>Giá : <strong>${i.getPrice()} VND</strong>  </p>
                                            <p><a href="${pageContext.request.contextPath }/cart?&action=buy&id=${i.getId()}">Mua Ngay </a></p>
                                            <p>${i.getDes()}</p>
                                            <p><a href="${pageContext.request.contextPath}/cart?&action=add&id=${i.getId()}" class="btn btn-success" role="button" name="btnAddCart">Thêm vào giỏ hàng</a> <a href="product.jsp" class="btn btn-primary" role="button">
                                                    Xem chi tiết</a></p>
                                        </div>
                                    </div>
                                </div>
                                 </c:forEach>
                            </div>

                            <!-- /.row -->
                            <div class="row">
                                <ul class="pagination alg-right-pad">
                                    <li><a href="#">&laquo;</a></li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">&raquo;</a></li>
                                </ul>
                            </div>
                            <!-- /.row -->
                            <div>
                                <ol class="breadcrumb">
                                    <li><a href="#">Trang chủ</a></li>
                                    <li><a href="#">Quần Áo</a></li>
                                    <li class="active">Dành cho nam</li>
                                </ol>
                            </div>
                            <!-- /.div -->
                            <div class="row">
                                <div class="btn-group alg-right-pad">
                                    <button type="button" class="btn btn-default"><strong>3005  </strong>sản phẩm</button>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                            Sắp xếp &nbsp;
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">Giá từ thấp tới cao</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">Giá từ cao tới thấp</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">Số lượng mua</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">Số lượt review</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <c:forEach items="${listNam}" var="in">
                                <div class="col-md-4 text-center col-sm-6 col-xs-6">
                                    <div class="thumbnail product-box">
                                        <img src=${in.getUrlImg()} alt="" />
                                        <div class="caption">
                                            <h3><a href="#">${in.getName()}</a></h3>
                                            <p>Price : <strong>${in.getPrice()} VND</strong>  </p>
                                            <p><a href="${pageContext.request.contextPath}/cart?&action=buy&id=${i.getId()}">Mua Ngay </a></p>
                                            <p>${in.getDes()}</p>
                                            <p><a href="${pageContext.request.contextPath}/cart?&action=add&id=${i.getId()}" class="btn btn-success" role="button">Thêm vào giỏ hàng</a> <a href="#" class="btn btn-primary" role="button">Xem chi tiết</a></p>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <ul class="pagination alg-right-pad">
                                    <li><a href="#">&laquo;</a></li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">&raquo;</a></li>
                                </ul>
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container -->
            
            <!--Footer -->
            <div class="col-md-12 footer-box">


                <div class="row small-box ">
                    <strong>Điện Thoại Di Động :</strong> <a href="#">samsung</a> |  <a href="#">Sony</a> | <a href="#">iPhone</a> | 
                    xem tất cả

                </div>
                <div class="row small-box ">
                    <strong>Laptops :</strong> <a href="#">Dell</a> |  <a href="#">Acer</a> | <a href="#">Mac</a> | 
                    xem tất cả
                </div>
                <div class="row small-box ">
                    <strong>Máy Tính Bảng : </strong><a href="#">samsung</a> |  <a href="#">Sony Tablets</a> | <a href="#">Microx</a> | 
                    view all items

                </div>
                <div class="row small-box pad-botom ">
                    <strong>Quần Áo :</strong> <a href="#">Nam</a> |  <a href="#">Nữ</a> | <a href="#">Trẻ Em</a> |   
                    view all items

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <strong>Gửi Feedback Nhanh</strong>
                        <hr>
                        <form>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" required="required" placeholder="Tên">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" required="required" placeholder="Email">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <textarea name="message" id="message" required="required" class="form-control" rows="3" placeholder="Message"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">Gửi</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-4">
                        <strong>Địa Chỉ</strong>
                        <hr>
                        <p>
                            Thôn 8, xã Thạch Hòa<br />
                            Thạch Thất, Hà Nội<br />
                            +84386624076<br>
                            Email: huynqhe140638@fpt.edu.vn<br>
                        </p>

                        2020 www.ChoOnline.com | All Right Reserved
                    </div>
                    <div class="col-md-4 social-box">
                        <strong>See more on </strong>
                        <hr>
                        <a href="#"><i class="fa fa-facebook-square fa-3x "></i></a>
                        <a href="#"><i class="fa fa-instagram fa-3x "></i></a>
                        <a href="#"><i class="fa fa-pinterest-square fa-3x "></i></a>
                        <p>
                            Kết nối với chúng tôi để nhận những ưu đãi và thôn tin về sản phẩm 1 cách nhanh nhất.
                        </p>
                    </div>
                </div>
                <hr>
            </div>
            <!-- /.col -->
            <div class="col-md-12 end-box ">
                &copy; 2020 | &nbsp; All Rights Reserved | &nbsp; www.ChoOnline.com | &nbsp; Hỗ trợ khách hàng 24/7 | &nbsp; Email : huynqhe140638@fpt.edu.vn
            </div>
            <!-- /.col -->
            <!--Footer end -->
            <!--Core JavaScript file  -->
            <script src="assets/js/jquery-1.10.2.js"></script>
            <!--bootstrap JavaScript file  -->
            <script src="assets/js/bootstrap.js"></script>
            <!--Slider JavaScript file  -->
            <script src="assets/ItemSlider/js/modernizr.custom.63321.js"></script>
            <script src="assets/ItemSlider/js/jquery.catslider.js"></script>
            <SCRIPT type="text/javascript">
                                    function doNextPage {
                                        location.href = "InventoryController";
                                    }
            </SCRIPT>
            <script>
                $(function () {

                    $('#mi-slider').catslider();

                });
            </script>
    </body>
</html>


