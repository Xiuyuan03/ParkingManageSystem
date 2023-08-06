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
    String sql = "update " + biao + " set is_paid='yes' where id='" + id + "'";
    DB.execute(sql);
    if ("outOfParking".equals(biao)) {
        DB.execute("update  ic_card_info set card_balance=card_balance-'" + order.get("amount") + "'  where serial_number='" + order.get("serial_number") + "'");
    }
    if ("chongzhi".equals(biao)) {
        DB.execute(
                "Update ic_card_info set card_balance=card_balance+'" + order.get("recharge_amount") + "'   where serial_number='" + order.get("serial_number") + "'"
        );
    }

    out.print("<script>alert('pay successfully!!');opener.location.reload();window.close();</script>");
%>

</body>
</html>
