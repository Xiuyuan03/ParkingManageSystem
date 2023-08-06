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
            <div class="panel-heading">edit complaint:</div>
            <div class="panel-body">
                <form action="complaint.do?ac=update" method="post" name="form1" id="form1">


                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">name</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="enter name"
                                    style="width: 150px"
                                    id="name"
                                    name="name"
                                    value="${Info.html(mmm.name)}"
                                />
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
                                    phone="true"
                                    data-msg-phone="Please enter the correct mobile number"
                                    id="phone"
                                    name="phone"
                                    value="${Info.html(mmm.phone)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">complaint content</label>
                            <div class="col-sm-10">
                                <textarea id="content" name="content" style="max-width: 750px; width: 100%; height: 300px">${Info.html(mmm.content)}</textarea>
                                <script>
                                    (function () {
                                        var um = UM.getEditor("content");
                                    })();
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">投诉人</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="enter complainant"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="complainant"
                                    name="complainant"
                                    value="${mmm.complainant}"
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

