<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>


<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open0"> &nbsp;&nbsp;parking information manage <span class="caret"></span> </a>
    </div>
    <div id="open0" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="parkingInformation.do?ac=add" target="main" class="sbtn sbtn-default"> parking information add </a>
            <a href="parkingInformation.do?ac=list" target="main" class="sbtn sbtn-default"> parking information query </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open1"> &nbsp;&nbsp;parking lot information manage <span class="caret"></span> </a>
    </div>
    <div id="open1" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="parkingLotInformation.do?ac=add" target="main" class="sbtn sbtn-default"> parking lot information add </a>
            <a href="parkingLotInformation.do?ac=list" target="main" class="sbtn sbtn-default"> parking lot information query </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open2"> &nbsp;&nbsp;IC card information manage <span class="caret"></span> </a>
    </div>
    <div id="open2" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="icCardInfo.do?ac=list" target="main" class="sbtn sbtn-default"> IC card information query </a>
            <a href="recharge.do?ac=list" target="main" class="sbtn sbtn-default"> Recharge inquiry </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open3"> &nbsp;&nbsp;charging standard manage <span class="caret"></span> </a>
    </div>
    <div id="open3" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="charging_standard.do?ac=add" target="main" class="sbtn sbtn-default"> charging standard add </a>
            <a href="charging_standard.do?ac=list" target="main" class="sbtn sbtn-default"> charging standard query </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open4"> &nbsp;&nbsp;message manage <span class="caret"></span> </a>
    </div>
    <div id="open4" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="message.do?ac=list" target="main" class="sbtn sbtn-default"> message query </a>
            <a href="reply.do?ac=list" target="main" class="sbtn sbtn-default"> reply query </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open5"> &nbsp;&nbsp;complaint manage <span class="caret"></span> </a>
    </div>
    <div id="open5" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="complaint.do?ac=list" target="main" class="sbtn sbtn-default"> complaint query </a>
            <a href="feedback.do?ac=list" target="main" class="sbtn sbtn-default"> feedback query </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open6"> &nbsp;&nbsp;parking manage <span class="caret"></span> </a>
    </div>
    <div id="open6" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="parking.do?ac=list" target="main" class="sbtn sbtn-default"> parking query </a>
            <a href="outOfParking.do?ac=list" target="main" class="sbtn sbtn-default"> outOfParking query </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open7"> &nbsp;&nbsp;user manage <span class="caret"></span> </a>
    </div>
    <div id="open7" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="user_.do?ac=add" target="main" class="sbtn sbtn-default"> add new user </a>
            <a href="user_.do?ac=list" target="main" class="sbtn sbtn-default"> register user </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open8"> &nbsp;&nbsp;account manage <span class="caret"></span> </a>
    </div>
    <div id="open8" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="admins.do?ac=list" target="main" class="sbtn sbtn-default"> administrator account manage </a>
            <a href="admins.do?ac=add" target="main" class="sbtn sbtn-default"> administrator account add </a>
            <a href="mod.jsp" target="main" class="sbtn sbtn-default"> password edit </a>
        </div>
    </div>
</div>
