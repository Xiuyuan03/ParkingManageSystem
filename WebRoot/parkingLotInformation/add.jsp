<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css" />
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">


        <div class="panel panel-default">
            <div class="panel-heading">add parking information:</div>
            <div class="panel-body">
                <form action="parkingLotInformation.do?ac=insert" method="post" name="form1" id="form1">


                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">parking serial number</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="enter parking serial number"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="parking_lot_number"
                                    name="parking_lot_number"
                                    value="${Info.getID()}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">Name of parking lot<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="enter Name of parking lot"
                                    style="width: 250px"
                                    data-rule-required="true"
                                    data-msg-required="please inputName of parking lot"
                                    id="parking_lot_name"
                                    name="parking_lot_name"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">location<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_location4"
                                    data-value=""
                                    data-rule-required="true"
                                    data-msg-required="please input location"
                                    id="location"
                                    name="location"
                                    style="width: 250px"
                                >
                                    <ssm:sql var="select" type="select">SELECT * FROM parking_information ORDER BY id desc</ssm:sql>
                                    <c:forEach items="${select}" var="m">
                                        <option value="${m.id}">${m.parking_lot_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">parking introduction<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <textarea
                                    data-rule-required="true"
                                    data-msg-required="please input parking introduction"
                                    id="introduction"
                                    name="introduction"
                                    style="max-width: 750px; width: 100%; height: 300px"
                                ></textarea>
                                <script>
                                    (function () {
                                        var um = UM.getEditor("introduction");
                                    })();
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary" name="Submit">submit</button>
                                <button type="reset" class="btn btn-default" name="Submit2">reset</button>
                            </div>
                        </div>
                    </div>


                </form>
            </div>
        </div>


    </div>

    <script>
        $(function () {
            $("#form1").validate();
        });
    </script>
</div>
<%@ include file="/foot.jsp" %>

