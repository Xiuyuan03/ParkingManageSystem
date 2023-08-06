<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/jquery.validate.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">添加出场:</div>
            <div class="panel-body">
                <form action="chuchang.do?ac=insert" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <input type="hidden" name="tingcheid" value="${param.id}" /> <input type="hidden" name="tingchechangxinxiid" value="${readMap.tingchechangxinxiid}" />
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车场编号</label>
                            <div class="col-sm-10">
                                ${readMap.tingchechangbianhao}<input
                                    type="hidden"
                                    id="tingchechangbianhao"
                                    name="tingchechangbianhao"
                                    value="${Info.html(readMap.tingchechangbianhao)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车场名称</label>
                            <div class="col-sm-10">
                                ${readMap.tingchechangmingcheng}<input
                                    type="hidden"
                                    id="tingchechangmingcheng"
                                    name="tingchechangmingcheng"
                                    value="${Info.html(readMap.tingchechangmingcheng)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">位置</label>
                            <div class="col-sm-10">
                                <ssm:sql var="maptingcheweixinxi11" type="find">SELECT tingchechangmingcheng,id FROM tingcheweixinxi where id='${readMap.weizhi}'</ssm:sql
                                >${maptingcheweixinxi11.tingchechangmingcheng}<input type="hidden" id="weizhi" name="weizhi" value="${Info.html(readMap.weizhi)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车时间</label>
                            <div class="col-sm-10">
                                ${readMap.tingcheshijian}<input type="hidden" id="tingcheshijian" name="tingcheshijian" value="${Info.html(readMap.tingcheshijian)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">卡号</label>
                            <div class="col-sm-10">${readMap.kahao}<input type="hidden" id="kahao" name="kahao" value="${Info.html(readMap.kahao)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">编号</label>
                            <div class="col-sm-10">${readMap.bianhao}<input type="hidden" id="bianhao" name="bianhao" value="${Info.html(readMap.bianhao)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">持卡人</label>
                            <div class="col-sm-10">${readMap.chikaren}<input type="hidden" id="chikaren" name="chikaren" value="${Info.html(readMap.chikaren)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">联系电话</label>
                            <div class="col-sm-10">
                                ${readMap.lianxidianhua}<input type="hidden" id="lianxidianhua" name="lianxidianhua" value="${Info.html(readMap.lianxidianhua)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">类型</label>
                            <div class="col-sm-10">${readMap.leixing}<input type="hidden" id="leixing" name="leixing" value="${Info.html(readMap.leixing)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">收费金额</label>
                            <div class="col-sm-10">${readMap.shoufeijine}<input type="hidden" id="shoufeijine" name="shoufeijine" value="${Info.html(readMap.shoufeijine)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">车辆类型</label>
                            <div class="col-sm-10">
                                ${readMap.cheliangleixing}<input type="hidden" id="cheliangleixing" name="cheliangleixing" value="${Info.html(readMap.cheliangleixing)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">车位</label>
                            <div class="col-sm-10">${readMap.chewei}<input type="hidden" id="chewei" name="chewei" value="${Info.html(readMap.chewei)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车人</label>
                            <div class="col-sm-10">${readMap.tingcheren}<input type="hidden" id="tingcheren" name="tingcheren" value="${Info.html(readMap.tingcheren)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">出场时间</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                                    style="width: 200px"
                                    id="chuchangshijian"
                                    name="chuchangshijian"
                                    readonly="readonly"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="referer" id="referers" class="referers" value="<%=request.getHeader("referer") %>" type="hidden" />
                                <script>
                                    $(function () {
                                        $("input.referers").val(document.referrer);
                                    });
                                </script>

                                <input type="hidden" name="iszf" value="否" />

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

