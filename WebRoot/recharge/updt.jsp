<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">


        <div class="panel panel-default">
            <div class="panel-heading">Edit recharge:</div>
            <div class="panel-body">
                <form action="recharge.do?ac=update" method="post" name="form1" id="form1">


                    <input type="hidden" name="ic_card_info_id" value="${mmm.ic_card_info_id}" />
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">serialNumber</label>
                            <div class="col-sm-10">${mmm.serial_number}<input type="hidden" id="serial_number" name="serial_number" value="${Info.html(mmm.serial_number)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">cardNumber</label>
                            <div class="col-sm-10">${mmm.card_number}<input type="hidden" id="card_number" name="card_number" value="${Info.html(mmm.card_number)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">rechargeAmount<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="Enter the recharge amount"
                                    style="width: 150px"
                                    step="0.01"
                                    data-rule-required="true"
                                    data-msg-required="Please fill in the recharge amount"
                                    number="true"
                                    data-msg-number="Enter a valid number"
                                    id="recharge_amount"
                                    name="recharge_amount"
                                    value="${Info.html(mmm.recharge_amount)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">operator</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Enter operator"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="operator"
                                    name="operator"
                                    value="${mmm.operator}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="id" value="${mmm.id}" type="hidden" />
                                <input name="referer" value="<%=request.getHeader("referer") %>" type="hidden" />
                                <input name="updtself" value="${updtself}" type="hidden" />

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

