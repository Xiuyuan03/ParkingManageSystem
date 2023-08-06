package com.gin.servlet;

import com.gin.dao.*;
import com.gin.entity.*;
import com.gin.service.*;
import com.gin.service.impl.*;
import com.gin.util.*;
import com.jntoo.db.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user.do")
public class UserServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ac = request.getParameter("ac");
        if (ac == null) ac = "login";

        if (ac.equals("login")) {
            doLogin(request, response); // call login method
        } else if (ac.equals("updatePassword")) {
            doUpdatePassword(request, response);
        } else if (ac.equals("logout")) {
            session.invalidate();
            showSuccess("Log out successful", "./");
        } else {
            response.sendError(500);
        }
    }

    /**
     * Login system verification code
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("pwd");
        String cx = request.getParameter("cx");
        boolean isAdmin = request.getParameter("admin") != null;
        /**
         * verification code
         */
        String pagerandom = request.getParameter("pagerandom") == null ? "" : request.getParameter("pagerandom");

        if (username == null || "".equals(username)) {
            showError("Account is not allowed to be empty");
            return;
        }
        if (password == null || "".equals(password)) {
            showError("Password not allowed to be empty");
            return;
        }

        /**
         * Get the verification code saved in the session
         */
        String random = (String) request.getSession().getAttribute("random");

        if (!pagerandom.equals(random) && request.getParameter("a") != null) {
            request.setAttribute("error", "verification code error");
            showError("verification code error");
            return;
        }
        if (cx.equals("administrator")) {
            AdminsService service = new AdminsServiceImpl();
            Admins admins = service.login(username, password);
            if (admins == null) {
                showError("wrong user name or password");
                return;
            }
            // set the current login session
            session.setAttribute("id", admins.getId());
            session.setAttribute("login", cx);
            session.setAttribute("username", admins.getUsername());
            session.setAttribute("pwd", admins.getPwd());
            session.setAttribute("username", username);
            session.setAttribute("cx", cx);
        }
        if (cx.equals("user")) {
            UserService service = new UserServiceImpl();
            User user = service.login(username, password);
            if (user == null) {
                showError("wrong user name or password");
                return;
            }
            // set the current login session
            session.setAttribute("id", user.getId());
            session.setAttribute("login", cx);
            session.setAttribute("account", user.getAccount());
            session.setAttribute("password", user.getPassword());
            session.setAttribute("name", user.getName());
            session.setAttribute("sex", user.getSex());
            session.setAttribute("phone", user.getPhone());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("id_card", user.getId_card());
            session.setAttribute("username", username);
            session.setAttribute("cx", cx);
        }

        String referer = request.getParameter("referer"); // Specify jump position
        if (referer == null) {
            if (isAdmin) {
                referer = "./main.jsp";
            } else {
                referer = "./";
            }
        }
        showSuccess("login successful", referer);
    }

    /**
     * change Password
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doUpdatePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getSession().getAttribute("username").toString();
        String cx = request.getSession().getAttribute("login").toString();
        String oldPassword = Request.get("oldPassword");
        String newPwd = Request.get("newPwd");
        String newPwd2 = Request.get("newPwd2");

        if (oldPassword.equals("")) {
            showError("Please enter the original password");
            return;
        }

        if (newPwd.equals("")) {
            showError("Please enter a new password");
            return;
        }

        if (!newPwd.equals(newPwd2)) {
            showError("The two passwords do not match");
            return;
        }
        if (cx.equals("administrator")) {
            AdminsService service = new AdminsServiceImpl();
            Admins admins = service.login(username, oldPassword);
            if (admins == null) {
                showError("The original password is incorrect");
                return;
            }
            service.editPassword(admins.getId(), newPwd);
        }
        if (cx.equals("user")) {
            UserService service = new UserServiceImpl();
            User user = service.login(username, oldPassword);
            if (user == null) {
                showError("The original password is incorrect");
                return;
            }
            service.editPassword(user.getId(), newPwd);
        }
        showSuccess("change password successfully");
    }
}
