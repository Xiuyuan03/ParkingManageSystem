<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">投诉详情</div>
        <div class="panel-body">
            <div class="admin-detail clearfix">
                <div class="detail detail-text">
                    <div class="detail-title">姓名：</div>
                    <div class="detail-content">${map.xingming}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">联系电话：</div>
                    <div class="detail-content">${map.lianxidianhua}</div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">投诉人：</div>
                    <div class="detail-content">${map.tousuren}</div>
                </div>
                <div class="detail detail-editor">
                    <div class="detail-title">投诉内容：</div>
                    <div class="detail-content">${map.tousuneirong}</div>
                </div>
            </div>

            <div class="button-list mt10">
                <div class="">
                    <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                    <button type="button" class="btn btn-default" onclick="window.print()">打印本页</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/foot.jsp" %>

