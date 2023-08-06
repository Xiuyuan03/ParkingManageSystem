<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>


<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open0"> &nbsp;&nbsp;停车位信息管理 <span class="caret"></span> </a>
    </div>
    <div id="open0" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="tingcheweixinxi.do?ac=add" target="main" class="sbtn sbtn-default"> 停车位信息添加 </a>
            <a href="tingcheweixinxi.do?ac=list" target="main" class="sbtn sbtn-default"> 停车位信息查询 </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open1"> &nbsp;&nbsp;停车场信息管理 <span class="caret"></span> </a>
    </div>
    <div id="open1" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="tingchechangxinxi.do?ac=add" target="main" class="sbtn sbtn-default"> 停车场信息添加 </a>
            <a href="tingchechangxinxi.do?ac=list" target="main" class="sbtn sbtn-default"> 停车场信息查询 </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open2"> &nbsp;&nbsp;IC卡信息管理 <span class="caret"></span> </a>
    </div>
    <div id="open2" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="ickaxinxi.do?ac=list" target="main" class="sbtn sbtn-default"> IC卡信息查询 </a>
            <a href="chongzhi.do?ac=list" target="main" class="sbtn sbtn-default"> 充值查询 </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open3"> &nbsp;&nbsp;收费标准管理 <span class="caret"></span> </a>
    </div>
    <div id="open3" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="shoufeibiaozhun.do?ac=add" target="main" class="sbtn sbtn-default"> 收费标准添加 </a>
            <a href="shoufeibiaozhun.do?ac=list" target="main" class="sbtn sbtn-default"> 收费标准查询 </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open4"> &nbsp;&nbsp;留言管理 <span class="caret"></span> </a>
    </div>
    <div id="open4" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="liuyan.do?ac=list" target="main" class="sbtn sbtn-default"> 留言查询 </a>
            <a href="liuyanhuifu.do?ac=list" target="main" class="sbtn sbtn-default"> 留言回复查询 </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open5"> &nbsp;&nbsp;投诉管理 <span class="caret"></span> </a>
    </div>
    <div id="open5" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="tousu.do?ac=list" target="main" class="sbtn sbtn-default"> 投诉查询 </a>
            <a href="fankui.do?ac=list" target="main" class="sbtn sbtn-default"> 反馈查询 </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open6"> &nbsp;&nbsp;停车管理 <span class="caret"></span> </a>
    </div>
    <div id="open6" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="tingche.do?ac=list" target="main" class="sbtn sbtn-default"> 停车查询 </a>
            <a href="chuchang.do?ac=list" target="main" class="sbtn sbtn-default"> 出场查询 </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open7"> &nbsp;&nbsp;用户管理 <span class="caret"></span> </a>
    </div>
    <div id="open7" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="yonghu.do?ac=add" target="main" class="sbtn sbtn-default"> 添加新用户 </a>
            <a href="yonghu.do?ac=list" target="main" class="sbtn sbtn-default"> 注册用户管理 </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open8"> &nbsp;&nbsp;账号管理 <span class="caret"></span> </a>
    </div>
    <div id="open8" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="admins.do?ac=list" target="main" class="sbtn sbtn-default"> 管理员账号管理 </a>
            <a href="admins.do?ac=add" target="main" class="sbtn sbtn-default"> 管理员账号添加 </a>
            <a href="mod.jsp" target="main" class="sbtn sbtn-default"> 密码修改 </a>
        </div>
    </div>
</div>
