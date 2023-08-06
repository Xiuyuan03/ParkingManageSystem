package com.gin.servlet;

import com.gin.entity.*;
import com.gin.service.*;
import com.gin.service.impl.*;
import com.gin.util.*;
import com.jntoo.db.*;
import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *   outOfParking module controller
 */
@WebServlet(value = { "/outOfParking.do" })
public class OutOfParkingServlet extends BaseServlet {

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
        OutOfParkingService service = new OutOfParkingServiceImpl();

        // Query data
        if (ac.indexOf("list") != -1) {
            String orderby = Request.get("orderby", "id"); // Obtain the orderby parameter in the browser address, sort by release time by default
            String sort = Request.get("sort", "DESC"); // Get the sort parameter in the browser address, sort by reverse order by default
            int pagesize = Request.getInt("pagesize", 12); // Obtain the sort parameter in the browser address. By default, it will be displayed in 12 lines per page
            int page = Math.max(1, Request.getInt("page", 1)); // Get current page default first page

            String where = "1=1"; // Prevent where and errors in sql statements


            if (Request.getInt("parking_id") > 0) {
                // If greater than 0, write the condition
                where += " AND parking_id='" + Request.getInt("parking_id") + "' ";
            }
            // The following is to judge whether there is input content in the search box, judge whether the front desk has filled in the relevant conditions, and write the sqlsearch statement if it meets
            if (!Request.get("parking_lot_number").equals("")) {
                where += " AND parking_lot_number LIKE '%" + Request.get("parking_lot_number") + "%' ";
            }
            if (!Request.get("parking_lot_name").equals("")) {
                where += " AND parking_lot_name LIKE '%" + Request.get("parking_lot_name") + "%' ";
            }

            if (!Request.get("park_time_start").equals("")) {
                where += " AND park_time >='" + Request.get("park_time_start") + "' ";
            }
            if (!Request.get("park_time_end").equals("")) {
                where += " AND park_time <= '" + Request.get("park_time_end") + "' ";
            }
            if (!Request.get("type").equals("")) {
                where += " AND type ='" + Request.get("type") + "' ";
            }

            if (!Request.get("charge_amount_start").equals("")) {
                where += " AND charge_amount >='" + Request.get("charge_amount_start") + "' ";
            }
            if (!Request.get("charge_amount_end").equals("")) {
                where += " AND charge_amount <= '" + Request.get("charge_amount_end") + "' ";
            }

            if (!Request.get("exit_time_start").equals("")) {
                where += " AND exit_time >='" + Request.get("exit_time_start") + "' ";
            }
            if (!Request.get("exit_time_end").equals("")) {
                where += " AND exit_time <= '" + Request.get("exit_time_end") + "' ";
            }

            if (!Request.get("duration_start").equals("")) {
                where += " AND duration >='" + Request.get("duration_start") + "' ";
            }
            if (!Request.get("duration_end").equals("")) {
                where += " AND duration <= '" + Request.get("duration_end") + "' ";
            }
            if (ac.equals("list_parking_person")) {
                where += " AND parking_person='" + session.getAttribute("username") + "' ";
            }

            // get row count
            long count = service.count(where);
            // Create paging information
            new Collect(count, pagesize, page);
            // Paginate and query data
            List list = service.selectPages(pagesize, page, where, orderby + " " + sort);

            Map total = DB.name("outOfParking").field("(sum(amount)) sum_amount").where(where).find();
            request.setAttribute("total", total);

            request.setAttribute("list", list);

            request.setAttribute("orderby", orderby);
            request.setAttribute("sort", sort);
            request.setAttribute("pagesize", pagesize);

            view("/outOfParking/" + ac + ".jsp");
            return;
        } else if (ac.equals("add")) { // outOfParking添加页面视图
            if (ac.equals("add") && !checkLogin()) {
                showError("not logged in");
                return;
            }

            int id = Request.getInt("id"); // 根据id 获取停车模块中的数据
            Parking readMap = new ParkingServiceImpl().find(id);
            // Write the data row to the foreground jsp page
            request.setAttribute("readMap", readMap);
            view("/outOfParking/" + ac + ".jsp");
            return;
        } else if (ac.equals("insert")) {
            // insert
            OutOfParking post = new OutOfParking(); // create entity class
            // Set the data from the foreground submit to the entity class
            post.setParking_id(Request.getInt("parking_id"));

            post.setParking_lot_information_id(Request.getInt("parking_lot_information_id"));

            post.setParking_lot_number(Request.get("parking_lot_number"));

            post.setParking_lot_name(Request.get("parking_lot_name"));

            post.setLocation(Request.getInt("location"));

            post.setPark_time(Request.get("park_time"));

            post.setCard_number(Request.get("card_number"));

            post.setSerial_number(Request.get("serial_number"));

            post.setCardholder(Request.get("cardholder"));

            post.setPhone(Request.get("phone"));

            post.setType(Request.get("type"));

            post.setCharge_amount(Request.getDouble("charge_amount"));

            post.setVehicle_type(Request.get("vehicle_type"));

            post.setParking_space(Request.get("parking_space"));

            post.setParking_person(Request.get("parking_person"));

            post.setChuchangshijian(Request.get("exit_time"));

            post.setDuration(Request.getInt("duration"));

            post.setAmount(Request.getDouble("amount"));

            post.setParking_id(Request.getInt("parking_id"));
            post.setIs_paid(Request.get("is_paid", Request.get("is_paid", "no")));

            service.insert(post); // insert data
            int charuid = post.getId().intValue();
            DB.execute("UPDATE outOfParking SET duration=(TIMESTAMPDIFF(HOUR , park_time,exit_time)+1) WHERE id='" + charuid + "'");

            DB.execute("UPDATE outOfParking SET amount=(duration*charge_amount) WHERE id='" + charuid + "'");

            showSuccess("Saved successfully", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
        } else if (ac.equals("updt")) {
            String id = Request.get("id");

            OutOfParking mmm = service.findWhere("id=" + id);
            // 根据mmm.Parking_id 获取停车模块中的数据
            Parking readMap = new ParkingServiceImpl().find(mmm.getParking_id());
            // Write the data row to the foreground jsp page
            request.setAttribute("readMap", readMap);
            assign("mmm", mmm);
            view("/outOfParking/updt.jsp");
        } else if (ac.equals("update")) {
            // create entity class
            String charuid = request.getParameter("id");
            OutOfParking post = service.findWhere("id=" + charuid);
            if (request.getParameter("parking_id") != null) post.setParking_id(Request.getInt("parking_id"));

            if (request.getParameter("parking_lot_information_id") != null) post.setParking_lot_information_id(Request.getInt("parking_lot_information_id"));

            if (request.getParameter("parking_lot_number") != null) post.setParking_lot_number(Request.get("parking_lot_number"));

            if (request.getParameter("parking_lot_name") != null) post.setParking_lot_name(Request.get("parking_lot_name"));

            if (request.getParameter("location") != null) post.setLocation(Request.getInt("location"));

            if (request.getParameter("park_time") != null) post.setPark_time(Request.get("park_time"));

            if (request.getParameter("card_number") != null) post.setCard_number(Request.get("card_number"));

            if (request.getParameter("serial_number") != null) post.setSerial_number(Request.get("serial_number"));

            if (request.getParameter("cardholder") != null) post.setCardholder(Request.get("cardholder"));

            if (request.getParameter("phone") != null) post.setPhone(Request.get("phone"));

            if (request.getParameter("type") != null) post.setType(Request.get("type"));

            if (request.getParameter("charge_amount") != null) post.setCharge_amount(Request.getDouble("charge_amount"));

            if (request.getParameter("vehicle_type") != null) post.setVehicle_type(Request.get("vehicle_type"));

            if (request.getParameter("parking_space") != null) post.setParking_space(Request.get("parking_space"));

            if (request.getParameter("parking_person") != null) post.setParking_person(Request.get("parking_person"));

            if (request.getParameter("exit_time") != null) post.setChuchangshijian(Request.get("exit_time"));

            if (request.getParameter("duration") != null) post.setDuration(Request.getInt("duration"));

            if (request.getParameter("amount") != null) post.setAmount(Request.getDouble("amount"));

            service.update(post);

            DB.execute("UPDATE outOfParking SET duration=(TIMESTAMPDIFF(HOUR , park_time,exit_time)+1) WHERE id='" + request.getParameter("id") + "'");

            DB.execute("UPDATE outOfParking SET amount=(duration*charge_amount) WHERE id='" + request.getParameter("id") + "'");

            showSuccess("Saved successfully", Request.get("referer"));
            // update
        } else if (ac.equals("detail")) {
            int id = Request.getInt("id");
            OutOfParking map = service.find(id); 

            request.setAttribute("map", map); 
            view("/outOfParking/" + ac + ".jsp");
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
