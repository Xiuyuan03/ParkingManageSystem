<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">feedback detail</div>
        <div class="panel-body">
            <div class="admin-detail clearfix">
                <div class="detail detail-readmodule">
                    <div class="detail-title">complaint id:</div>
                    <div class="detail-content">${map.complaint_id}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">name:</div>
                    <div class="detail-content">${map.name}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">phone:</div>
                    <div class="detail-content">${map.phone}</div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">complainant:</div>
                    <div class="detail-content">${map.complainant}</div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">feedback person:</div>
                    <div class="detail-content">${map.feedback_person}</div>
                </div>
                <div class="detail detail-editor">
                    <div class="detail-title">feedback content:</div>
                    <div class="detail-content">${map.content}</div>
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

