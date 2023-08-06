package com.gin.dao.impl;

import com.gin.dao.*;
import com.gin.entity.*;
import com.gin.util.DBUtil;
import com.gin.util.StringUtil;
import com.jntoo.db.DB;
import java.sql.*;
import java.util.*;

public class RechargeDaoImpl implements RechargeDao {

    /**
     * Query all row data
     *
     * @return
     */

    public List<Recharge> selectAll() {
        return DB.select("SELECT * FROM recharge", Recharge.class);
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
        Map<String, String> map = DB.find("SELECT COUNT(*) as count FROM recharge WHERE " + (where));
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

    public List<Recharge> selectPages(int pagesize, int page, String where, String orderby) {
        int offset = (page - 1) * pagesize; // pagination position
        String sql = "SELECT * FROM recharge " + "WHERE " + where + " ORDER BY " + orderby + " " + "LIMIT " + offset + "," + pagesize;

        List<Recharge> list = DB.select(sql, Recharge.class);
        return list;
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public Recharge find(int id) {
        return DB.find("SELECT * FROM recharge WHERE id=?", Recharge.class, id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public Recharge selectOne(int id) {
        return find(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public Recharge findWhere(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        return DB.find("SELECT * FROM recharge WHERE " + where, Recharge.class);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public Recharge selectOneWhere(String where) {
        return findWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param recharge     * @return
     */

    public int update(Recharge recharge) {
        if (recharge.getId() == null) {
            return -1;
        }

        String sql = "UPDATE recharge SET ";
        List<String> tmpList = new ArrayList();
        List<Object> values = new ArrayList();

        // Write the data to the database if it is not null
        if (recharge.getIc_card_info_id() != null) {
            tmpList.add("ic_card_info_id=?");
            values.add(recharge.getIc_card_info_id());
        }
        if (recharge.getSerial_number() != null) {
            tmpList.add("serial_number=?");
            values.add(recharge.getSerial_number());
        }
        if (recharge.getCard_number() != null) {
            tmpList.add("card_number=?");
            values.add(recharge.getCard_number());
        }
        if (recharge.getRecharge_amount() != null) {
            tmpList.add("recharge_amount=?");
            values.add(recharge.getRecharge_amount());
        }
        if (recharge.getOperator() != null) {
            tmpList.add("operator=?");
            values.add(recharge.getOperator());
        }
        if (recharge.getIs_paid() != null) {
            tmpList.add("is_paid=?");
            values.add(recharge.getIs_paid());
        }

        sql += StringUtil.join(" , ", tmpList);
        sql += " WHERE id=? ";
        values.add(recharge.getId());

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
     * @param recharge     * @return
     */

    public long insert(Recharge recharge) {
        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int result = -1;

        try {
            String sql = "INSERT INTO recharge(ic_card_info_id,serial_number,card_number,recharge_amount,operator,is_paid) VALUES (?,?,?,?,?,?)";
            System.out.printf(sql);
            statement = conn.prepareStatement(sql, 1);
            statement.setObject(1, recharge.getIc_card_info_id());
            statement.setObject(2, recharge.getSerial_number());
            statement.setObject(3, recharge.getCard_number());
            statement.setObject(4, recharge.getRecharge_amount());
            statement.setObject(5, recharge.getOperator());
            statement.setObject(6, recharge.getIs_paid());
            statement.setObject(6, recharge.getIs_paid());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            resultSet.next();
            result = resultSet.getInt(1);
            recharge.setId(result);
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
        return DB.execute("DELETE FROM recharge WHERE id in(" + StringUtil.join(",", ids) + ")");
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return DB.execute("DELETE FROM recharge WHERE id='" + id + "'");
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return DB.execute("DELETE FROM recharge WHERE " + where);
    }
}
