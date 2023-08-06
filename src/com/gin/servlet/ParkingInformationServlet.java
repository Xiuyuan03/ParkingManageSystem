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
 *   parking Information module controller
 */
@WebServlet(value = { "/parkingInformation.do" })
public class ParkingInformationServlet extends BaseServlet {

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
        ParkingInformationService service = new ParkingInformationServiceImpl();

        // Query data
        if (ac.indexOf("list") != -1) {
            String orderby = Request.get("orderby", "id"); // Obtain the orderby parameter in the browser address, sort by release time by default
            String sort = Request.get("sort", "DESC"); // Get the sort parameter in the browser address, sort by reverse order by default
            int pagesize = Request.getInt("pagesize", 12); // Obtain the sort parameter in the browser address. By default, it will be displayed in 12 lines per page
            int page = Math.max(1, Request.getInt("page", 1)); // Get current page default first page

            String where = "1=1"; // Prevent where and errors in sql statements
            // The following is to judge whether there is input content in the search box, judge whether the front desk has filled in the relevant conditions, and write the sqlsearch statement if it meets
            if (!Request.get("parking_lot_number").equals("")) {
                where += " AND parking_lot_number LIKE '%" + Request.get("parking_lot_number") + "%' ";
            }
            if (!Request.get("parking_lot_name").equals("")) {
                where += " AND parking_lot_name LIKE '%" + Request.get("parking_lot_name") + "%' ";
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

            view("/parkingInformation/" + ac + ".jsp");
            return;
        } else if (ac.equals("add")) {
            if (!checkLogin()) {
                showError("not logged in");
                return;
            }

            view("/parkingInformation/" + ac + ".jsp");
            return;
        } else if (ac.equals("insert")) {
            // insert
            ParkingInformation post = new ParkingInformation(); // create entity class
            // Set the data from the foreground submit to the entity class
            post.setParking_lot_number(Request.get("parking_lot_number"));

            post.setParking_lot_name(Request.get("parking_lot_name"));

            post.setRow(Request.getInt("row"));

            post.setColumns(Request.getInt("columns"));

            service.insert(post); // insert data
            int charuid = post.getId().intValue();

            showSuccess("Saved successfully", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
        } else if (ac.equals("updt")) {
            String id = Request.get("id");

            ParkingInformation mmm = service.findWhere("id=" + id);
            assign("mmm", mmm);
            view("/parkingInformation/updt.jsp");
        } else if (ac.equals("update")) {
            // create entity class
            String charuid = request.getParameter("id");
            ParkingInformation post = service.findWhere("id=" + charuid);
            if (request.getParameter("parking_lot_number") != null) post.setParking_lot_number(Request.get("parking_lot_number"));

            if (request.getParameter("parking_lot_name") != null) post.setParking_lot_name(Request.get("parking_lot_name"));

            if (request.getParameter("row") != null) post.setRow(Request.getInt("row"));

            if (request.getParameter("columns") != null) post.setColumns(Request.getInt("columns"));

            service.update(post);

            showSuccess("Saved successfully", Request.get("referer"));
            // update
        } else if (ac.equals("detail")) {
            int id = Request.getInt("id");
            ParkingInformation map = service.find(id); 

            request.setAttribute("map", map); 
            view("/parkingInformation/" + ac + ".jsp");
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
