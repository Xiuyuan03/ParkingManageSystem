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
 *   Feedback module controller
 */
@WebServlet(value = { "/feedback.do" })
public class FeedbackServlet extends BaseServlet {

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
        FeedbackService service = new FeedbackServiceImpl();

        // Query data
        if (ac.indexOf("list") != -1) {
            String orderby = Request.get("orderby", "id"); // Obtain the orderby parameter in the browser address, sort by release time by default
            String sort = Request.get("sort", "DESC"); // Get the sort parameter in the browser address, sort by reverse order by default
            int pagesize = Request.getInt("pagesize", 12); // Obtain the sort parameter in the browser address. By default, it will be displayed in 12 lines per page
            int page = Math.max(1, Request.getInt("page", 1)); // Get current page default first page

            String where = "1=1"; // Prevent where and errors in sql statements

            
            if (Request.getInt("complaint_id") > 0) {
                // If greater than 0, write the condition
                where += " AND complaint_id='" + Request.getInt("complaint_id") + "' ";
            }
            // The following is to judge whether there is input content in the search box, judge whether the front desk has filled in the relevant conditions, and write the sqlsearch statement if it meets
            if (!Request.get("name").equals("")) {
                where += " AND name LIKE '%" + Request.get("name") + "%' ";
            }
            if (!Request.get("phone").equals("")) {
                where += " AND phone LIKE '%" + Request.get("phone") + "%' ";
            }
            if (!Request.get("complainant").equals("")) {
                where += " AND complainant LIKE '%" + Request.get("complainant") + "%' ";
            }
            if (ac.equals("list_complainant")) {
                where += " AND complainant='" + session.getAttribute("username") + "' ";
            }
            if (ac.equals("list_feedback_person")) {
                where += " AND feedback_person='" + session.getAttribute("username") + "' ";
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

            view("/feedback/" + ac + ".jsp");
            return;
        } else if (ac.equals("add")) { // 反馈添加页面视图
            if (ac.equals("add") && !checkLogin()) {
                showError("not logged in");
                return;
            }

            int id = Request.getInt("id"); // 根据id 获取投诉模块中的数据
            Complaint readMap = new ComplaintServiceImpl().find(id);
            // Write the data row to the foreground jsp page
            request.setAttribute("readMap", readMap);
            view("/feedback/" + ac + ".jsp");
            return;
        } else if (ac.equals("insert")) {
            // insert
            Feedback post = new Feedback(); // create entity class
            // Set the data from the foreground submit to the entity class
            post.setComplaint_id(Request.getInt("complaint_id"));

            post.setName(Request.get("name"));

            post.setPhone(Request.get("phone"));

            post.setComplainant(Request.get("complainant"));

            post.setContent(DownloadRemoteImage.run(Request.get("content")));

            post.setFeedback_person(Request.get("feedback_person"));

            post.setComplaint_id(Request.getInt("complaint_id"));

            service.insert(post); // insert data
            int charuid = post.getId().intValue();

            showSuccess("Saved successfully", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
        } else if (ac.equals("updt")) {
            String id = Request.get("id");

            Feedback mmm = service.findWhere("id=" + id);

            Complaint readMap = new ComplaintServiceImpl().find(mmm.getComplaint_id());
            // Write the data row to the foreground jsp page
            request.setAttribute("readMap", readMap);
            assign("mmm", mmm);
            view("/feedback/updt.jsp");
        } else if (ac.equals("update")) {
            // create entity class
            String charuid = request.getParameter("id");
            Feedback post = service.findWhere("id=" + charuid);
            if (request.getParameter("complaint_id") != null) post.setComplaint_id(Request.getInt("complaint_id"));

            if (request.getParameter("name") != null) post.setName(Request.get("name"));

            if (request.getParameter("phone") != null) post.setPhone(Request.get("phone"));

            if (request.getParameter("complainant") != null) post.setComplainant(Request.get("complainant"));

            if (request.getParameter("content") != null) post.setContent(DownloadRemoteImage.run(Request.get("content")));

            if (request.getParameter("feedback_person") != null) post.setFeedback_person(Request.get("feedback_person"));

            service.update(post);

            showSuccess("Saved successfully", Request.get("referer"));
            // update
        } else if (ac.equals("detail")) {
            int id = Request.getInt("id");
            Feedback map = service.find(id);

            request.setAttribute("map", map); 
            view("/feedback/" + ac + ".jsp");
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
