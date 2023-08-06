<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> recharge </span>
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
                        rechargeAmount

                        <input type="text" class="form-control" style="width: 80px" name="recharge_amount_start" value="${param.recharge_amount_start}" />-<input
                            type="text"
                            class="form-control"
                            style="width: 80px"
                            name="recharge_amount_end"
                            value="${param.recharge_amount_end}"
                        />
                    </div>
                    <div class="form-group">
                        operator

                        <input type="text" class="form-control" style="" name="operator" value="${param.operator}" />
                    </div>
                    <select class="form-control" name="order" id="orderby">
                        <option value="id">by release time</option>
                        <option value="recharge_amount">By recharge amount</option>
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
                            <th width="60" data-field="item">serialNumber</th>
                            <th>serialNumber</th>
                            <th>cardNumber</th>
                            <th>rechargeAmount</th>
                            <th>operator</th>
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
                                <td>${map.serial_number}</td>
                                <td>${map.card_number}</td>
                                <td>${map.recharge_amount}</td>
                                <td>${map.operator}</td>
                                <td>
                                    ${map.is_paid}
                                    <c:choose>
                                        <c:when test="${'否' == map.is_paid }">
                                            <a href="javascript:window.open('zhifu/index.jsp?id=${map.id}&biao=chongzhi&ordersn=${map.serial_number}&zongji=${map.recharge_amount}')">
                                                to pay
                                            </a>
                                        </c:when></c:choose
                                    >
                                </td>
                                <td align="center">
                                    <a href="recharge.do?ac=updt&id=${map.id}">edit</a>

                                    <a href="recharge.do?ac=delete&id=${map.id}" onclick="return confirm('Are you sure you want to delete? ')">delete</a>
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

