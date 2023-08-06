<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">出场详情</div>
        <div class="panel-body">
            <div class="admin-detail clearfix">
                <div class="detail detail-readmodule">
                    <div class="detail-title">停车id：</div>
                    <div class="detail-content">${map.tingcheid}</div>
                </div>
                <div class="detail detail-readmodule">
                    <div class="detail-title">停车场信息id：</div>
                    <div class="detail-content">${map.tingchechangxinxiid}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">停车场编号：</div>
                    <div class="detail-content">${map.tingchechangbianhao}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">编号：</div>
                    <div class="detail-content">${map.bianhao}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">持卡人：</div>
                    <div class="detail-content">${map.chikaren}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">联系电话：</div>
                    <div class="detail-content">${map.lianxidianhua}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">车位：</div>
                    <div class="detail-content">${map.chewei}</div>
                </div>
                <div class="detail detail-longtext">
                    <div class="detail-title">停车场名称：</div>
                    <div class="detail-content">${map.tingchechangmingcheng}</div>
                </div>
                <div class="detail detail-longtext">
                    <div class="detail-title">卡号：</div>
                    <div class="detail-content">${map.kahao}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">位置：</div>
                    <div class="detail-content">
                        <ssm:sql var="maptingcheweixinxi10" type="find">SELECT tingchechangmingcheng,id FROM tingcheweixinxi where id='${map.weizhi}'</ssm:sql
                        >${maptingcheweixinxi10.tingchechangmingcheng}
                    </div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">类型：</div>
                    <div class="detail-content">${map.leixing}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">车辆类型：</div>
                    <div class="detail-content">${map.cheliangleixing}</div>
                </div>
                <div class="detail detail-datetime">
                    <div class="detail-title">停车时间：</div>
                    <div class="detail-content">${map.tingcheshijian}</div>
                </div>
                <div class="detail detail-datetime">
                    <div class="detail-title">出场时间：</div>
                    <div class="detail-content">${map.chuchangshijian}</div>
                </div>
                <div class="detail detail-money">
                    <div class="detail-title">收费金额：</div>
                    <div class="detail-content">${map.shoufeijine}</div>
                </div>
                <div class="detail detail-money">
                    <div class="detail-title">金额：</div>
                    <div class="detail-content">${map.jine}</div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">停车人：</div>
                    <div class="detail-content">${map.tingcheren}</div>
                </div>
                <div class="detail detail-difftime">
                    <div class="detail-title">时长：</div>
                    <div class="detail-content">${map.shizhang}</div>
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

