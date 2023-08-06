package com.gin.util;

import com.gin.util.threadlocal.LocalRequestContextHolder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Request {

    /**
     * Get the Request of the current thread
     * @return
     */
    public static HttpServletRequest getRequest() {
        return LocalRequestContextHolder.getLocalRequestContext().getRequest();
    }

    /**
     * Get the Response of the current thread
     * @return
     */
    public static HttpServletResponse getResponse() {
        return LocalRequestContextHolder.getLocalRequestContext().getResponse();
    }

    public static HttpSession getSession() {
        return LocalRequestContextHolder.getLocalRequestContext().getSession();
    }

    /**
     * Get Url string parameter
     * @param name
     * @return
     */
    public static String get(String name) {
        String[] value = getRequest().getParameterValues(name);
        return value == null || value.length == 0 ? "" : StringUtil.join(",", value);
    }

    /**
     * Get Url string parameter
     * @param name
     * @param def default value
     * @return
     */
    public static String get(String name, String def) {
        if (def == null) {
            def = "";
        }
        String[] value = getRequest().getParameterValues(name);
        return value == null || value.length == 0 ? def : StringUtil.join(",", value);
    }

    /**
     * Get URL integer parameters
     * @param name
     * @return
     */
    public static int getInt(String name) {
        return getInt(name, 0);
    }

    /**
     * Get URL integer parameters
     * @param name
     * @param def default value
     * @return
     */
    public static int getInt(String name, int def) {
        String value = get(name, String.valueOf(def));
        return value.equals("") ? def : Integer.valueOf(value).intValue();
    }

    /**
     * Get URL floating point parameters
     * @param name
     * @return
     */
    public static double getDouble(String name) {
        return getDouble(name, 0.0f);
    }

    /**
     * Get URL floating point parameters
     * @param name
     * @param def default value
     * @return
     */
    public static double getDouble(String name, double def) {
        String value = get(name, String.valueOf(def));
        return value.equals("") ? def : Double.valueOf(value).doubleValue();
    }
}
