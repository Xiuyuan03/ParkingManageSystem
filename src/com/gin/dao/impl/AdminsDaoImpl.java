package com.gin.dao.impl;

import com.gin.dao.*;
import com.gin.entity.*;
import com.gin.util.DBUtil;
import com.gin.util.StringUtil;
import com.jntoo.db.DB;
import java.sql.*;
import java.util.*;

public class AdminsDaoImpl implements AdminsDao {

    /**
     * Query all row data
     *
     * @return
     */

    public List<Admins> selectAll() {
        return DB.select("SELECT * FROM admins", Admins.class);
    }

    /**
     * Query the number of rows according to the condition
     *
     * @param where
     * @return
     */

    public long count(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        Map<String, String> map = DB.find("SELECT COUNT(*) as count FROM admins WHERE " + (where));
        if (map != null) {
            return Long.valueOf(map.get("count")).longValue();
        }
        return 0;
    }

    /**
     * Query the list and paginate according to the condition
     *
     * @param pagesize
     * @param page
     * @param where
     * @param orderby
     * @return
     */

    public List<Admins> selectPages(int pagesize, int page, String where, String orderby) {
        int offset = (page - 1) * pagesize; // pagination position
        String sql = "SELECT * FROM admins " + "WHERE " + where + " ORDER BY " + orderby + " " + "LIMIT " + offset + "," + pagesize;

        List<Admins> list = DB.select(sql, Admins.class);
        return list;
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public Admins find(int id) {
        return DB.find("SELECT * FROM admins WHERE id=?", Admins.class, id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public Admins selectOne(int id) {
        return find(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public Admins findWhere(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        return DB.find("SELECT * FROM admins WHERE " + where, Admins.class);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public Admins selectOneWhere(String where) {
        return findWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param admins     * @return
     */

    public int update(Admins admins) {
        if (admins.getId() == null) {
            return -1;
        }

        String sql = "UPDATE admins SET ";
        List<String> tmpList = new ArrayList();
        List<Object> values = new ArrayList();

        // Write the data to the database if it is not null
        if (admins.getUsername() != null) {
            tmpList.add("username=?");
            values.add(admins.getUsername());
        }
        if (admins.getPwd() != null) {
            tmpList.add("pwd=?");
            values.add(admins.getPwd());
        }

        sql += StringUtil.join(" , ", tmpList); // Write these lists into the sql statement
        sql += " WHERE id=? ";
        values.add(admins.getId());

        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        int result = -1;
        try {
            System.out.printf(sql);
            statement = conn.prepareStatement(sql);
            int i = 1;
            for (Object v : values) {
                statement.setObject(i, v);
                i++;
            }
            result = statement.executeUpdate();
            DB.log(statement.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.release(statement, null);
        }
        return result;
    }

    /**
     * Insert data based on entity class
     *
     * @param admins     * @return
     */

    public long insert(Admins admins) {
        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int result = -1;

        try {
            String sql = "INSERT INTO admins(username,pwd) VALUES (?,?)";
            System.out.printf(sql);
            statement = conn.prepareStatement(sql, 1);
            statement.setObject(1, admins.getUsername());
            statement.setObject(2, admins.getPwd());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            resultSet.next();
            result = resultSet.getInt(1);
            admins.setId(result);
            DB.log(statement.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.release(statement, resultSet);
        }
        return result;
    }

    /**
     * Delete data row according to list id
     *
     * @param ids
     * @return
     */

    public int delete(List ids) {
        return DB.execute("DELETE FROM admins WHERE id in(" + StringUtil.join(",", ids) + ")");
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return DB.execute("DELETE FROM admins WHERE id='" + id + "'");
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return DB.execute("DELETE FROM admins WHERE " + where);
    }
}
