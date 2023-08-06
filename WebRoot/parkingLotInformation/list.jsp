<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> parking information </span>
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
                    <select class="form-control" name="order" id="orderby">
                        <option value="id">by release time</option>
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
                                    <ssm:sql var="mapparking_information1" type="find">SELECT parking_lot_name,id FROM parking_information where id='${map.location}'</ssm:sql
                                    >${mapparking_information1.parking_lot_name}
                                </td>
                                <td align="center">
                                    <a href="parking.do?ac=add&id=${map.id}">parking</a>

                                    <a href="parkingLotInformation.do?ac=detail&id=${map.id}">detail</a>
                                    <c:choose>
                                        <c:when test="${'administrator' == sessionScope.cx }">

                                            <a href="parkingLotInformation.do?ac=updt&id=${map.id}">edit</a>

                                            <a href="parkingLotInformation.do?ac=delete&id=${map.id}" onclick="return confirm('Are you sure you want to delete? ')">delete</a>
                                        </c:when></c:choose>

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

