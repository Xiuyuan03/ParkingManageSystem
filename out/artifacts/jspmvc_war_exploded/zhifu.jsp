<%@ page language="java" import="com.gin.util.*" pageEncoding="utf-8" %>
<%@page import="java.util.*" %>
<%@ page import="com.jntoo.db.DB" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
</head>
<body>
<%
    String id, biao;

    if (request.getParameter("out_trade_no") != null) {
        String[] out_trade_no = request.getParameter("out_trade_no").split("\\-");
        id = out_trade_no[2];
        biao = out_trade_no[1];
    } else {
        id = request.getParameter("id");
        biao = request.getParameter("biao");
    }
    Map order = Query.make(biao).find(id);
    String sql = "update " + biao + " set iszf='是' where id='" + id + "'";
    DB.execute(sql);
    if ("chuchang".equals(biao)) {
        DB.execute("update  ICkaxinxi set kaneiyue=kaneiyue-'" + order.get("jine") + "'  where bianhao='" + order.get("bianhao") + "'");
    }
    if ("chongzhi".equals(biao)) {
        DB.execute(
                "Update ICkaxinxi set kaneiyue=kaneiyue+'" + order.get("chongzhijine") + "'   where bianhao='" + order.get("bianhao") + "'"
        );
    }

    out.print("<script>alert('支付成功!!');opener.location.reload();window.close();</script>");
%>

</body>
</html>
