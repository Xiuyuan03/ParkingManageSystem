package com.gin.dao.impl;

import com.gin.dao.*;
import com.gin.util.DBUtil;
import com.gin.util.StringUtil;
import com.jntoo.db.DB;
import java.sql.*;
import java.util.*;
import com.gin.entity.*;

public class UserDaoImpl implements UserDao {

    /**
     * Query all row data
     *
     * @return
     */

    public List<User> selectAll() {
        return DB.select("SELECT * FROM user", User.class);
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
        Map<String, String> map = DB.find("SELECT COUNT(*) as count FROM user WHERE " + (where));
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

    public List<User> selectPages(int pagesize, int page, String where, String orderby) {
        int offset = (page - 1) * pagesize; // pagination position
        String sql = "SELECT * FROM user " + "WHERE " + where + " ORDER BY " + orderby + " " + "LIMIT " + offset + "," + pagesize;

        List<User> list = DB.select(sql, User.class);
        return list;
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public User find(int id) {
        return DB.find("SELECT * FROM user WHERE id=?", User.class, id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public User selectOne(int id) {
        return find(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public User findWhere(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        return DB.find("SELECT * FROM user WHERE " + where, User.class);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public User selectOneWhere(String where) {
        return findWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param user     * @return
     */

    public int update(User user) {
        if (user.getId() == null) {
            return -1;
        }

        String sql = "UPDATE user SET ";
        List<String> tmpList = new ArrayList();
        List<Object> values = new ArrayList();

        // Write the data to the database if it is not null
        if (user.getAccount() != null) {
            tmpList.add("account=?");
            values.add(user.getAccount());
        }
        if (user.getPassword() != null) {
            tmpList.add("password=?");
            values.add(user.getPassword());
        }
        if (user.getName() != null) {
            tmpList.add("name=?");
            values.add(user.getName());
        }
        if (user.getSex() != null) {
            tmpList.add("sex=?");
            values.add(user.getSex());
        }
        if (user.getPhone() != null) {
            tmpList.add("phone=?");
            values.add(user.getPhone());
        }
        if (user.getEmail() != null) {
            tmpList.add("email=?");
            values.add(user.getEmail());
        }
        if (user.getId_card() != null) {
            tmpList.add("id_card=?");
            values.add(user.getId_card());
        }

        sql += StringUtil.join(" , ", tmpList); // Write these lists into the sql statement
        sql += " WHERE id=? ";
        values.add(user.getId());

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
     * @param user     * @return
     */

    public long insert(User user) {
        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int result = -1;

        try {
            String sql = "INSERT INTO user(account,password,name,sex,phone,email,id_card) VALUES (?,?,?,?,?,?,?)";
            System.out.printf(sql);
            statement = conn.prepareStatement(sql, 1);
            statement.setObject(1, user.getAccount());
            statement.setObject(2, user.getPassword());
            statement.setObject(3, user.getName());
            statement.setObject(4, user.getSex());
            statement.setObject(5, user.getPhone());
            statement.setObject(6, user.getEmail());
            statement.setObject(7, user.getId_card());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            resultSet.next();
            result = resultSet.getInt(1);
            user.setId(result);
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
        return DB.execute("DELETE FROM user WHERE id in(" + StringUtil.join(",", ids) + ")");
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return DB.execute("DELETE FROM user WHERE id='" + id + "'");
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return DB.execute("DELETE FROM user WHERE " + where);
    }
}
