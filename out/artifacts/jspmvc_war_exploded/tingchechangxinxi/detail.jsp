<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">停车场信息详情</div>
        <div class="panel-body">
            <div class="admin-detail clearfix">
                <div class="detail detail-text">
                    <div class="detail-title">停车场编号：</div>
                    <div class="detail-content">${map.tingchechangbianhao}</div>
                </div>
                <div class="detail detail-longtext">
                    <div class="detail-title">停车场名称：</div>
                    <div class="detail-content">${map.tingchechangmingcheng}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">位置：</div>
                    <div class="detail-content">
                        <ssm:sql var="maptingcheweixinxi2" type="find">SELECT tingchechangmingcheng,id FROM tingcheweixinxi where id='${map.weizhi}'</ssm:sql
                        >${maptingcheweixinxi2.tingchechangmingcheng}
                    </div>
                </div>
                <div class="detail detail-editor">
                    <div class="detail-title">停车场介绍：</div>
                    <div class="detail-content">${map.tingchechangjieshao}</div>
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

