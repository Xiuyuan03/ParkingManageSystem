<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">


        <div class="panel panel-default">
            <div class="panel-heading">Add parking information:</div>
            <div class="panel-body">
                <form action="parkingInformation.do?ac=insert" method="post" name="form1" id="form1">


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
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">Name of parking lot</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="enterName of parking lot"
                                    style="width: 250px"
                                    id="parking_lot_name"
                                    name="parking_lot_name"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">row<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="enter "
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="please input row"
                                    number="true"
                                    data-msg-number="enter a valid number"
                                    id="row"
                                    name="row"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">column<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="enter column"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="please input column"
                                    number="true"
                                    data-msg-number="enter  a valid number"
                                    id="columns"
                                    name="columns"
                                    value=""
                                />
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

