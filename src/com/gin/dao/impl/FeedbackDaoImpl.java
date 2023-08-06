package com.gin.dao.impl;

import com.gin.dao.*;
import com.gin.entity.*;
import com.gin.util.DBUtil;
import com.gin.util.StringUtil;
import com.jntoo.db.DB;
import java.sql.*;
import java.util.*;

public class FeedbackDaoImpl implements FeedbackDao {

    /**
     * Query all row data
     *
     * @return
     */

    public List<Feedback> selectAll() {
        return DB.select("SELECT * FROM feedback", Feedback.class);
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
        Map<String, String> map = DB.find("SELECT COUNT(*) as count FROM feedback WHERE " + (where));
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

    public List<Feedback> selectPages(int pagesize, int page, String where, String orderby) {
        int offset = (page - 1) * pagesize; // pagination position
        String sql = "SELECT * FROM feedback " + "WHERE " + where + " ORDER BY " + orderby + " " + "LIMIT " + offset + "," + pagesize;

        List<Feedback> list = DB.select(sql, Feedback.class);
        return list;
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public Feedback find(int id) {
        return DB.find("SELECT * FROM feedback WHERE id=?", Feedback.class, id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public Feedback selectOne(int id) {
        return find(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public Feedback findWhere(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        return DB.find("SELECT * FROM feedback WHERE " + where, Feedback.class);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public Feedback selectOneWhere(String where) {
        return findWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param feedback     * @return
     */

    public int update(Feedback feedback) {
        if (feedback.getId() == null) {
            return -1;
        }

        String sql = "UPDATE feedback SET ";
        List<String> tmpList = new ArrayList();
        List<Object> values = new ArrayList();

        // Write the data to the database if it is not null
        if (feedback.getComplaint_id() != null) {
            tmpList.add("complaint_id=?");
            values.add(feedback.getComplaint_id());
        }
        if (feedback.getName() != null) {
            tmpList.add("name=?");
            values.add(feedback.getName());
        }
        if (feedback.getPhone() != null) {
            tmpList.add("phone=?");
            values.add(feedback.getPhone());
        }
        if (feedback.getComplainant() != null) {
            tmpList.add("complainant=?");
            values.add(feedback.getComplainant());
        }
        if (feedback.getContent() != null) {
            tmpList.add("content=?");
            values.add(feedback.getContent());
        }
        if (feedback.getFeedback_person() != null) {
            tmpList.add("feedback_person=?");
            values.add(feedback.getFeedback_person());
        }

        sql += StringUtil.join(" , ", tmpList); // Write these lists into the sql statement
        sql += " WHERE id=? ";
        values.add(feedback.getId());

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
     * @param feedback     * @return
     */

    public long insert(Feedback feedback) {
        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int result = -1;

        try {
            String sql = "INSERT INTO feedback(complaint_id,name,phone,complainant,content,feedback_person) VALUES (?,?,?,?,?,?)";
            System.out.printf(sql);
            statement = conn.prepareStatement(sql, 1);
            statement.setObject(1, feedback.getComplaint_id());
            statement.setObject(2, feedback.getName());
            statement.setObject(3, feedback.getPhone());
            statement.setObject(4, feedback.getComplainant());
            statement.setObject(5, feedback.getContent());
            statement.setObject(6, feedback.getFeedback_person());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            resultSet.next();
            result = resultSet.getInt(1);
            feedback.setId(result);
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
        return DB.execute("DELETE FROM feedback WHERE id in(" + StringUtil.join(",", ids) + ")");
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return DB.execute("DELETE FROM feedback WHERE id='" + id + "'");
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return DB.execute("DELETE FROM feedback WHERE " + where);
    }
}
