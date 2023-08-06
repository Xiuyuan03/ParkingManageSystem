<%@ page language="java" import="com.gin.util.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>


<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open0"> &nbsp;&nbsp;IC卡信息管理 <span class="caret"></span> </a>
    </div>
    <div id="open0" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="ickaxinxi.do?ac=add" target="main" class="sbtn sbtn-default"> 添加IC卡信息 </a>
            <a href="ickaxinxi.do?ac=list_caozuoren" target="main" class="sbtn sbtn-default"> 我的IC卡信息 </a>
            <a href="chongzhi.do?ac=list_caozuoren" target="main" class="sbtn sbtn-default"> 我的充值 </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open1"> &nbsp;&nbsp;留言管理 <span class="caret"></span> </a>
    </div>
    <div id="open1" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="liuyan.do?ac=add" target="main" class="sbtn sbtn-default"> 添加留言 </a>
            <a href="liuyan.do?ac=list_liuyanren" target="main" class="sbtn sbtn-default"> 我的留言 </a>
            <a href="liuyanhuifu.do?ac=list_liuyanren" target="main" class="sbtn sbtn-default"> 留言回复查询 </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open2"> &nbsp;&nbsp;投诉管理 <span class="caret"></span> </a>
    </div>
    <div id="open2" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="tousu.do?ac=add" target="main" class="sbtn sbtn-default"> 添加投诉 </a>
            <a href="tousu.do?ac=list_tousuren" target="main" class="sbtn sbtn-default"> 我的投诉 </a>
            <a href="fankui.do?ac=list_tousuren" target="main" class="sbtn sbtn-default"> 反馈查询 </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open3"> &nbsp;&nbsp;停车场信息管理 <span class="caret"></span> </a>
    </div>
    <div id="open3" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="tingchechangxinxi.do?ac=list" target="main" class="sbtn sbtn-default"> 停车场信息查询 </a>
            <a href="tingche.do?ac=list_tingcheren" target="main" class="sbtn sbtn-default"> 我的停车 </a>
            <a href="chuchang.do?ac=list_tingcheren" target="main" class="sbtn sbtn-default"> 我的出场 </a>
        </div>
    </div>
</div>
<div class="accordion-group">
    <div class="accordion-heading">
        <a class="sbtn btn-default" data-toggle="collapse" href="#open4"> &nbsp;&nbsp;个人中心 <span class="caret"></span> </a>
    </div>
    <div id="open4" class="accordion-body collapse">
        <div class="accordion-inner">
            <a href="yonghu.do?ac=updtself" target="main" class="sbtn sbtn-default"> 修改个人资料 </a>
            <a href="mod.jsp" target="main" class="sbtn sbtn-default"> 修改密码 </a>
        </div>
    </div>
</div>
