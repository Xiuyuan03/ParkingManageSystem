<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/jquery.validate.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">


        <div class="panel panel-default">
            <div class="panel-heading">edit outOfParking:</div>
            <div class="panel-body">
                <form action="outOfParking.do?ac=update" method="post" name="form1" id="form1">


                    <input type="hidden" name="parking_id" value="${mmm.parking_id}" /> <input type="hidden" name="parking_lot_information_id" value="${mmm.parking_lot_information_id}" />
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
                                <ssm:sql var="mapparking_information12" type="find">SELECT parking_lot_name,id FROM parking_information where id='${mmm.location}'</ssm:sql
                                >${mapparking_information12.parking_lot_name}<input type="hidden" id="location" name="location" value="${Info.html(mmm.location)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">park time</label>
                            <div class="col-sm-10">
                                ${mmm.park_time}<input type="hidden" id="park_time" name="park_time" value="${Info.html(mmm.park_time)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">card number</label>
                            <div class="col-sm-10">${mmm.card_number}<input type="hidden" id="card_number" name="card_number" value="${Info.html(mmm.card_number)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">serial number</label>
                            <div class="col-sm-10">${mmm.serial_number}<input type="hidden" id="serial_number" name="serial_number" value="${Info.html(mmm.serial_number)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">card holder</label>
                            <div class="col-sm-10">${mmm.cardholder}<input type="hidden" id="cardholder" name="cardholder" value="${Info.html(mmm.cardholder)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">phone</label>
                            <div class="col-sm-10">${mmm.phone}<input type="hidden" id="phone" name="phone" value="${Info.html(mmm.phone)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">type</label>
                            <div class="col-sm-10">${mmm.type}<input type="hidden" id="type" name="type" value="${Info.html(mmm.type)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">charge amount</label>
                            <div class="col-sm-10">${mmm.charge_amount}<input type="hidden" id="charge_amount" name="charge_amount" value="${Info.html(mmm.charge_amount)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">vehicle type</label>
                            <div class="col-sm-10">
                                ${mmm.vehicle_type}<input type="hidden" id="vehicle_type" name="vehicle_type" value="${Info.html(mmm.vehicle_type)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">parking space</label>
                            <div class="col-sm-10">${mmm.parking_space}<input type="hidden" id="parking_space" name="parking_space" value="${Info.html(mmm.parking_space)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">parking person</label>
                            <div class="col-sm-10">${mmm.parking_person}<input type="hidden" id="parking_person" name="parking_person" value="${Info.html(mmm.parking_person)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">exit time</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                                    style="width: 200px"
                                    id="exit_time"
                                    name="exit_time"
                                    readonly="readonly"
                                    value="${Info.html(mmm.exit_time)}"
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

