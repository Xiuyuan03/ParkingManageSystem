<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> outOfParking </span>
            <span>list</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?">


                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div>
                    <input type="hidden" name="ac" value="${param.ac}" />
                    <div class="form-group">
                        parking serial number

                        <input type="text" class="form-control" style="" name="parking_lot_number" value="${param.parking_lot_number}" />
                    </div>
                    <div class="form-group">
                        Name of parking lot

                        <input type="text" class="form-control" style="" name="parking_lot_name" value="${param.parking_lot_name}" />
                    </div>
                    <div class="form-group">
                        park time

                        <input
                            type="text"
                            class="form-control"
                            name="park_time_start"
                            readonly="readonly"
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                        />-<input
                            type="text"
                            class="form-control"
                            name="park_time_end"
                            readonly="readonly"
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                        />
                    </div>
                    <div class="form-group">
                        类型

                        <select class="form-control select-update" data-value="${param.type}" id="type" name="type">
                            <option value="">please choose</option>
                            <option value="Annual card">Annual card</option>
                            <option value="monthly card">monthly card</option>
                            <option value="temporary">temporary</option>
                        </select>
                        <script>
                            $(".class_type17 select-update").val($(".class_type17 select-update").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group">
                        charge amount

                        <input type="text" class="form-control" style="width: 80px" name="charge_amount_start" value="${param.charge_amount_start}" />-<input
                            type="text"
                            class="form-control"
                            style="width: 80px"
                            name="charge_amount_end"
                            value="${param.charge_amount_end}"
                        />
                    </div>
                    <div class="form-group">
                        exit time

                        <input
                            type="text"
                            class="form-control"
                            name="exit_time_start"
                            readonly="readonly"
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                        />-<input
                            type="text"
                            class="form-control"
                            name="exit_time_end"
                            readonly="readonly"
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                        />
                    </div>
                    <div class="form-group">
                        duration

                        <input type="text" class="form-control" style="width: 80px" name="duration_start" value="${param.duration_start}" />-
                        <input type="text" class="form-control" style="width: 80px" name="duration_end" value="${param.duration_end}" />
                    </div>
                    <select class="form-control" name="order" id="orderby">
                        <option value="id">by release time</option>
                        <option value="charge_amount">by charge amount</option>
                        <option value="amount">by amount</option>
                    </select>
                    <select class="form-control" name="sort" id="sort">
                        <option value="desc">reverse order</option>
                        <option value="asc">ascending order</option>
                    </select>
                    <script>
                        $("#orderby").val("${orderby}");
                        $("#sort").val("${sort}");
                    </script>
                    <button type="submit" class="btn btn-default">search</button>


                </form>
            </div>

            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th width="60" data-field="item">id</th>
                            <th>parking serial number</th>
                            <th>Name of parking lot</th>
                            <th>location</th>
                            <th>park time</th>
                            <th>card number</th>
                            <th>serial number</th>
                            <th>card holder</th>
                            <th>phone</th>
                            <th>type</th>
                            <th>charge amount</th>
                            <th>vehicle type</th>
                            <th>parking space</th>
                            <th>parking person</th>
                            <th>exit time</th>
                            <th>duration</th>
                            <th>amount</th>
                            <th width="80" data-field="is_paid">is paid</th>
                            <th width="220" data-field="handler">operate</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="i" value="0" /><c:forEach items="${list}" var="map"
                            ><c:set var="i" value="${i+1}" />
                            <tr id="${map.id}" pid="">
                                <td width="30" align="center">
                                    <label> ${i} </label>
                                </td>
                                <td>${map.parking_lot_number}</td>
                                <td>${map.parking_lot_name}</td>
                                <td>
                                    <ssm:sql var="mapparking_information8" type="find">SELECT parking_lot_name,id FROM parking_information where id='${map.location}'</ssm:sql
                                    >${mapparking_information8.parking_lot_name}
                                </td>
                                <td>${map.park_time}</td>
                                <td>${map.card_number}</td>
                                <td>${map.serial_number}</td>
                                <td>${map.cardholder}</td>
                                <td>${map.phone}</td>
                                <td>${map.type}</td>
                                <td>${map.charge_amount}</td>
                                <td>${map.vehicle_type}</td>
                                <td>${map.parking_space}</td>
                                <td>${map.parking_person}</td>
                                <td>${map.exit_time}</td>
                                <td>${map.duration}</td>
                                <td>${map.amount}</td>
                                <td>
                                    ${map.is_paid}
                                    <c:choose>
                                        <c:when test="${'no' == map.is_paid }">
                                            <a href="javascript:window.open('zhifu/index.jsp?id=${map.id}&biao=outOfParking&ordersn=${map.parking_lot_number}&zongji=${map.amount}')">
                                                to pay
                                            </a>
                                        </c:when></c:choose
                                    >
                                </td>
                                <td align="center">
                                    <a href="outOfParking.do?ac=detail&id=${map.id}">detail</a>

                                    <a href="outOfParking.do?ac=updt&id=${map.id}">edit</a>

                                    <a href="outOfParking.do?ac=delete&id=${map.id}" onclick="return confirm('Are you sure you want to delete? ')">delete</a>
                                    <!--qiatnalijne-->
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <%@include file="/page.jsp" %>

            <p>sum: ${total.sum_amount} 　　</p>
        </div>
    </div>
</div>
<%@ include file="/foot.jsp" %>

