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


        <div class="panel panel-default">
            <div class="panel-heading">Add parking:</div>
            <div class="panel-body">
                <form action="parking.do?ac=insert" method="post" name="form1" id="form1">


                    <input type="hidden" name="parking_lot_information_id" value="${param.id}"/>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">parking serial number</label>
                            <div class="col-sm-10">
                                ${readMap.parking_lot_number}<input
                                    type="hidden"
                                    id="parking_lot_number"
                                    name="parking_lot_number"
                                    value="${Info.html(readMap.parking_lot_number)}"
                            />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">Name of parking lot</label>
                            <div class="col-sm-10">
                                ${readMap.parking_lot_name}<input
                                    type="hidden"
                                    id="parking_lot_name"
                                    name="parking_lot_name"
                                    value="${Info.html(readMap.parking_lot_name)}"
                                    input type="hidden" id="location"
                                    name="yushi"
                                    value="${Info.html(readMap.location)}"/>
                            />
                            </div>
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <div id="seat-map">
                            <div class="front">location</div>
                        </div>
                        <div class="booking-details">

                            <ul id="selected-seats">
                            </ul>

                            <div id="legend"></div>
                        </div>
                    </div>
                    <%

                        ParkingLotInformation readMap = (ParkingLotInformation) request.getAttribute("readMap");
                        Map bofangting = Query.make("parking_information").where("id", readMap.getLocation()).find();
                    %>

                    <script>
                        $(document).ready(function () {
                            var $cart = $('#selected-seats'), //parking space
                                $counter = $('#counter'), //choose parking space number
                                $number = $('#goupiaozhangshu'),
                                $total = $('#total'); //停车费(小时)
                            var row =<%=bofangting.get("row") %>;
                            var col =<%=bofangting.get("columns") %>;
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
                                        ['a', 'available', 'available'],
                                        ['a', 'selected', 'my choose'],
                                        ['a', 'unavailable', 'stopped'],
                                    ]
                                },
                                click: function () { //
                                    if (this.status() == 'available') { //parking space
                                        sc.find('selected').status('available');
                                        $('#parking_space').val((this.settings.row + 1) + '_' + this.settings.label);
                                        return 'selected';
                                    } else if (this.status() == 'selected') { //parking space
                                        $counter.text(sc.find('selected').length - 1);
                                        $number.val(sc.find('selected').length - 1);
                                        //and total
                                        $total.text(recalculateTotal(sc) - this.data().price);

                                        //remove the item from our cart
                                        $('#cart-item-' + this.settings.id).remove();

                                        //seat has been vacated
                                        return 'available';

                                    } else if (this.status() == 'unavailable') { //parking space
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

                            <% List<String> lis = Query.make("parking")
                            .where("parking_lot_information_id" ,readMap.getId())
//                            .where("ordered","in","ordered")
                            .getCol("parking_space");
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
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">park time</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"
                                       onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                                       style="width:200px;" readonly="readonly"
                                       id="park_time" name="park_time"
                                       value="${Info.date("yyyy-MM-dd HH:mm:ss")}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">IC card</label>
                            <div class="col-sm-10">
                                <div class="form-inline">
                                    <select
                                            class="form-control"
                                            data-fields="serial_number,card_number,cardholder,phone"
                                            id="ic_card_id"
                                            name="ic_card_id"
                                            onchange="getAjaxData('ic_card_info',this,this.value)"
                                    >
                                        <option value="">please chooseIC </option>
                                    </select>
                                    keyword:<input type="text" class="form-control" id="ic_card_id_keyword" value=""/>
                                    <button type="button" class="btn btn-default" onclick="ic_card_id_select_update()">search
                                    </button>
                                    <script>
                                        function ic_card_id_select_update() {
                                            var keyword = $("#ic_card_id_keyword").val();
                                            var where = {};
                                            where.operator=${sessionScope.username}
                                            searchSelect("ic_card_id", "ic_card_info", keyword, where, "serial_number,card_number,cardholder,phone".split(","), "".split(","));
                                        }

                                        ic_card_id_select_update();
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">card number</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control select-update" placeholder="enter card number"
                                       style="width: 250px" id="card_number" name="card_number" value=""/>
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
                                            data-fields="type,charge_amount"
                                            id="choose_type"
                                            name="choose_type"
                                            onchange="getAjaxData('charging_standard',this,this.value)"
                                    >
                                        <option value="">please choose type</option>
                                    </select>
                                    keyword:<input type="text" class="form-control" id="choose_type_keyword" value=""/>
                                    <select class="form-control class_type_search11" data-value=""
                                            id="type_search" name="type_search">
                                        <option value="">please choose</option>
                                        <option value="Annual card">Annual card</option>
                                        <option value="monthly card">monthly card</option>
                                        <option value="temporary">temporary</option>
                                    </select>
                                    <button type="button" class="btn btn-default"
                                            onclick="choose_type_select_update()">search
                                    </button>
                                    <script>
                                        function choose_type_select_update() {
                                            var keyword = $("#choose_type_keyword").val();
                                            var where = {};
                                            if ($("#type_search").val() != "") where.type = $("#type_search").val();
                                            searchSelect("choose_type", "charging_standard", keyword, where, "type,charge_amount".split(","), "".split(","));
                                        }

                                        choose_type_select_update();
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">serial number</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control select-update" placeholder="enter serial number"
                                       style="width: 150px" id="serial_number" name="serial_number" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">card holder</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control select-update" placeholder="enter card holder"
                                       style="width: 150px" id="cardholder" name="cardholder" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">phone</label>
                            <div class="col-sm-10">
                                <input
                                        type="text"
                                        class="form-control select-update"
                                        placeholder="enter phone"
                                        style="width: 150px"
                                        id="phone"
                                        name="phone"
                                        value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">type</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="" id="type" name="type"
                                        style="width: 250px">
                                    <option value="Annual card">Annual card</option>
                                    <option value="monthly card">monthly card</option>
                                    <option value="temporary">temporary</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">charge amount</label>
                            <div class="col-sm-10">
                                <input
                                        type="number"
                                        class="form-control select-update"
                                        placeholder="entercharge amount"
                                        style="width: 150px"
                                        step="0.01"
                                        number="true"
                                        data-msg-number="enter  a valid number"
                                        id="charge_amount"
                                        name="charge_amount"
                                        value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">vehicle type</label>
                            <div class="col-sm-10">
                                <select class="form-control class_vehicle_type13" data-value="" id="vehicle_type"
                                        name="vehicle_type" style="width: 250px">
                                    <option value="car">cae</option>
                                    <option value="cart">cart</option>
                                    <option value="van">van</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">parking space</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="enter parking space" style="width: 150px"
                                       id="parking_space" name="parking_space" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">parking person</label>
                            <div class="col-sm-10">
                                <input
                                        type="text"
                                        class="form-control"
                                        placeholder="enter parking person"
                                        style="width: 150px"
                                        readonly="readonly"
                                        id="parking_person"
                                        name="parking_person"
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

                                <button type="submit" class="btn btn-primary" name="Submit">submit</button>
                                <button type="reset" class="btn btn-default" name="Submit2">reset</button>
                            </div>
                        </div>
                    </div>


                </form>
            </div>
        </div>


    </div>

    <script>
        $(function () {
            $("#form1").validate();
        });
    </script>
</div>
<%@ include file="/foot.jsp" %>

