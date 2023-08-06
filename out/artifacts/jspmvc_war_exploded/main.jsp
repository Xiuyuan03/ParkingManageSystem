<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>基于Java停车场管理系统 后台管理</title>

    <!-- Default Styles (DO NOT TOUCH) -->
    <link rel="stylesheet" href="admin/css/font-awesome.min.css">
    <link rel="stylesheet" href="admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="admin/css/fonts.css">
    <link rel="stylesheet" href="admin/css/soft-admin.css"/>

    <!-- Adjustable Styles -->


    <!-- ADDITIONAL THEMES
    <link rel="stylesheet" href="admin/css/soft-theme-ocean.css"/> // SIMPLE OCEAN THEME
    <link rel="stylesheet" href="admin/css/soft-theme-dark.css"/> // DARK THEME
    <link rel="stylesheet" href="admin/css/soft-theme-blue.css"/> // BLUE THEME
    <link rel="stylesheet" href="admin/css/soft-theme-light.css"/> // LIGHT THEME
    <link rel="stylesheet" href="admin/css/soft-theme-fixed.css"/> // AFFIXES YOUR SIDEBAR AND NAVIGATION
    -->

</head>
<body>

<div class="cntnr">

    <!-- RESPONSIVE LEFT SIDEBAR & LOGO -->
    <div class="left hidden-xs">
        <div class="logo">
            <div class="row">
                <div class="col-sm-4">
                    <c:choose>
                        <c:when test="${sessionScope.touxiang != null && sessionScope.touxiang !=  '' }">

                            <img id="logo" src="${sessionScope.touxiang}"
                                 style="width:50px !important; height:50px; !important">
                        </c:when><c:otherwise>
                        <img id="logo" src="admin/images/22.png" style="width:50px !important; height:50px; !important">
                    </c:otherwise></c:choose>
                </div>
                <div class="col-sm-8" style="line-height: 22px;color: #ffffff;text-align: left">
                    <div>${sessionScope.username}</div>
                    <div>${sessionScope.cx}</div>
                </div>
            </div>
        </div>
        <div class="sidebar">
            <div class="accordion">

                <c:choose>
                    <c:when test="${'管理员' == sessionScope.cx }">

                        <%@ include file="/left_guanliyuan.jsp" %>
                    </c:when></c:choose>
                <c:choose>
                    <c:when test="${'用户' == sessionScope.cx }">

                        <%@ include file="/left_yonghu.jsp" %>
                    </c:when></c:choose>

            </div>
        </div>
    </div>
    <!-- END LEFT SIDEBAR & LOGO -->

    <!-- RIGHT NAV, CRUMBS, & CONTENT -->
    <div class="right">

        <div class="nav">
            <div class="bar">
                <!-- NAV PILLS -->
                <ul class="nav nav-pills hidden-xs" style="margin-left: 40px;">
                    <li class="active"><a href="javascript:;"> 基于Java停车场管理系统</a></li>
                    <!--<li><a href="#"><span class="icon icon-barcode"></span>Labels <span class="label label-primary">1,078</span></a>
                    </li>-->
                    <li><a href="./"><span class="icon icon-home"></span>前台首页</a></li>
                    <li><a href="user.do?ac=logout" onclick="return confirm('确定退出？')"><span
                            class="icon icon-home"></span>退出登录</a></li>
                </ul>

            </div>

            <!-- BREADCRUMBS -->
            <div class="crumbs">
                <ol class="breadcrumb hidden-xs">
                    <li><i class="icon icon-home"></i> <a href="sy.jsp" target="main">欢迎页</a></li>
                    <li class="active"></li>
                </ol>
            </div>
        </div>

        <!-- BEGIN PAGE CONTENT -->
        <div class="content">
            <iframe name="main" src="sy.jsp" id="contents"
                    style="height:100%; vertical-align: middle;" width="100%" scrolling="1" frameborder="0"
                    marginheight="5"
                    marginwidth="5"></iframe>

        </div>
        <!-- END PAGE CONTENT -->

    </div>
    <!-- END NAV, CRUMBS, & CONTENT -->

</div>

<!-- Default JS (DO NOT TOUCH) -->
<script src="js/jquery.js"></script>

<script src="admin/js/bootstrap.min.js"></script>
<script src="admin/js/hogan.min.js"></script>
<script src="admin/js/typeahead.min.js"></script>
<script src="admin/js/typeahead-example.js"></script>

<script>
    setInterval(function () {
        $.post("./", "", function () {

        });
    }, 60 * 1000);
</script>
</body>
</html>