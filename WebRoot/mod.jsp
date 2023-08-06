<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>


<script src="js/jquery.validate.js"></script>

<div class="container" style="max-width: 640px">


    <div class="panel panel-default">
        <div class="panel-heading">change Password:</div>
        <div class="panel-body">
            <form action="user.do?ac=updatePassword" method="post" name="form1" id="form1">


                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">old password<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <input
                                type="password"
                                class="form-control"
                                autocomplete="off"
                                placeholder="Please enter the original password"
                                required="true"
                                data-msg-required="Please enter the original password"
                                name="oldPassword"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">new password<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <input
                                type="password"
                                class="form-control"
                                autocomplete="off"
                                placeholder="Please enter a new password"
                                required="true"
                                data-msg-required="Please enter a new password"
                                id="xmm"
                                name="newPwd"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">check password<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <input
                                type="password"
                                class="form-control"
                                autocomplete="off"
                                placeholder="please enter password"
                                required="true"
                                data-msg-required="please enter password"
                                equalto="#xmm"
                                name="newPwd2"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary" name="Submit">submit</button>
                    <button type="reset" class="btn btn-default" name="Submit2">reset</button>
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

<%@ include file="/foot.jsp" %>

