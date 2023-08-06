package com.gin.servlet;

import com.gin.entity.*;
import com.gin.service.*;
import com.gin.service.impl.*;
import com.gin.util.*;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *   Recharge Module Controller
 */
@WebServlet(value = { "/recharge.do" })
public class RechargeServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ac = request.getParameter("ac");
        if (ac == null) {
            ac = "list";
        }
        RechargeService service = new RechargeServiceImpl();

        // Query data
        if (ac.indexOf("list") != -1) {
            String orderby = Request.get("orderby", "id"); // Obtain the orderby parameter in the browser address, sort by release time by default
            String sort = Request.get("sort", "DESC"); // Get the sort parameter in the browser address, sort by reverse order by default
            int pagesize = Request.getInt("pagesize", 12); // Obtain the sort parameter in the browser address. By default, it will be displayed in 12 lines per page
            int page = Math.max(1, Request.getInt("page", 1)); // Get current page default first page

            String where = "1=1"; // Prevent where and errors in sql statements

            // Determine whether the URL parameter ic_card_info_id is greater than 0
            if (Request.getInt("ic_card_info_id") > 0) {
                // If greater than 0, write the condition
                where += " AND ic_card_info_id='" + Request.getInt("ic_card_info_id") + "' ";
            }
            // The following is to judge whether there is input content in the search box, judge whether the front desk has filled in the relevant conditions, and write the sqlsearch statement if it meets

            if (!Request.get("recharge_amount").equals("")) {
                where += " AND recharge_amount >='" + Request.get("recharge_amount_start") + "' ";
            }
            if (!Request.get("recharge_amount_end").equals("")) {
                where += " AND recharge_amount <= '" + Request.get("recharge_amount_end") + "' ";
            }
            if (!Request.get("operator").equals("")) {
                where += " AND operator LIKE '%" + Request.get("operator") + "%' ";
            }
            if (ac.equals("list_operator")) {
                where += " AND operator='" + session.getAttribute("username") + "' ";
            }

            // get row count
            long count = service.count(where);
            // Create paging information
            new Collect(count, pagesize, page);
            // Paginate and query data
            List list = service.selectPages(pagesize, page, where, orderby + " " + sort);

            request.setAttribute("list", list);

            request.setAttribute("orderby", orderby);
            request.setAttribute("sort", sort);
            request.setAttribute("pagesize", pagesize);

            view("/recharge/" + ac + ".jsp");
            return;
        } else if (ac.equals("add")) { // Recharge to add page view
            if (ac.equals("add") && !checkLogin()) {
                showError("not logged in");
                return;
            }

            int id = Request.getInt("id"); // Obtain the data in the IC card information module according to the id
            ICCardInfo readMap = new ICCardInfoServiceImpl().find(id);
            // Write the data row to the foreground jsp page
            request.setAttribute("readMap", readMap);
            view("/recharge/" + ac + ".jsp");
            return;
        } else if (ac.equals("insert")) {
            // insert
            Recharge post = new Recharge(); // create entity class
            // Set the data from the foreground submit to the entity class
            post.setIc_card_info_id(Request.getInt("ic_card_info_id"));

            post.setSerial_number(Request.get("serial_number"));

            post.setCard_number(Request.get("card_number"));

            post.setRecharge_amount(Request.getDouble("recharge_amount"));

            post.setOperator(Request.get("operator"));

            post.setIc_card_info_id(Request.getInt("ic_card_info_id"));
            post.setIs_paid(Request.get("is_paid", Request.get("is_paid", "no")));

            service.insert(post); // insert data
            int insertId = post.getId().intValue();

            showSuccess("Saved successfully", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
        } else if (ac.equals("updt")) {
            String id = Request.get("id");

            Recharge mmm = service.findWhere("id=" + id);

            ICCardInfo readMap = new ICCardInfoServiceImpl().find(mmm.getIc_card_info_id());
            // Write the data row to the foreground jsp page
            request.setAttribute("readMap", readMap);
            assign("mmm", mmm);
            view("/recharge/updt.jsp");
        } else if (ac.equals("update")) {
            // create entity class
            String insertId = request.getParameter("id");
            Recharge post = service.findWhere("id=" + insertId);
            if (request.getParameter("ic_card_info_id") != null) post.setIc_card_info_id(Request.getInt("ic_card_info_id"));

            if (request.getParameter("serial_number") != null) post.setSerial_number(Request.get("serial_number"));

            if (request.getParameter("card_number") != null) post.setCard_number(Request.get("card_number"));

            if (request.getParameter("recharge_amount") != null) post.setRecharge_amount(Request.getDouble("recharge_amount"));

            if (request.getParameter("operator") != null) post.setOperator(Request.get("operator"));

            service.update(post);

            showSuccess("Saved successfully", Request.get("referer"));
            // update
        } else if (ac.equals("delete")) {
            if (!checkLogin()) {
                showError("not logged in");
                return;
            }
            int id = Request.getInt("id");
            service.delete(id);
            showSuccess("successfully deleted", request.getHeader("referer"));
        } else {
            response.sendError(404);
        }
    }
}
