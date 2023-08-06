<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/jquery.validate.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>
<script>
    window.searchSelectUrl = "common.do?ac=selectUpdateSearch";
    window.selectUpdateUrl = "common.do?ac=tableAjax";
</script>
<script src="js/selectUpdate.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑停车:</div>
            <div class="panel-body">
                <form action="tingche.do?ac=update" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <input type="hidden" name="tingchechangxinxiid" value="${mmm.tingchechangxinxiid}" />
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
                                <ssm:sql var="maptingcheweixinxi7" type="find">SELECT tingchechangmingcheng,id FROM tingcheweixinxi where id='${mmm.weizhi}'</ssm:sql
                                >${maptingcheweixinxi7.tingchechangmingcheng}<input type="hidden" id="weizhi" name="weizhi" value="${Info.html(mmm.weizhi)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车时间</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                                    style="width: 200px"
                                    readonly="readonly"
                                    id="tingcheshijian"
                                    name="tingcheshijian"
                                    value="${Info.html(mmm.tingcheshijian)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">IC卡</label>
                            <div class="col-sm-10">
                                <div class="form-inline">
                                    <select
                                        class="form-control"
                                        data-fields="bianhao,kahao,chikaren,lianxidianhua"
                                        data-value="${Info.html(mmm.icka)}"
                                        id="icka"
                                        name="icka"
                                        onchange="getAjaxData('ickaxinxi',this,this.value)"
                                    >
                                        <option value="">请选择IC卡</option>
                                    </select>
                                    关键词：<input type="text" class="form-control" id="icka_keyword" value="" />
                                    <button type="button" class="btn btn-default" onclick="icka_select_update()">搜索</button>
                                    <script>
                                        function icka_select_update() {
                                            var keyword = $("#icka_keyword").val();
                                            var where = {};
                                            where.caozuoren=${sessionScope.username}
                                            searchSelect("icka", "ickaxinxi", keyword, where, "bianhao,kahao,chikaren,lianxidianhua".split(","), "".split(","));
                                        }
                                        icka_select_update();
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">卡号</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control select-update"
                                    placeholder="输入卡号"
                                    style="width: 250px"
                                    id="kahao"
                                    name="kahao"
                                    value="${Info.html(mmm.kahao)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">选择类型</label>
                            <div class="col-sm-10">
                                <div class="form-inline">
                                    <select
                                        class="form-control"
                                        data-fields="leixing,shoufeijine"
                                        data-value="${Info.html(mmm.xuanzeleixing)}"
                                        id="xuanzeleixing"
                                        name="xuanzeleixing"
                                        onchange="getAjaxData('shoufeibiaozhun',this,this.value)"
                                    >
                                        <option value="">请选择选择类型</option>
                                    </select>
                                    关键词：<input type="text" class="form-control" id="xuanzeleixing_keyword" value="" />
                                    <select class="form-control class_leixing_search14" data-value="" id="leixing_search" name="leixing_search">
                                        <option value="">请选择</option>
                                        <option value="年卡">年卡</option>
                                        <option value="月卡">月卡</option>
                                        <option value="临时">临时</option>
                                    </select>
                                    <button type="button" class="btn btn-default" onclick="xuanzeleixing_select_update()">搜索</button>
                                    <script>
                                        function xuanzeleixing_select_update() {
                                            var keyword = $("#xuanzeleixing_keyword").val();
                                            var where = {};
                                            if ($("#leixing_search").val() != "") where.leixing = $("#leixing_search").val();
                                            searchSelect("xuanzeleixing", "shoufeibiaozhun", keyword, where, "leixing,shoufeijine".split(","), "".split(","));
                                        }
                                        xuanzeleixing_select_update();
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">编号</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control select-update"
                                    placeholder="输入编号"
                                    style="width: 150px"
                                    id="bianhao"
                                    name="bianhao"
                                    value="${Info.html(mmm.bianhao)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">持卡人</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control select-update"
                                    placeholder="输入持卡人"
                                    style="width: 150px"
                                    id="chikaren"
                                    name="chikaren"
                                    value="${Info.html(mmm.chikaren)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">联系电话</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control select-update"
                                    placeholder="输入联系电话"
                                    style="width: 150px"
                                    id="lianxidianhua"
                                    name="lianxidianhua"
                                    value="${Info.html(mmm.lianxidianhua)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">类型</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="${Info.html(mmm.leixing)}" id="leixing" name="leixing" style="width: 250px">
                                    <option value="年卡">年卡</option>
                                    <option value="月卡">月卡</option>
                                    <option value="临时">临时</option>
                                </select>
                                <script>
                                    $(".class_leixing15 select-update").val($(".class_leixing15 select-update").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">收费金额</label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control select-update"
                                    placeholder="输入收费金额"
                                    style="width: 150px"
                                    step="0.01"
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="shoufeijine"
                                    name="shoufeijine"
                                    value="${Info.html(mmm.shoufeijine)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">车辆类型</label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_cheliangleixing16"
                                    data-value="${Info.html(mmm.cheliangleixing)}"
                                    id="cheliangleixing"
                                    name="cheliangleixing"
                                    style="width: 250px"
                                >
                                    <option value="小车">小车</option>
                                    <option value="大车">大车</option>
                                    <option value="货车">货车</option>
                                </select>
                                <script>
                                    $(".class_cheliangleixing16").val($(".class_cheliangleixing16").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">车位</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="输入车位" style="width: 150px" id="chewei" name="chewei" value="${Info.html(mmm.chewei)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车人</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入停车人"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="tingcheren"
                                    name="tingcheren"
                                    value="${mmm.tingcheren}"
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

