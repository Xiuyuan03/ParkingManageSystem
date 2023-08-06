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


        <div class="panel panel-default">
            <div class="panel-heading">edit parking:</div>
            <div class="panel-body">
                <form action="parking.do?ac=update" method="post" name="form1" id="form1">


                    <input type="hidden" name="parking_lot_information_id" value="${mmm.parking_lot_information_id}" />
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">parking serial number</label>
                            <div class="col-sm-10">
                                ${mmm.parking_lot_number}<input type="hidden" id="parking_lot_number" name="parking_lot_number" value="${Info.html(mmm.parking_lot_number)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">Name of parking lot</label>
                            <div class="col-sm-10">
                                ${mmm.parking_lot_name}<input
                                    type="hidden"
                                    id="parking_lot_name"
                                    name="parking_lot_name"
                                    value="${Info.html(mmm.parking_lot_name)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">location</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapparking_information7" type="find">SELECT parking_lot_name,id FROM parking_information where id='${mmm.location}'</ssm:sql
                                >${mapparking_information7.parking_lot_name}<input type="hidden" id="location" name="location" value="${Info.html(mmm.location)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">park time</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                                    style="width: 200px"
                                    readonly="readonly"
                                    id="park_time"
                                    name="park_time"
                                    value="${Info.html(mmm.park_time)}"
                                />
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
                                        data-value="${Info.html(mmm.ic_card_id)}"
                                        id="ic_card_id"
                                        name="ic_card_id"
                                        onchange="getAjaxData('ic_card_info',this,this.value)"
                                    >
                                        <option value="">please choose IC card</option>
                                    </select>
                                    keyword:<input type="text" class="form-control" id="ic_card_id_keyword" value="" />
                                    <button type="button" class="btn btn-default" onclick="ic_card_id_select_update()">search</button>
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
                                <input
                                    type="text"
                                    class="form-control select-update"
                                    placeholder="entercard number"
                                    style="width: 250px"
                                    id="card_number"
                                    name="card_number"
                                    value="${Info.html(mmm.card_number)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">choose type</label>
                            <div class="col-sm-10">
                                <div class="form-inline">
                                    <select
                                        class="form-control"
                                        data-fields="type,charge_amount"
                                        data-value="${Info.html(mmm.choose_type)}"
                                        id="choose_type"
                                        name="choose_type"
                                        onchange="getAjaxData('charging_standard',this,this.value)"
                                    >
                                        <option value="">please choose type</option>
                                    </select>
                                    keyword:<input type="text" class="form-control" id="choose_type_keyword" value="" />
                                    <select class="form-control class_type_search14" data-value="" id="type_search" name="type_search">
                                        <option value="">please choose</option>
                                        <option value="Annual card">Annual card</option>
                                        <option value="monthly card">monthly card</option>
                                        <option value="temporary">temporary</option>
                                    </select>
                                    <button type="button" class="btn btn-default" onclick="choose_type_select_update()">search</button>
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
                                <input
                                    type="text"
                                    class="form-control select-update"
                                    placeholder="enterserial number"
                                    style="width: 150px"
                                    id="serial_number"
                                    name="serial_number"
                                    value="${Info.html(mmm.serial_number)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">card holder</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control select-update"
                                    placeholder="entercard holder"
                                    style="width: 150px"
                                    id="cardholder"
                                    name="cardholder"
                                    value="${Info.html(mmm.cardholder)}"
                                />
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
                                    value="${Info.html(mmm.phone)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">type</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="${Info.html(mmm.type)}" id="type" name="type" style="width: 250px">
                                    <option value="Annual card">Annual card</option>
                                    <option value="monthly card">monthly card</option>
                                    <option value="temporary">temporary</option>
                                </select>
                                <script>
                                    $(".class_type15 select-update").val($(".class_type15 select-update").attr("data-value"));
                                </script>
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
                                    value="${Info.html(mmm.charge_amount)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">vehicle type</label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_vehicle_type16"
                                    data-value="${Info.html(mmm.vehicle_type)}"
                                    id="vehicle_type"
                                    name="vehicle_type"
                                    style="width: 250px"
                                >
                                    <option value="car">car</option>
                                    <option value="cart">cart</option>
                                    <option value="van">van</option>
                                </select>
                                <script>
                                    $(".class_vehicle_type16").val($(".class_vehicle_type16").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">parking space</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="enter parking space" style="width: 150px" id="parking_space" name="parking_space" value="${Info.html(mmm.parking_space)}" />
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
                                    value="${mmm.parking_person}"
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

