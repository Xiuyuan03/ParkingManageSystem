<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@ page import="com.gin.entity.Tingchechangxinxi" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
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
<script src="js/datepicker/WdatePicker.js"></script>
<script src="js/jquery.seat-charts.min.js"></script>
<style type="text/css">
    .demo {
        width: 100%;
        margin: 40px auto 0 auto;
        min-height: 450px;
    }

    @media screen and (max-width: 360px) {
        .demo {
            width: 340px
        }
    }

    .front {
        width: 190px;
        margin: 5px 32px 45px 80px;
        background-color: #f0f0f0;
        color: #666;
        text-align: center;
        padding: 3px;
        border-radius: 5px;
    }

    .booking-details {
        float: right;
        position: relative;
        width: 350px;
        height: 450px;
    }

    .booking-details h3 {
        margin: 5px 5px 0 0;
        font-size: 16px;
    }

    .booking-details p {
        line-height: 26px;
        font-size: 16px;
        color: #999
    }

    .booking-details p span {
        color: #666
    }

    div.seatCharts-cell {

        color: #182C4E;
        height: 25px;
        width: 25px;
        line-height: 25px;
        margin: 3px;
        float: left;
        text-align: center;
        outline: none;
        font-size: 13px;
    }

    div.seatCharts-seat {
        color: #fff;
        cursor: pointer;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
    }

    div.seatCharts-row {
        height: 35px;
    }

    div.seatCharts-seat.available {
        background-color: #a7de52;
    }

    div.seatCharts-seat.available.economy-class {
        background-color: #daa134
    }

    div.seatCharts-seat.focused {
        background-color: #76B474;
        border: none;
    }

    div.seatCharts-seat.selected {
        background-color: #19ae12;
    }

    div.seatCharts-seat.unavailable {
        background-color: #ae2422;
        cursor: not-allowed;
    }


    div.seatCharts-container {
        border-right: 1px dotted #adadad;
        width: 700px;
        padding: 20px;
        float: left;
    }


    div.seatCharts-legend {
        padding-left: 0px;
        position: absolute;
        bottom: 16px;
    }

    ul.seatCharts-legendList {
        padding-left: 0px;
    }

    .seatCharts-legendItem {
        float: left;
        width: 90px;
        margin-top: 10px;
        line-height: 2;
    }

    span.seatCharts-legendDescription {
        margin-left: 5px;
        line-height: 30px;
    }

    .checkout-button {
        display: block;
        width: 80px;
        height: 24px;
        line-height: 20px;
        margin: 10px auto;
        border: 1px solid #999;
        font-size: 14px;
        cursor: pointer
    }

    #selected-seats {
        max-height: 150px;
        overflow-y: auto;
        overflow-x: none;
        width: 100%;
    }


    #selected-seats li {
        width: 140px;
        float: left;
        height: 26px;
        line-height: 26px;
        border: 1px solid #d3d3d3;
        background: #f7f7f7;
        margin: 6px;
        font-size: 14px;
        font-weight: bold;
        text-align: center
    }
