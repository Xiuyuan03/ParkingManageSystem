<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 出场 </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div>
                    <input type="hidden" name="ac" value="${param.ac}" />
                    <div class="form-group">
                        停车场编号

                        <input type="text" class="form-control" style="" name="tingchechangbianhao" value="${param.tingchechangbianhao}" />
                    </div>
                    <div class="form-group">
                        停车场名称

                        <input type="text" class="form-control" style="" name="tingchechangmingcheng" value="${param.tingchechangmingcheng}" />
                    </div>
                    <div class="form-group">
                        停车时间

                        <input
                            type="text"
                            class="form-control"
                            name="tingcheshijian_start"
                            readonly="readonly"
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                        />-<input
                            type="text"
                            class="form-control"
                            name="tingcheshijian_end"
                            readonly="readonly"
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                        />
                    </div>
                    <div class="form-group">
                        类型

                        <select class="form-control select-update" data-value="${param.leixing}" id="leixing" name="leixing">
                            <option value="">请选择</option>
                            <option value="年卡">年卡</option>
                            <option value="月卡">月卡</option>
                            <option value="临时">临时</option>
                        </select>
                        <script>
                            $(".class_leixing17 select-update").val($(".class_leixing17 select-update").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group">
                        收费金额

                        <input type="text" class="form-control" style="width: 80px" name="shoufeijine_start" value="${param.shoufeijine_start}" />-<input
                            type="text"
                            class="form-control"
                            style="width: 80px"
                            name="shoufeijine_end"
                            value="${param.shoufeijine_end}"
                        />
                    </div>
                    <div class="form-group">
                        出场时间

                        <input
                            type="text"
                            class="form-control"
                            name="chuchangshijian_start"
                            readonly="readonly"
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                        />-<input
                            type="text"
                            class="form-control"
                            name="chuchangshijian_end"
                            readonly="readonly"
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                        />
                    </div>
                    <div class="form-group">
                        时长

                        <input type="text" class="form-control" style="width: 80px" name="shizhang_start" value="${param.shizhang_start}" />-
                        <input type="text" class="form-control" style="width: 80px" name="shizhang_end" value="${param.shizhang_end}" />
                    </div>
                    <select class="form-control" name="order" id="orderby">
                        <option value="id">按发布时间</option>
                        <option value="shoufeijine">按收费金额</option>
                        <option value="jine">按金额</option>
                    </select>
                    <select class="form-control" name="sort" id="sort">
                        <option value="desc">倒序</option>
                        <option value="asc">升序</option>
                    </select>
                    <script>
                        $("#orderby").val("${orderby}");
                        $("#sort").val("${sort}");
                    </script>
                    <button type="submit" class="btn btn-default">搜索</button>

                    <!--form标签结束-->
                </form>
            </div>

            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th width="60" data-field="item">序号</th>
                            <th>停车场编号</th>
                            <th>停车场名称</th>
                            <th>位置</th>
                            <th>停车时间</th>
                            <th>卡号</th>
                            <th>编号</th>
                            <th>持卡人</th>
                            <th>联系电话</th>
                            <th>类型</th>
                            <th>收费金额</th>
                            <th>车辆类型</th>
                            <th>车位</th>
                            <th>停车人</th>
                            <th>出场时间</th>
                            <th>时长</th>
                            <th>金额</th>
                            <th width="80" data-field="iszf">是否支付</th>
                            <th width="220" data-field="handler">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="i" value="0" /><c:forEach items="${list}" var="map"
                            ><c:set var="i" value="${i+1}" />
                            <tr id="${map.id}" pid="">
                                <td width="30" align="center">
                                    <label> ${i} </label>
                                </td>
                                <td>${map.tingchechangbianhao}</td>
                                <td>${map.tingchechangmingcheng}</td>
                                <td>
                                    <ssm:sql var="maptingcheweixinxi8" type="find">SELECT tingchechangmingcheng,id FROM tingcheweixinxi where id='${map.weizhi}'</ssm:sql
                                    >${maptingcheweixinxi8.tingchechangmingcheng}
                                </td>
                                <td>${map.tingcheshijian}</td>
                                <td>${map.kahao}</td>
                                <td>${map.bianhao}</td>
                                <td>${map.chikaren}</td>
                                <td>${map.lianxidianhua}</td>
                                <td>${map.leixing}</td>
                                <td>${map.shoufeijine}</td>
                                <td>${map.cheliangleixing}</td>
                                <td>${map.chewei}</td>
                                <td>${map.tingcheren}</td>
                                <td>${map.chuchangshijian}</td>
                                <td>${map.shizhang}</td>
                                <td>${map.jine}</td>
                                <td>
                                    ${map.iszf}
                                    <c:choose>
                                        <c:when test="${'否' == map.iszf }">
                                            <a href="javascript:window.open('zhifu/index.jsp?id=${map.id}&biao=chuchang&ordersn=${map.tingchechangbianhao}&zongji=${map.jine}')">
                                                去支付
                                            </a>
                                        </c:when></c:choose
                                    >
                                </td>
                                <td align="center">
                                    <a href="chuchang.do?ac=detail&id=${map.id}">详情</a>

                                    <a href="chuchang.do?ac=updt&id=${map.id}">编辑</a>

                                    <a href="chuchang.do?ac=delete&id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
                                    <!--qiatnalijne-->
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <%@include file="/page.jsp" %>

            <p>金额总和: ${total.sum_jine} 　　</p>
        </div>
    </div>
</div>
<%@ include file="/foot.jsp" %>

