<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">parking information detail</div>
        <div class="panel-body">
            <div class="admin-detail clearfix">
                <div class="detail detail-text">
                    <div class="detail-title">parking lot serial number:</div>
                    <div class="detail-content">${map.parking_lot_number}</div>
                </div>
                <div class="detail detail-longtext">
                    <div class="detail-title">Name of parking lot:</div>
                    <div class="detail-content">${map.parking_lot_name}</div>
                </div>
                <div class="detail detail-number">
                    <div class="detail-title">row:</div>
                    <div class="detail-content">${map.row}</div>
                </div>
                <div class="detail detail-number">
                    <div class="detail-title">column:</div>
                    <div class="detail-content">${map.columns}</div>
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

