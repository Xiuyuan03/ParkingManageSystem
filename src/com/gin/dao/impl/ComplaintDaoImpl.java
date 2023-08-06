package com.gin.dao.impl;

import com.gin.dao.*;
import com.gin.entity.Complaint;
import com.gin.util.DBUtil;
import com.gin.util.StringUtil;
import com.jntoo.db.DB;
import java.sql.*;
import java.util.*;

public class ComplaintDaoImpl implements ComplaintDao {

    /**
     * Query all row data
     *
     * @return
     */

    public List<Complaint> selectAll() {
        return DB.select("SELECT * FROM complaint", Complaint.class);
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
        Map<String, String> map = DB.find("SELECT COUNT(*) as count FROM complaint WHERE " + (where));
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

    public List<Complaint> selectPages(int pagesize, int page, String where, String orderby) {
        int offset = (page - 1) * pagesize; // pagination position
        String sql = "SELECT * FROM complaint " + "WHERE " + where + " ORDER BY " + orderby + " " + "LIMIT " + offset + "," + pagesize;

        List<Complaint> list = DB.select(sql, Complaint.class);
        return list;
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public Complaint find(int id) {
        return DB.find("SELECT * FROM complaint WHERE id=?", Complaint.class, id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public Complaint selectOne(int id) {
        return find(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public Complaint findWhere(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        return DB.find("SELECT * FROM complaint WHERE " + where, Complaint.class);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public Complaint selectOneWhere(String where) {
        return findWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param complaint     * @return
     */

    public int update(Complaint complaint) {
        if (complaint.getId() == null) {
            return -1;
        }

        String sql = "UPDATE complaint SET ";
        List<String> tmpList = new ArrayList();
        List<Object> values = new ArrayList();

        // Write the data to the database if it is not null
        if (complaint.getName() != null) {
            tmpList.add("name=?");
            values.add(complaint.getName());
        }
        if (complaint.getPhone() != null) {
            tmpList.add("phone=?");
            values.add(complaint.getPhone());
        }
        if (complaint.getContent() != null) {
            tmpList.add("content=?");
            values.add(complaint.getContent());
        }
        if (complaint.getComplainant() != null) {
            tmpList.add("complainant=?");
            values.add(complaint.getComplainant());
        }

        sql += StringUtil.join(" , ", tmpList); // Write these lists into the sql statement
        sql += " WHERE id=? ";
        values.add(complaint.getId());

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
     * @param complaint     * @return
     */

    public long insert(Complaint complaint) {
        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int result = -1;

        try {
            String sql = "INSERT INTO complaint(name,phone,content,complainant) VALUES (?,?,?,?)";
            System.out.printf(sql);
            statement = conn.prepareStatement(sql, 1);
            statement.setObject(1, complaint.getName());
            statement.setObject(2, complaint.getPhone());
            statement.setObject(3, complaint.getContent());
            statement.setObject(4, complaint.getComplainant());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            resultSet.next();
            result = resultSet.getInt(1);
            complaint.setId(result);
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
        return DB.execute("DELETE FROM complaint WHERE id in(" + StringUtil.join(",", ids) + ")");
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return DB.execute("DELETE FROM complaint WHERE id='" + id + "'");
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return DB.execute("DELETE FROM complaint WHERE " + where);
    }
}
