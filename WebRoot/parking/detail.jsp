<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">parking detail</div>
        <div class="panel-body">
            <div class="admin-detail clearfix">
                <div class="detail detail-readmodule">
                    <div class="detail-title">parking information id:</div>
                    <div class="detail-content">${map.parking_lot_information_id}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">parking serial number:</div>
                    <div class="detail-content">${map.parking_lot_number}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">serial number:</div>
                    <div class="detail-content">${map.serial_number}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">card holder:</div>
                    <div class="detail-content">${map.cardholder}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">phone:</div>
                    <div class="detail-content">${map.phone}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">parking space:</div>
                    <div class="detail-content">${map.parking_space}</div>
                </div>
                <div class="detail detail-longtext">
                    <div class="detail-title">Name of parking lot:</div>
                    <div class="detail-content">${map.parking_lot_name}</div>
                </div>
                <div class="detail detail-longtext">
                    <div class="detail-title">card number:</div>
                    <div class="detail-content">${map.card_number}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">location:</div>
                    <div class="detail-content">
                        <ssm:sql var="mapparking_information5" type="find">SELECT parking_lot_name,id FROM parking_information where id='${map.location}'</ssm:sql
                        >${mapparking_information5.parking_lot_name}
                    </div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">type:</div>
                    <div class="detail-content">${map.type}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">vehicle type:</div>
                    <div class="detail-content">${map.vehicle_type}</div>
                </div>
                <div class="detail detail-datetime">
                    <div class="detail-title">park time:</div>
                    <div class="detail-content">${map.park_time}</div>
                </div>
                <div class="detail detail-selectupdate">
                    <div class="detail-title">IC Card:</div>
                    <div class="detail-content"></div>
                </div>
                <div class="detail detail-selectupdate">
                    <div class="detail-title">choose type:</div>
                    <div class="detail-content"></div>
                </div>
                <div class="detail detail-money">
                    <div class="detail-title">charge amount:</div>
                    <div class="detail-content">${map.charge_amount}</div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">parking person:</div>
                    <div class="detail-content">${map.parking_person}</div>
                </div>
            </div>

            <div class="button-list mt10">
                <div class="">
                    <button type="button" class="btn btn-default" onclick="history.go(-1);">go back</button>
                    <button type="button" class="btn btn-default" onclick="window.print()">print page</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/foot.jsp" %>

