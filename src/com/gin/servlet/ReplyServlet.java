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
 *   message reply module controller
 */
@WebServlet(value = { "/reply.do" })
public class ReplyServlet extends BaseServlet {

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
        ReplyService service = new ReplyServiceImpl();

        // Query data
        if (ac.indexOf("list") != -1) {
            String orderby = Request.get("orderby", "id"); // Obtain the orderby parameter in the browser address, sort by release time by default
            String sort = Request.get("sort", "DESC"); // Get the sort parameter in the browser address, sort by reverse order by default
            int pagesize = Request.getInt("pagesize", 12); // Obtain the sort parameter in the browser address. By default, it will be displayed in 12 lines per page
            int page = Math.max(1, Request.getInt("page", 1)); // Get current page default first page

            String where = "1=1"; // Prevent where and errors in sql statements

            if (Request.getInt("message_id") > 0) {
                // If greater than 0, write the condition
                where += " AND message_id='" + Request.getInt("message_id") + "' ";
            }
            // The following is to judge whether there is input content in the search box, judge whether the front desk has filled in the relevant conditions, and write the sqlsearch statement if it meets
            if (!Request.get("name").equals("")) {
                where += " AND name LIKE '%" + Request.get("name") + "%' ";
            }
            if (!Request.get("phone").equals("")) {
                where += " AND phone LIKE '%" + Request.get("phone") + "%' ";
            }
            if (!Request.get("content").equals("")) {
                where += " AND content LIKE '%" + Request.get("content") + "%' ";
            }
            if (!Request.get("respondent").equals("")) {
                where += " AND respondent LIKE '%" + Request.get("respondent") + "%' ";
            }
            if (ac.equals("list_commenter")) {
                where += " AND commenter='" + session.getAttribute("username") + "' ";
            }
            if (ac.equals("list_respondent")) {
                where += " AND respondent='" + session.getAttribute("username") + "' ";
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

            view("/reply/" + ac + ".jsp");
            return;
        } else if (ac.equals("add")) {
            if (ac.equals("add") && !checkLogin()) {
                showError("not logged in");
                return;
            }

            int id = Request.getInt("id");
            Message readMap = new MessageServiceImpl().find(id);
            // Write the data row to the foreground jsp page
            request.setAttribute("readMap", readMap);
            view("/reply/" + ac + ".jsp");
            return;
        } else if (ac.equals("insert")) {
            // insert
            Reply post = new Reply(); // create entity class
            // Set the data from the foreground submit to the entity class
            post.setMessage_id(Request.getInt("message_id"));

            post.setName(Request.get("name"));

            post.setPhone(Request.get("phone"));

            post.setCommenter(Request.get("commenter"));

            post.setContent(Request.get("content"));

            post.setRespondent(Request.get("respondent"));

            post.setMessage_id(Request.getInt("message_id"));

            service.insert(post); // insert data
            int charuid = post.getId().intValue();

            showSuccess("Saved successfully", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
        } else if (ac.equals("updt")) {
            String id = Request.get("id");

            Reply mmm = service.findWhere("id=" + id);

            Message readMap = new MessageServiceImpl().find(mmm.getMessage_id());
            // Write the data row to the foreground jsp page
            request.setAttribute("readMap", readMap);
            assign("mmm", mmm);
            view("/reply/updt.jsp");
        } else if (ac.equals("update")) {
            // create entity class
            String charuid = request.getParameter("id");
            Reply post = service.findWhere("id=" + charuid);
            if (request.getParameter("message_id") != null) post.setMessage_id(Request.getInt("message_id"));

            if (request.getParameter("name") != null) post.setName(Request.get("name"));

            if (request.getParameter("phone") != null) post.setPhone(Request.get("phone"));

            if (request.getParameter("commenter") != null) post.setCommenter(Request.get("commenter"));

            if (request.getParameter("content") != null) post.setContent(Request.get("content"));

            if (request.getParameter("respondent") != null) post.setRespondent(Request.get("respondent"));

            service.update(post);

            showSuccess("Saved successfully", Request.get("referer"));
            // update
        } else if (ac.equals("detail")) {
            int id = Request.getInt("id");
            Reply map = service.find(id); 

            request.setAttribute("map", map); 
            view("/reply/" + ac + ".jsp");
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