</style>
<div style="padding: 10px" class="admin-content">
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">添加停车:</div>
            <div class="panel-body">
                <form action="tingche.do?ac=insert" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <input type="hidden" name="tingchechangxinxiid" value="${param.id}"/>
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
                                    input type="hidden" id="weizhi"
                                    name="yushi"
                                    value="${Info.html(readMap.weizhi)}"/>
                            />
                            </div>
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <div id="seat-map">
                            <div class="front">位置</div>
                        </div>
                        <div class="booking-details">

                            <ul id="selected-seats">
                            </ul>

                            <div id="legend"></div>
                        </div>
                    </div>
                    <%

                        Tingchechangxinxi readMap = (Tingchechangxinxi) request.getAttribute("readMap");
                        Map bofangting = Query.make("tingcheweixinxi").where("id", readMap.getWeizhi()).find();
                    %>

                    <script>
                        $(document).ready(function () {
                            var $cart = $('#selected-seats'), //车位区
                                $counter = $('#counter'), //选中车位数
                                $number = $('#goupiaozhangshu'),
                                $total = $('#total'); //停车费(小时)
                            var row =<%=bofangting.get("jipai") %>;
                            var col =<%=bofangting.get("jilie") %>;
                            var map = [];
                            for (var i = 0; i < row; i++) {
                                var str = "";
                                for (var j = 0; j < col; j++) {
                                    str += "a";
                                }
                                map.push(str);
                            }
                            console.log(map.length);
                            console.log(map);
                            var sc = $('#seat-map').seatCharts({
                                map:map,
                                naming: {
                                    top: false,
                                    getLabel: function (character, row, column) {
                                        return column;
                                    }
                                },
                                legend: { //定义图例
                                    node: $('#legend'),
                                    items: [
                                        ['a', 'available', '空闲'],
                                        ['a', 'selected', '我的选择'],
                                        ['a', 'unavailable', '已停'],
                                    ]
                                },
                                click: function () { //点击事件
                                    if (this.status() == 'available') { //可选车位
                                        sc.find('selected').status('available');
                                        $('#chewei').val((this.settings.row + 1) + '_' + this.settings.label);
                                        return 'selected';
                                    } else if (this.status() == 'selected') { //已选中车位
                                        $counter.text(sc.find('selected').length - 1);
                                        $number.val(sc.find('selected').length - 1);
                                        //and total
                                        $total.text(recalculateTotal(sc) - this.data().price);

                                        //remove the item from our cart
                                        $('#cart-item-' + this.settings.id).remove();

                                        //seat has been vacated
                                        return 'available';

                                    } else if (this.status() == 'unavailable') { //已停车位
                                        return 'unavailable';
                                    } else {
                                        return this.style();
                                    }
                                }
                            });
                            $('#selected-seats').on('click', '.cancel-cart-item', function () {
                                //let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
                                sc.get($(this).parents('li:first').data('seatId')).click();
                            });
                            //已售出的座位
                            <% List<String> lis = Query.make("tingche")
                            .where("tingchechangxinxiid" ,readMap.getId())
//                            .where("yuyuezhuangtai","in","预约中")
                            .getCol("chewei");
                            String[] xxs = StringUtil.join("," , lis).split(",");
                            %>
                            <% if(lis.size()>0){ %>
                            sc.get(<%=JSON.toJSONString(xxs)%>).status('unavailable');
                            <% } %>

                            function recalculateTotal(sc) {
                                var total = 0;
                                //basically find every selected seat and sum its price
                                sc.find('selected').each(function () {
                                    total += this.data().price;
                                });
                                return total;
                            }

                            //window.sc = sc;
                            //updateKaichangshijian();
                        });
                    </script>

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">停车时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"
                                       onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                                       style="width:200px;" readonly="readonly"
                                       id="tingcheshijian" name="tingcheshijian"
                                       value="${Info.date("yyyy-MM-dd HH:mm:ss")}"/>
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
                                            id="icka"
                                            name="icka"
                                            onchange="getAjaxData('ickaxinxi',this,this.value)"
                                    >
                                        <option value="">请选择IC卡</option>
                                    </select>
                                    关键词：<input type="text" class="form-control" id="icka_keyword" value=""/>
                                    <button type="button" class="btn btn-default" onclick="icka_select_update()">搜索
                                    </button>
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
                                <input type="text" class="form-control select-update" placeholder="输入卡号"
                                       style="width: 250px" id="kahao" name="kahao" value=""/>
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
                                            id="xuanzeleixing"
                                            name="xuanzeleixing"
                                            onchange="getAjaxData('shoufeibiaozhun',this,this.value)"
                                    >
                                        <option value="">请选择选择类型</option>
                                    </select>
                                    关键词：<input type="text" class="form-control" id="xuanzeleixing_keyword" value=""/>
                                    <select class="form-control class_leixing_search11" data-value=""
                                            id="leixing_search" name="leixing_search">
                                        <option value="">请选择</option>
                                        <option value="年卡">年卡</option>
                                        <option value="月卡">月卡</option>
                                        <option value="临时">临时</option>
                                    </select>
                                    <button type="button" class="btn btn-default"
                                            onclick="xuanzeleixing_select_update()">搜索
                                    </button>
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
                                <input type="text" class="form-control select-update" placeholder="输入编号"
                                       style="width: 150px" id="bianhao" name="bianhao" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">持卡人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control select-update" placeholder="输入持卡人"
                                       style="width: 150px" id="chikaren" name="chikaren" value=""/>
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
                                        value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">类型</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="" id="leixing" name="leixing"
                                        style="width: 250px">
                                    <option value="年卡">年卡</option>
                                    <option value="月卡">月卡</option>
                                    <option value="临时">临时</option>
                                </select>
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
                                        value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">车辆类型</label>
                            <div class="col-sm-10">
                                <select class="form-control class_cheliangleixing13" data-value="" id="cheliangleixing"
                                        name="cheliangleixing" style="width: 250px">
                                    <option value="小车">小车</option>
                                    <option value="大车">大车</option>
                                    <option value="货车">货车</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">车位</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="输入车位" style="width: 150px"
                                       id="chewei" name="chewei" value=""/>
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
                                        value="${sessionScope.username}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="referer" id="referers" class="referers"
                                       value="<%=request.getHeader("referer") %>" type="hidden"/>
                                <script>
                                    $(function () {
                                        $("input.referers").val(document.referrer);
                                    });
                                </script>

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

