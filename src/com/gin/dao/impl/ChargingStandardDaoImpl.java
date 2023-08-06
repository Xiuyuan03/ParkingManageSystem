package com.gin.dao.impl;

import com.gin.dao.ChargingStandardDao;
import com.gin.entity.ChargingStandard;
import com.gin.util.DBUtil;
import com.gin.util.StringUtil;
import com.jntoo.db.DB;
import java.sql.*;
import java.util.*;

public class ChargingStandardDaoImpl implements ChargingStandardDao {

    /**
     * Query all row data
     *
     * @return
     */

    public List<ChargingStandard> selectAll() {
        return DB.select("SELECT * FROM charging_standards", ChargingStandard.class);
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
        Map<String, String> map = DB.find("SELECT COUNT(*) as count FROM charging_standards WHERE " + (where));
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

    public List<ChargingStandard> selectPages(int pagesize, int page, String where, String orderby) {
        int offset = (page - 1) * pagesize; // pagination position
        String sql = "SELECT * FROM charging_standards " + "WHERE " + where + " ORDER BY " + orderby + " " + "LIMIT " + offset + "," + pagesize;

        List<ChargingStandard> list = DB.select(sql, ChargingStandard.class);
        return list;
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public ChargingStandard find(int id) {
        return DB.find("SELECT * FROM charging_standards WHERE id=?", ChargingStandard.class, id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public ChargingStandard selectOne(int id) {
        return find(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public ChargingStandard findWhere(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        return DB.find("SELECT * FROM charging_standards WHERE " + where, ChargingStandard.class);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public ChargingStandard selectOneWhere(String where) {
        return findWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param chargingStandard     * @return
     */

    public int update(ChargingStandard chargingStandard) {
        if (chargingStandard.getId() == null) {
            return -1;
        }

        String sql = "UPDATE charging_standards SET ";
        List<String> tmpList = new ArrayList();
        List<Object> values = new ArrayList();

        // Write the data to the database if it is not null
        if (chargingStandard.getType() != null) {
            tmpList.add("type=?");
            values.add(chargingStandard.getType());
        }
        if (chargingStandard.getAmount() != null) {
            tmpList.add("amount=?");
            values.add(chargingStandard.getAmount());
        }

        sql += StringUtil.join(" , ", tmpList); // Write these lists into the sql statement
        sql += " WHERE id=? ";
        values.add(chargingStandard.getId());

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
     * @param chargingStandard     * @return
     */

    public long insert(ChargingStandard chargingStandard) {
        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int result = -1;

        try {
            String sql = "INSERT INTO charging_standards(type,amount) VALUES (?,?)";
            System.out.printf(sql);
            statement = conn.prepareStatement(sql, 1);
            statement.setObject(1, chargingStandard.getType());
            statement.setObject(2, chargingStandard.getAmount());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            resultSet.next();
            result = resultSet.getInt(1);
            chargingStandard.setId(result);
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
        return DB.execute("DELETE FROM charging_standards WHERE id in(" + StringUtil.join(",", ids) + ")");
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return DB.execute("DELETE FROM charging_standards WHERE id='" + id + "'");
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return DB.execute("DELETE FROM charging_standards WHERE " + where);
    }
}
