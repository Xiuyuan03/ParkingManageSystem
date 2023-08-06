<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">添加留言:</div>
            <div class="panel-body">
                <form action="liuyan.do?ac=insert" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="输入姓名" style="width: 150px" id="xingming" name="xingming" value="" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">联系电话</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入联系电话"
                                    style="width: 150px"
                                    phone="true"
                                    data-msg-phone="请输入正确手机号码"
                                    id="lianxidianhua"
                                    name="lianxidianhua"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">留言内容</label>
                            <div class="col-sm-10">
                                <textarea style="width: 80%; height: 120px" class="form-control" placeholder="输入留言内容" id="liuyanneirong" name="liuyanneirong"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">留言人</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入留言人"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="liuyanren"
                                    name="liuyanren"
                                    value="${sessionScope.username}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary" name="Submit">提交</button>
                                <button type="reset" class="btn btn-default" name="Submit2">重置</button>
                            </div>
                        </div>
                    </div>

                    <!--form标签结束-->
                </form>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>

    <script>
        $(function () {
            $("#form1").validate();
        });
    </script>
</div>
<%@ include file="/foot.jsp" %>

