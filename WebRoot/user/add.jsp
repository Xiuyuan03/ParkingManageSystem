<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">


        <div class="panel panel-default">
            <div class="panel-heading">add user:</div>
            <div class="panel-body">
                <form action="user_.do?ac=insert" method="post" name="form1" id="form1">


                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">account<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="enter account"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="please input account"
                                    remote="common.do?ac=checkno&checktype=insert&table=user&col=account"
                                    data-msg-remote="The content is repeated"
                                    id="account"
                                    name="account"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">password<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="password"
                                    class="form-control"
                                    placeholder="enter password"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="please input password"
                                    id="password"
                                    name="password"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">name<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="enter name"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="please input name"
                                    id="name"
                                    name="name"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">sex</label>
                            <div class="col-sm-10">
                                <select class="form-control class_sex2" data-value="" id="sex" name="sex" style="width: 250px">
                                    <option value="male">male</option>
                                    <option value="female">female</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">phone</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="enter phone"
                                    style="width: 150px"
                                    tel="true"
                                    data-msg-phone="please enter correct phone"
                                    id="phone"
                                    name="phone"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">email</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="enter email"
                                    style="width: 150px"
                                    email="true"
                                    data-msg-email="please enter valid email"
                                    id="email"
                                    name="email"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">id card</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="enter id card"
                                    style="width: 150px"
                                    idcard="true"
                                    data-msg-email="please enter valid id card"
                                    id="id_card"
                                    name="id_card"
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
                                <a href="login.jsp" class="btn btn-default">return main page</a>
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

