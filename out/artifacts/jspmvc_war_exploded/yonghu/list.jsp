<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 用户 </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div>
                    <input type="hidden" name="ac" value="${param.ac}" />
                    <div class="form-group">
                        账号

                        <input type="text" class="form-control" style="" name="zhanghao" value="${param.zhanghao}" />
                    </div>
                    <div class="form-group">
                        姓名

                        <input type="text" class="form-control" style="" name="xingming" value="${param.xingming}" />
                    </div>
                    <div class="form-group">
                        性别

                        <select class="form-control class_xingbie1" data-value="${param.xingbie}" id="xingbie" name="xingbie">
                            <option value="">请选择</option>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                        <script>
                            $(".class_xingbie1").val($(".class_xingbie1").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group">
                        手机

                        <input type="text" class="form-control" style="" name="shouji" value="${param.shouji}" />
                    </div>
                    <div class="form-group">
                        身份证

                        <input type="text" class="form-control" style="" name="shenfenzheng" value="${param.shenfenzheng}" />
                    </div>
                    <select class="form-control" name="order" id="orderby">
                        <option value="id">按发布时间</option>
                    </select>
                    <select class="form-control" name="sort" id="sort">
                        <option value="desc">倒序</option>
                        <option value="asc">升序</option>
                    </select>
                    <script>
                        $("#orderby").val("${orderby}");
                        $("#sort").val("${sort}");
                    </script>
                    <button type="submit" class="btn btn-default">搜索</button>

                    <!--form标签结束-->
                </form>
            </div>

            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th width="60" data-field="item">序号</th>
                            <th>账号</th>
                            <th>密码</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>手机</th>
                            <th>邮箱</th>
                            <th>身份证</th>
                            <th width="220" data-field="handler">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="i" value="0" /><c:forEach items="${list}" var="map"
                            ><c:set var="i" value="${i+1}" />
                            <tr id="${map.id}" pid="">
                                <td width="30" align="center">
                                    <label> ${i} </label>
                                </td>
                                <td>${map.zhanghao}</td>
                                <td>${map.mima}</td>
                                <td>${map.xingming}</td>
                                <td>${map.xingbie}</td>
                                <td>${map.shouji}</td>
                                <td>${map.youxiang}</td>
                                <td>${map.shenfenzheng}</td>
                                <td align="center">
                                    <a href="yonghu.do?ac=updt&id=${map.id}">编辑</a>

                                    <a href="yonghu.do?ac=delete&id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
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

