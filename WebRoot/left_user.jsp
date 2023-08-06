<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>


<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open0"> &nbsp;&nbsp;IC card information manage <span class="caret"></span> </a>
    </div>
    <div id="open0" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="icCardInfo.do?ac=add" target="main" class="sbtn sbtn-default"> add IC card information </a>
            <a href="icCardInfo.do?ac=list_operator" target="main" class="sbtn sbtn-default"> my IC card information </a>
            <a href="recharge.do?ac=list_operator" target="main" class="sbtn sbtn-default"> my recharge </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open1"> &nbsp;&nbsp;message manage <span class="caret"></span> </a>
    </div>
    <div id="open1" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="message.do?ac=add" target="main" class="sbtn sbtn-default"> add message </a>
            <a href="message.do?ac=list_commenter" target="main" class="sbtn sbtn-default"> my message </a>
            <a href="reply.do?ac=list_commenter" target="main" class="sbtn sbtn-default"> message reply query </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open2"> &nbsp;&nbsp;complaint manage <span class="caret"></span> </a>
    </div>
    <div id="open2" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="complaint.do?ac=add" target="main" class="sbtn sbtn-default"> add complaint </a>
            <a href="complaint.do?ac=list_complainant" target="main" class="sbtn sbtn-default"> my complaint </a>
            <a href="feedback.do?ac=list_complainant" target="main" class="sbtn sbtn-default"> feedback query </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open3"> &nbsp;&nbsp;parking information manage <span class="caret"></span> </a>
    </div>
    <div id="open3" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="parkingLotInformation.do?ac=list" target="main" class="sbtn sbtn-default"> parking lot information manage </a>
            <a href="parking.do?ac=list_parking_person" target="main" class="sbtn sbtn-default"> my parking </a>
            <a href="outOfParking.do?ac=list_parking_person" target="main" class="sbtn sbtn-default"> my outOfParking </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open4"> &nbsp;&nbsp;personal center <span class="caret"></span> </a>
    </div>
    <div id="open4" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="user_.do?ac=updtself" target="main" class="sbtn sbtn-default"> modify personal information </a>
            <a href="mod.jsp" target="main" class="sbtn sbtn-default"> change Password </a>
        </div>
    </div>
</div>
