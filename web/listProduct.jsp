<%-- 
    Document   : listProduct
    Created on : Jul 29, 2020, 8:06:56 AM
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

        <div class="row">
            <c:forEach items="${listproductPr}" var="i">
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
    </body>
</html>
