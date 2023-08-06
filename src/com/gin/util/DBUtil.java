package com.gin.util;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBUtil {

    // Name database
    private static final String database = "park";
    // database account
    private static final String username = "root";
    // database password
    private static final String pwd = "wohuihuahua.0";
    // Whether it is mysql8.0 or above, if yes, change false to true
    private static final boolean isMysql8 = false; // Whether it is mysql8

    public static Connection conn = null;

    /**
     * Database link class
     * @return
     */
    public static Connection getConn() {
        try {
            if (conn == null || conn.isClosed()) {
                String connstr = getConnectString();
                conn = DriverManager.getConnection(connstr, username, pwd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static String getConnectString() {
        try {
            String connstr;
            if (!isMysql8) {
                Class.forName("com.mysql.jdbc.Driver");
                connstr = String.format("jdbc:mysql://localhost:3306/%s?useUnicode=true&characterEncoding=UTF-8&useOldAliasMetadataBehavior=true", database);
            } else {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connstr =
                        String.format(
                                "jdbc:mysql://localhost:3306/%s?useUnicode=true&characterEncoding=UTF-8&useSSL=FALSE&serverTimezone=UTC&useOldAliasMetadataBehavior=true",
                                database
                        );
            }
            return connstr;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * execute sql statement
     * @param sql
     * @return
     */
    public static long execute(String sql) {
        long autoInsertId = -1;
        Statement st = null;
        ResultSet rs = null;
        try {
            st = getConn().createStatement();
            st.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            rs = st.getGeneratedKeys();
            while (rs.next()) {
                autoInsertId = rs.getLong(1);
            }
            System.out.println(sql);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            //e.printStackTrace();
            log(e, sql);
        } finally {
            release(st, rs);
        }
        return autoInsertId;
    }

    /**
     * Get a row of data according to the sql statement
     * @param sql
     * @return
     */
    public static Map find(String sql) {
        HashMap map = new HashMap();

        //List<HashMap> list = new ArrayList();
        Statement st = null;
        ResultSet rs = null;
        try {
            st = getConn().createStatement();
            rs = st.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
                //HashMap map = new HashMap();
                int i = rsmd.getColumnCount();
                for (int j = 1; j <= i; j++) {
                    if (!rsmd.getColumnName(j).equals("ID")) {
                        String str = rs.getString(j) == null ? "" : rs.getString(j);
                        if (str.equals("null")) str = "";
                        map.put(rsmd.getColumnName(j), str);
                    } else map.put("id", rs.getString(j));
                }
                break;
            }
            System.out.println(sql);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            //e.printStackTrace();
            log(e, sql);
        } finally {
            release(st, rs);
        }
        return map;
    }

    /**
     * Get data rows based on SQL statements
     * @param sql
     * @return
     */
    public static List<Map> select(String sql) {
        List<Map> list = new ArrayList();
        Statement st = null;
        ResultSet rs = null;
        try {
            st = getConn().createStatement();
            rs = st.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();

            while (rs.next()) {
                HashMap map = new HashMap();
                int i = rsmd.getColumnCount();
                for (int j = 1; j <= i; j++) {
                    if (!rsmd.getColumnName(j).equals("ID")) {
                        String str = rs.getString(j) == null ? "" : rs.getString(j);
                        if (str.equals("null")) str = "";
                        map.put(rsmd.getColumnName(j), str);
                    } else map.put("id", rs.getString(j));
                }
                list.add(map);
            }
            System.out.println(sql);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            log(e, sql);
            //e.printStackTrace();
        } finally {
            release(st, rs);
        }
        return list;
    }

    public static void release(Statement st, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void log(SQLException e, String sql) {
        int code = e.getErrorCode();
        String message = e.getMessage();
        String errorMessage = String.format("SQL execute Error sql: \n%s\nMessage:%s", sql, message);
        System.err.println(errorMessage);
    }
}
