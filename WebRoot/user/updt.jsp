<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">


        <div class="panel panel-default">
            <div class="panel-heading">edit user:</div>
            <div class="panel-body">
                <form action="user_.do?ac=update" method="post" name="form1" id="form1">


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
                                    remote="common.do?ac=checkno&checktype=update&id=${mmm.id}&table=user&col=account"
                                    data-msg-remote="The content is repeated"
                                    id="account"
                                    name="account"
                                    value="${Info.html(mmm.account)}"
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
                                    value="${Info.html(mmm.name)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">sex</label>
                            <div class="col-sm-10">
                                <select class="form-control class_sex3" data-value="${Info.html(mmm.sex)}" id="sex" name="sex" style="width: 250px">
                                    <option value="male">male</option>
                                    <option value="female">female</option>
                                </select>
                                <script>
                                    $(".class_sex3").val($(".class_sex3").attr("data-value"));
                                </script>
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
                                    value="${Info.html(mmm.phone)}"
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
                                    data-msg-email="please enter correct email"
                                    id="email"
                                    name="email"
                                    value="${Info.html(mmm.email)}"
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
                                    data-msg-email="please enter correct id card"
                                    id="id_card"
                                    name="id_card"
                                    value="${Info.html(mmm.id_card)}"
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

