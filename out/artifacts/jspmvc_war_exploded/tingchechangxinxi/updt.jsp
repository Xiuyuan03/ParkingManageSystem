<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css" />
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑停车场信息:</div>
            <div class="panel-body">
                <form action="tingchechangxinxi.do?ac=update" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车场编号</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入停车场编号"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="tingchechangbianhao"
                                    name="tingchechangbianhao"
                                    value="${Info.html(mmm.tingchechangbianhao)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车场名称<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入停车场名称"
                                    style="width: 250px"
                                    data-rule-required="true"
                                    data-msg-required="请填写停车场名称"
                                    id="tingchechangmingcheng"
                                    name="tingchechangmingcheng"
                                    value="${Info.html(mmm.tingchechangmingcheng)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">位置<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_weizhi5"
                                    data-value="${Info.html(mmm.weizhi)}"
                                    data-rule-required="true"
                                    data-msg-required="请填写位置"
                                    id="weizhi"
                                    name="weizhi"
                                    style="width: 250px"
                                >
                                    <ssm:sql var="select" type="select">SELECT * FROM tingcheweixinxi ORDER BY id desc</ssm:sql>
                                    <c:forEach items="${select}" var="m">
                                        <option value="${m.id}">${m.tingchechangmingcheng}</option>
                                    </c:forEach>
                                </select>
                                <script>
                                    $(".class_weizhi5").val($(".class_weizhi5").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车场介绍<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <textarea
                                    data-rule-required="true"
                                    data-msg-required="请填写停车场介绍"
                                    id="tingchechangjieshao"
                                    name="tingchechangjieshao"
                                    style="max-width: 750px; width: 100%; height: 300px"
                                >
${Info.html(mmm.tingchechangjieshao)}</textarea
                                >
                                <script>
                                    (function () {
                                        var um = UM.getEditor("tingchechangjieshao");
                                    })();
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="id" value="${mmm.id}" type="hidden" />
                                <input name="referer" value="<%=request.getHeader("referer") %>" type="hidden" />
                                <input name="updtself" value="${updtself}" type="hidden" />

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

