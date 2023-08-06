package com.gin.servlet;

import com.gin.entity.ICCardInfo;
import com.gin.service.ICCardInfoService;
import com.gin.service.impl.ICCardInfoServiceImpl;
import com.gin.util.*;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *   IC card information module controller
 */
@WebServlet(value = { "/icCardInfo.do" })
public class ICCardInfoServlet extends BaseServlet {

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
        ICCardInfoService service = new ICCardInfoServiceImpl();

        // Query data
        if (ac.indexOf("list") != -1) {
            String orderby = Request.get("orderby", "id"); // Obtain the orderby parameter in the browser address, sort by release time by default
            String sort = Request.get("sort", "DESC"); // Get the sort parameter in the browser address, sort by reverse order by default
            int pagesize = Request.getInt("pagesize", 12); // Obtain the sort parameter in the browser address. By default, it will be displayed in 12 lines per page
            int page = Math.max(1, Request.getInt("page", 1)); // Get current page default first page

            String where = "1=1"; // Prevent where and errors in sql statements
            // The following is to judge whether there is input content in the search box, judge whether the front desk has filled in the relevant conditions, and write the sqlsearch statement if it meets
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

            view("/icCardInfo/" + ac + ".jsp");
            return;
        } else if (ac.equals("add")) {
            if (ac.equals("add") && !checkLogin()) {
                showError("not logged in");
                return;
            }

            view("/icCardInfo/" + ac + ".jsp");
            return;
        } else if (ac.equals("insert")) {
            // insert
            ICCardInfo post = new ICCardInfo(); // create entity class
            // Set the data from the foreground submit to the entity class
            post.setSerial_number(Request.get("serial_number"));

            post.setCard_number(Request.get("card_number"));

            post.setCardholder(Request.get("cardholder"));

            post.setPhone(Request.get("phone"));

            post.setCard_balance(Request.getDouble("card_balance"));

            post.setOperator(Request.get("operator"));

            service.insert(post); // insert data
            int insertId = post.getId().intValue();

            showSuccess("Saved successfully", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
        } else if (ac.equals("updt")) {
            String id = Request.get("id");

            ICCardInfo mmm = service.findWhere("id=" + id);
            assign("mmm", mmm);
            view("/icCardInfo/updt.jsp");
        } else if (ac.equals("update")) {
            // create entity class
            String charuid = request.getParameter("id");
            ICCardInfo post = service.findWhere("id=" + charuid);
            if (request.getParameter("serial_number") != null) post.setSerial_number(Request.get("serial_number"));

            if (request.getParameter("card_number") != null) post.setCard_number(Request.get("card_number"));

            if (request.getParameter("cardholder") != null) post.setCardholder(Request.get("cardholder"));

            if (request.getParameter("phone") != null) post.setPhone(Request.get("phone"));

            if (request.getParameter("card_balance") != null) post.setCard_balance(Request.getDouble("card_balance"));

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
