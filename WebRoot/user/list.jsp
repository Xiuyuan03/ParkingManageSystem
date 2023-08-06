<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> user </span>
            <span>list</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?">


                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div>
                    <input type="hidden" name="ac" value="${param.ac}" />
                    <div class="form-group">
                        account

                        <input type="text" class="form-control" style="" name="account" value="${param.account}" />
                    </div>
                    <div class="form-group">
                        name

                        <input type="text" class="form-control" style="" name="name" value="${param.name}" />
                    </div>
                    <div class="form-group">
                        sex

                        <select class="form-control class_sex1" data-value="${param.sex}" id="sex" name="sex">
                            <option value="">please choose</option>
                            <option value="male">male</option>
                            <option value="female">female</option>
                        </select>
                        <script>
                            $(".class_sex1").val($(".class_sex1").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group">
                        phone

                        <input type="text" class="form-control" style="" name="phone" value="${param.phone}" />
                    </div>
                    <div class="form-group">
                        id card

                        <input type="text" class="form-control" style="" name="id_card" value="${param.id_card}" />
                    </div>
                    <select class="form-control" name="order" id="orderby">
                        <option value="id">by release time</option>
                    </select>
                    <select class="form-control" name="sort" id="sort">
                        <option value="desc">reverse order</option>
                        <option value="asc">ascending order</option>
                    </select>
                    <script>
                        $("#orderby").val("${orderby}");
                        $("#sort").val("${sort}");
                    </script>
                    <button type="submit" class="btn btn-default">search</button>


                </form>
            </div>

            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th width="60" data-field="item">id</th>
                            <th>account</th>
                            <th>password</th>
                            <th>name</th>
                            <th>sex</th>
                            <th>phone</th>
                            <th>email</th>
                            <th>id card</th>
                            <th width="220" data-field="handler">operate</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="i" value="0" /><c:forEach items="${list}" var="map"
                            ><c:set var="i" value="${i+1}" />
                            <tr id="${map.id}" pid="">
                                <td width="30" align="center">
                                    <label> ${i} </label>
                                </td>
                                <td>${map.account}</td>
                                <td>${map.password}</td>
                                <td>${map.name}</td>
                                <td>${map.sex}</td>
                                <td>${map.phone}</td>
                                <td>${map.email}</td>
                                <td>${map.id_card}</td>
                                <td align="center">
                                    <a href="user_.do?ac=updt&id=${map.id}">edit</a>

                                    <a href="user_.do?ac=delete&id=${map.id}" onclick="return confirm('Are you sure you want to delete? ')">delete</a>
                                    <!--qiatnalijne-->
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <%@include file="/page.jsp" %>

        </div>
    </div>
</div>
<%@ include file="/foot.jsp" %>

