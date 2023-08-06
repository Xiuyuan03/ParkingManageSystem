<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Background login of parking lot management system based on Java</title>

        <!-- Default Styles (DO NOT TOUCH) -->
        <link rel="stylesheet" href="admin/css/font-awesome.min.css" />
        <link rel="stylesheet" href="admin/css/bootstrap.min.css" />
        <link rel="stylesheet" href="admin/css/fonts.css" />
        <link type="text/css" rel="stylesheet" href="admin/css/soft-admin.css" />

        <!-- Adjustable Styles -->
        <link type="text/css" rel="stylesheet" href="admin/css/icheck.css?v=1.0.1" />
        <style>
            body {
                background: url(admin/img/9.png) no-repeat center;
                background-size: cover;
            }

            #logo {
                background: #ffffff;
                width: 220px;
                height: 60px;
                color: #999;
                line-height: 60px;
                font-size: 16px;
                margin: auto;
                position: relative;
                top: 30px;
            }

            #log-tbl {
                width: 100%;
                height: 100%;
                display: table;
                clear: both;
                content: "";
            }

            #log-contain {
                width: 100%;
                height: 100%;
                text-align: center;
                display: table-cell;
                vertical-align: middle;
                padding-bottom: 140px;
            }

            #login {
                color: #555;
                width: 460px;
                margin: auto;
                padding: 65px 25px 20px 25px;
                background: #FFF;
                text-align: left;
            }

            #log-contain .tbl {
                margin: auto;
                padding: 15px 10px;
                background: #EFEFEF;
                width: 460px;
                border-top: 1px solid #ddd;
            }

            #login .input-icon > .icon {
                color: #CCC;
            }

            #login .input-icon {
                position: relative;
                top: -20px;
            }

            #login .form-group.remember {
                margin-bottom: 30px;
                color: #777;
            }

            #login label {
                font-weight: normal !important;
            }

            .social {
                width: 40px;
                margin-left: auto;
                margin-right: auto;
                position: relative;
                top: 150px;
                right: -250px;
            }

            .social > .btn {
                width: 40px !important;
                -webkit-border-top-right-radius: 5px;
                -webkit-border-bottom-right-radius: 5px;
                -moz-border-radius-topright: 5px;
                -moz-border-radius-bottomright: 5px;
                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;
            }
        </style>
    </head>
    <body>
        <div id="log-tbl">
            <div id="log-contain">
                <div id="logo" style="z-index: 100">Login page</div>

                <div id="login">
                    <h3 class="text-center" style="margin-top: -30px; margin-bottom: 30px">Java-based parking lot management system</h3>
                    <form id="login-form" class="form" method="post" action="user.do?ac=login&a=a&admin=1">
                        <div class="form-group">
                            <div class="input-icon">
                                <i class="icon icon-user"></i>
                                <input
                                    class="form-control form-soft input-sm"
                                    id="login-username"
                                    placeholder="account"
                                    name="username"
                                    type="text"
                                    style="margin-top: 0px; margin-bottom: 0px"
                                />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-icon">
                                <i class="icon icon-lock"></i>
                                <input class="form-control form-soft input-sm" name="pwd" id="login-password" placeholder="password" type="password" />
                            </div>
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="cx">
                                <option value="administrator">administrator</option>
                                <option value="user">user</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" style="display: inline-block; width: 180px" name="pagerandom" placeholder="verification code" required="" />
                            <img
                                alt="刷新verification code"
                                onClick="this.src='captch.do?time='+new Date().getTime();"
                                src="captch.do"
                                style="cursor: pointer; padding-top: 10px; width: 60px; height: 50px"
                            />
                        </div>
                        <div class="form-group">
                            <button type="submit" id="login-btn" class="btn btn-primary btn-block btn-lg">login&nbsp;&nbsp;&nbsp;</button>
                            <a href="user_.do?ac=add" class="btn btn-primary btn-block btn-lg">user register</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Default JS (DO NOT TOUCH) -->
        <script src="js/jquery.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>

        <!-- Adjustable JS -->
    </body>
</html>
