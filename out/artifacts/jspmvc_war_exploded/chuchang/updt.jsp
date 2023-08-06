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
            <div class="panel-heading">编辑出场:</div>
            <div class="panel-body">
                <form action="chuchang.do?ac=update" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <input type="hidden" name="tingcheid" value="${mmm.tingcheid}" /> <input type="hidden" name="tingchechangxinxiid" value="${mmm.tingchechangxinxiid}" />
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车场编号</label>
                            <div class="col-sm-10">
                                ${mmm.tingchechangbianhao}<input type="hidden" id="tingchechangbianhao" name="tingchechangbianhao" value="${Info.html(mmm.tingchechangbianhao)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车场名称</label>
                            <div class="col-sm-10">
                                ${mmm.tingchechangmingcheng}<input
                                    type="hidden"
                                    id="tingchechangmingcheng"
                                    name="tingchechangmingcheng"
                                    value="${Info.html(mmm.tingchechangmingcheng)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">位置</label>
                            <div class="col-sm-10">
                                <ssm:sql var="maptingcheweixinxi12" type="find">SELECT tingchechangmingcheng,id FROM tingcheweixinxi where id='${mmm.weizhi}'</ssm:sql
                                >${maptingcheweixinxi12.tingchechangmingcheng}<input type="hidden" id="weizhi" name="weizhi" value="${Info.html(mmm.weizhi)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车时间</label>
                            <div class="col-sm-10">
                                ${mmm.tingcheshijian}<input type="hidden" id="tingcheshijian" name="tingcheshijian" value="${Info.html(mmm.tingcheshijian)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">卡号</label>
                            <div class="col-sm-10">${mmm.kahao}<input type="hidden" id="kahao" name="kahao" value="${Info.html(mmm.kahao)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">编号</label>
                            <div class="col-sm-10">${mmm.bianhao}<input type="hidden" id="bianhao" name="bianhao" value="${Info.html(mmm.bianhao)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">持卡人</label>
                            <div class="col-sm-10">${mmm.chikaren}<input type="hidden" id="chikaren" name="chikaren" value="${Info.html(mmm.chikaren)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">联系电话</label>
                            <div class="col-sm-10">${mmm.lianxidianhua}<input type="hidden" id="lianxidianhua" name="lianxidianhua" value="${Info.html(mmm.lianxidianhua)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">类型</label>
                            <div class="col-sm-10">${mmm.leixing}<input type="hidden" id="leixing" name="leixing" value="${Info.html(mmm.leixing)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">收费金额</label>
                            <div class="col-sm-10">${mmm.shoufeijine}<input type="hidden" id="shoufeijine" name="shoufeijine" value="${Info.html(mmm.shoufeijine)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">车辆类型</label>
                            <div class="col-sm-10">
                                ${mmm.cheliangleixing}<input type="hidden" id="cheliangleixing" name="cheliangleixing" value="${Info.html(mmm.cheliangleixing)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">车位</label>
                            <div class="col-sm-10">${mmm.chewei}<input type="hidden" id="chewei" name="chewei" value="${Info.html(mmm.chewei)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车人</label>
                            <div class="col-sm-10">${mmm.tingcheren}<input type="hidden" id="tingcheren" name="tingcheren" value="${Info.html(mmm.tingcheren)}" /></div>
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
                                    value="${Info.html(mmm.chuchangshijian)}"
                                />
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

