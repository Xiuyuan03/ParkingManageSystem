<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ include file="/head.jsp" %>

<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">


        <div class="panel panel-default">
            <div class="panel-heading">add message reply:</div>
            <div class="panel-body">
                <form action="reply.do?ac=insert" method="post" name="form1" id="form1">


                    <input type="hidden" name="message_id" value="${param.id}" />
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">name</label>
                            <div class="col-sm-10">${readMap.name}<input type="hidden" id="name" name="name" value="${Info.html(readMap.name)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">phone</label>
                            <div class="col-sm-10">
                                ${readMap.phone}<input type="hidden" id="phone" name="phone" value="${Info.html(readMap.phone)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">message commenter</label>
                            <div class="col-sm-10">${readMap.commenter}<input type="hidden" id="commenter" name="commenter" value="${Info.html(readMap.commenter)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">reply content</label>
                            <div class="col-sm-10">
                                <textarea style="width: 80%; height: 120px" class="form-control" placeholder="enter reply" id="content" name="content"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">respondent</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="enter respondent"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="respondent"
                                    name="respondent"
                                    value="${sessionScope.username}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="referer" id="referers" class="referers" value="<%=request.getHeader("referer") %>" type="hidden" />
                                <script>
                                    $(function () {
                                        $("input.referers").val(document.referrer);
                                    });
                                </script>

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

