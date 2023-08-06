<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 充值 </span>
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
                        充值金额

                        <input type="text" class="form-control" style="width: 80px" name="chongzhijine_start" value="${param.chongzhijine_start}" />-<input
                            type="text"
                            class="form-control"
                            style="width: 80px"
                            name="chongzhijine_end"
                            value="${param.chongzhijine_end}"
                        />
                    </div>
                    <div class="form-group">
                        操作人

                        <input type="text" class="form-control" style="" name="caozuoren" value="${param.caozuoren}" />
                    </div>
                    <select class="form-control" name="order" id="orderby">
                        <option value="id">按发布时间</option>
                        <option value="chongzhijine">按充值金额</option>
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
                            <th>编号</th>
                            <th>卡号</th>
                            <th>充值金额</th>
                            <th>操作人</th>
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
                                <td>${map.bianhao}</td>
                                <td>${map.kahao}</td>
                                <td>${map.chongzhijine}</td>
                                <td>${map.caozuoren}</td>
                                <td>
                                    ${map.iszf}
                                    <c:choose>
                                        <c:when test="${'否' == map.iszf }">
                                            <a href="javascript:window.open('zhifu/index.jsp?id=${map.id}&biao=chongzhi&ordersn=${map.bianhao}&zongji=${map.chongzhijine}')">
                                                去支付
                                            </a>
                                        </c:when></c:choose
                                    >
                                </td>
                                <td align="center">
                                    <a href="chongzhi.do?ac=updt&id=${map.id}">编辑</a>

                                    <a href="chongzhi.do?ac=delete&id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
                                    <!--qiatnalijne-->
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <%@include file="/page.jsp" %>

        </div>
    </div>
</div>
<%@ include file="/foot.jsp" %>

