package com.gin.dao.impl;

import com.gin.dao.*;
import com.gin.entity.*;
import com.gin.util.DBUtil;
import com.gin.util.StringUtil;
import com.jntoo.db.DB;
import java.sql.*;
import java.util.*;

public class ReplyDaoImpl implements ReplyDao {

    /**
     * Query all row data
     *
     * @return
     */

    public List<Reply> selectAll() {
        return DB.select("SELECT * FROM reply", Reply.class);
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
        Map<String, String> map = DB.find("SELECT COUNT(*) as count FROM reply WHERE " + (where));
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

    public List<Reply> selectPages(int pagesize, int page, String where, String orderby) {
        int offset = (page - 1) * pagesize; // pagination position
        String sql = "SELECT * FROM reply " + "WHERE " + where + " ORDER BY " + orderby + " " + "LIMIT " + offset + "," + pagesize;

        List<Reply> list = DB.select(sql, Reply.class);
        return list;
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public Reply find(int id) {
        return DB.find("SELECT * FROM reply WHERE id=?", Reply.class, id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public Reply selectOne(int id) {
        return find(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public Reply findWhere(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        return DB.find("SELECT * FROM reply WHERE " + where, Reply.class);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public Reply selectOneWhere(String where) {
        return findWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param reply     * @return
     */

    public int update(Reply reply) {
        if (reply.getId() == null) {
            return -1;
        }

        String sql = "UPDATE reply SET ";
        List<String> tmpList = new ArrayList();
        List<Object> values = new ArrayList();

        // Write the data to the database if it is not null
        if (reply.getMessage_id() != null) {
            tmpList.add("message_id=?");
            values.add(reply.getMessage_id());
        }
        if (reply.getName() != null) {
            tmpList.add("name=?");
            values.add(reply.getName());
        }
        if (reply.getPhone() != null) {
            tmpList.add("phone=?");
            values.add(reply.getPhone());
        }
        if (reply.getCommenter() != null) {
            tmpList.add("commenter=?");
            values.add(reply.getCommenter());
        }
        if (reply.getContent() != null) {
            tmpList.add("content=?");
            values.add(reply.getContent());
        }
        if (reply.getRespondent() != null) {
            tmpList.add("respondent=?");
            values.add(reply.getRespondent());
        }

        sql += StringUtil.join(" , ", tmpList); // Write these lists into the sql statement
        sql += " WHERE id=? ";
        values.add(reply.getId());

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
     * @param reply     * @return
     */

    public long insert(Reply reply) {
        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int result = -1;

        try {
            String sql = "INSERT INTO reply(message_id,name,phone,commenter,content,respondent) VALUES (?,?,?,?,?,?)";
            System.out.printf(sql);
            statement = conn.prepareStatement(sql, 1);
            statement.setObject(1, reply.getMessage_id());
            statement.setObject(2, reply.getName());
            statement.setObject(3, reply.getPhone());
            statement.setObject(4, reply.getCommenter());
            statement.setObject(5, reply.getContent());
            statement.setObject(6, reply.getRespondent());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            resultSet.next();
            result = resultSet.getInt(1);
            reply.setId(result);
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
        return DB.execute("DELETE FROM reply WHERE id in(" + StringUtil.join(",", ids) + ")");
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return DB.execute("DELETE FROM reply WHERE id='" + id + "'");
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return DB.execute("DELETE FROM reply WHERE " + where);
    }
}
