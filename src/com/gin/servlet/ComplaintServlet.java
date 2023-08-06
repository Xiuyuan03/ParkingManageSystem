package com.gin.servlet;

import com.gin.entity.Complaint;
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
 *   Complaint module controller
 */
@WebServlet(value = { "/complaint.do" })
public class ComplaintServlet extends BaseServlet {

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
        ComplaintService service = new ComplaintServiceImpl();

        // Query data
        if (ac.indexOf("list") != -1) {
            String orderby = Request.get("orderby", "id"); // Obtain the orderby parameter in the browser address, sort by release time by default
            String sort = Request.get("sort", "DESC"); // Get the sort parameter in the browser address, sort by reverse order by default
            int pagesize = Request.getInt("pagesize", 12); // Obtain the sort parameter in the browser address. By default, it will be displayed in 12 lines per page
            int page = Math.max(1, Request.getInt("page", 1)); // Get current page default first page

            String where = "1=1"; // Prevent where and errors in sql statements
            // The following is to judge whether there is input content in the search box, judge whether the front desk has filled in the relevant conditions, and write the sqlsearch statement if it meets
            if (!Request.get("name").equals("")) {
                where += " AND name LIKE '%" + Request.get("name") + "%' ";
            }
            if (!Request.get("phone").equals("")) {
                where += " AND phone LIKE '%" + Request.get("phone") + "%' ";
            }
            if (ac.equals("list_complainant")) {
                where += " AND complainant='" + session.getAttribute("username") + "' ";
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

            view("/complaint/" + ac + ".jsp");
            return;
        } else if (ac.equals("add")) { // 投诉添加页面视图
            if (ac.equals("add") && !checkLogin()) {
                showError("not logged in");
                return;
            }

            view("/complaint/" + ac + ".jsp");
            return;
        } else if (ac.equals("insert")) {
            // insert
            Complaint post = new Complaint(); // create entity class
            // Set the data from the foreground submit to the entity class
            post.setName(Request.get("name"));

            post.setPhone(Request.get("phone"));

            post.setContent(DownloadRemoteImage.run(Request.get("content")));

            post.setComplainant(Request.get("complainant"));

            service.insert(post); // insert data
            int charuid = post.getId().intValue();

            showSuccess("Saved successfully", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
        } else if (ac.equals("updt")) {
            String id = Request.get("id");

            Complaint mmm = service.findWhere("id=" + id);
            assign("mmm", mmm);
            view("/complaint/updt.jsp");
        } else if (ac.equals("update")) {
            // create entity class
            String charuid = request.getParameter("id");
            Complaint post = service.findWhere("id=" + charuid);
            if (request.getParameter("name") != null) post.setName(Request.get("name"));

            if (request.getParameter("phone") != null) post.setPhone(Request.get("phone"));

            if (request.getParameter("content") != null) post.setContent(DownloadRemoteImage.run(Request.get("content")));

            if (request.getParameter("complainant") != null) post.setComplainant(Request.get("complainant"));

            service.update(post);

            showSuccess("Saved successfully", Request.get("referer"));
            // update
        } else if (ac.equals("detail")) {
            int id = Request.getInt("id");
            Complaint map = service.find(id);

            request.setAttribute("map", map); 
            view("/complaint/" + ac + ".jsp");
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
