package com.gin.servlet;

import com.gin.entity.ChargingStandard;
import com.gin.service.ChargingStandardService;
import com.gin.service.impl.ChargingStandardServiceImpl;
import com.gin.util.*;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *   Charging Standard module controller
 */
@WebServlet(value = { "/charging_standard.do" })
public class ChargingStandardServlet extends BaseServlet {

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
        ChargingStandardService service = new ChargingStandardServiceImpl();

        // Query data
        if (ac.indexOf("list") != -1) {
            String orderby = Request.get("orderby", "id"); // Obtain the orderby parameter in the browser address, sort by release time by default
            String sort = Request.get("sort", "DESC"); // Get the sort parameter in the browser address, sort by reverse order by default
            int pagesize = Request.getInt("pagesize", 12); // Obtain the sort parameter in the browser address. By default, it will be displayed in 12 lines per page
            int page = Math.max(1, Request.getInt("page", 1)); // Get current page default first page

            String where = "1=1"; // Prevent where and errors in sql statements
            // The following is to judge whether there is input content in the search box, judge whether the front desk has filled in the relevant conditions, and write the sqlsearch statement if it meets
            if (!Request.get("type").equals("")) {
                where += " AND type ='" + Request.get("type") + "' ";
            }

            if (!Request.get("amount_start").equals("")) {
                where += " AND amount >='" + Request.get("amount_start") + "' ";
            }
            if (!Request.get("amount_end").equals("")) {
                where += " AND amount <= '" + Request.get("amount_end") + "' ";
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

            view("/charging_standard/" + ac + ".jsp");
            return;
        } else if (ac.equals("add")) {
            if (ac.equals("add") && !checkLogin()) {
                showError("not logged in");
                return;
            }

            view("/charging_standard/" + ac + ".jsp");
            return;
        } else if (ac.equals("insert")) {
            // insert
            ChargingStandard post = new ChargingStandard(); // create entity class
            // Set the data from the foreground submit to the entity class
            post.setType(Request.get("type"));

            post.setAmount(Request.getDouble("amount"));

            service.insert(post); // insert data
            int charuid = post.getId().intValue();

            showSuccess("Saved successfully", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
        } else if (ac.equals("updt")) {
            String id = Request.get("id");

            ChargingStandard mmm = service.findWhere("id=" + id);
            assign("mmm", mmm);
            view("/charging_standard/updt.jsp");
        } else if (ac.equals("update")) {
            // create entity class
            String charuid = request.getParameter("id");
            ChargingStandard post = service.findWhere("id=" + charuid);
            if (request.getParameter("type") != null) post.setType(Request.get("type"));

            if (request.getParameter("amount") != null) post.setAmount(Request.getDouble("amount"));

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
