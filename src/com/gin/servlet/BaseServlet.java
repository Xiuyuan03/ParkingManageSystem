package com.gin.servlet;

import com.gin.util.Request;
import com.gin.util.StringUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public abstract class BaseServlet extends HttpServlet {

    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected HttpSession session;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.request = req;
        this.response = resp;
        this.session = req.getSession();
        super.service(req, resp);
    }

    /**
     * output jsp view page
     * @param url
     * @throws ServletException
     * @throws IOException
     */
    public void view(String url) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.getRequestDispatcher(url).forward(request, response);
    }

    protected void assign(String name, Object value) {
        request.setAttribute(name, value);
    }

    /**
     * Implement the pop-up window, the main code, if you need to change the style of the pop-up window, please modify it in the WebRoot\message.jsp file
     * @param message
     * @param code
     * @param jumpUrl
     * @param jumpTime
     * @return
     */
    protected String showMessage(String message, int code, String jumpUrl, int jumpTime) throws ServletException, IOException {
        assign("message", message);
        assign("code", code);
        assign("jumpUrl", jumpUrl);
        assign("jumpTime", jumpTime);
        view("/message.jsp");

        return "";
    }

    /**
     * check whether all come
     * @return
     */
    protected boolean checkLogin() {
        if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) {
            return false;
        }
        return true;
    }

    /**
     * popup error window
     * @param message
     * @return
     */
    protected String showError(String message) throws ServletException, IOException {
        return showMessage(message, 1, "javascript:history(-1);", 2250);
    }

    /**
     * popup error window
     * @param message
     * @param code
     * @return
     */
    protected String showError(String message, int code) throws ServletException, IOException {
        return showMessage(message, code, "javascript:history(-1);", 2250);
    }

    /**
     * popup error window
     * @param message
     * @param url
     * @return
     */
    protected String showError(String message, String url) throws ServletException, IOException {
        return showMessage(message, 1, url, 2250);
    }

    /**
     * popup success window
     * @param message
     * @return
     */
    protected String showSuccess(String message) throws ServletException, IOException {
        return showMessage(message, 0, request.getHeader("referer"), 2250);
    }

    /**
     * popup success window
     * @param message
     * @param url
     * @return
     */
    protected String showSuccess(String message, String url) throws ServletException, IOException {
        return showMessage(message, 0, url, 2250);
    }
}
