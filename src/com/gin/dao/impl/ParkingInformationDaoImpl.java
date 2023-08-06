package com.gin.dao.impl;

import com.gin.dao.*;
import com.gin.entity.*;
import com.gin.util.DBUtil;
import com.gin.util.StringUtil;
import com.jntoo.db.DB;
import java.sql.*;
import java.util.*;

public class ParkingInformationDaoImpl implements ParkingInformationDao {

    /**
     * Query all row data
     *
     * @return
     */

    public List<ParkingInformation> selectAll() {
        return DB.select("SELECT * FROM parking_information", ParkingInformation.class);
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
        Map<String, String> map = DB.find("SELECT COUNT(*) as count FROM parking_information WHERE " + (where));
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

    public List<ParkingInformation> selectPages(int pagesize, int page, String where, String orderby) {
        int offset = (page - 1) * pagesize; // pagination position
        String sql = "SELECT * FROM parking_information " + "WHERE " + where + " ORDER BY " + orderby + " " + "LIMIT " + offset + "," + pagesize;

        List<ParkingInformation> list = DB.select(sql, ParkingInformation.class);
        return list;
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public ParkingInformation find(int id) {
        return DB.find("SELECT * FROM parking_information WHERE id=?", ParkingInformation.class, id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public ParkingInformation selectOne(int id) {
        return find(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public ParkingInformation findWhere(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        return DB.find("SELECT * FROM parking_information WHERE " + where, ParkingInformation.class);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public ParkingInformation selectOneWhere(String where) {
        return findWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param parkinginformation     * @return
     */

    public int update(ParkingInformation parkinginformation) {
        if (parkinginformation.getId() == null) {
            return -1;
        }

        String sql = "UPDATE parking_information SET ";
        List<String> tmpList = new ArrayList();
        List<Object> values = new ArrayList();

        // Write the data to the database if it is not null
        if (parkinginformation.getParking_lot_number() != null) {
            tmpList.add("parking_lot_number=?");
            values.add(parkinginformation.getParking_lot_number());
        }
        if (parkinginformation.getParking_lot_name() != null) {
            tmpList.add("parking_lot_name=?");
            values.add(parkinginformation.getParking_lot_name());
        }
        if (parkinginformation.getRow() != null) {
            tmpList.add("row=?");
            values.add(parkinginformation.getRow());
        }
        if (parkinginformation.getColumns() != null) {
            tmpList.add("columns=?");
            values.add(parkinginformation.getColumns());
        }

        sql += StringUtil.join(" , ", tmpList); // Write these lists into the sql statement
        sql += " WHERE id=? ";
        values.add(parkinginformation.getId());

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
     * @param parkinginformation     * @return
     */

    public long insert(ParkingInformation parkinginformation) {
        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int result = -1;

        try {
            String sql = "INSERT INTO parking_information(parking_lot_number,parking_lot_name,row,columns) VALUES (?,?,?,?)";
            System.out.printf(sql);
            statement = conn.prepareStatement(sql, 1);
            statement.setObject(1, parkinginformation.getParking_lot_number());
            statement.setObject(2, parkinginformation.getParking_lot_name());
            statement.setObject(3, parkinginformation.getRow());
            statement.setObject(4, parkinginformation.getColumns());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            resultSet.next();
            result = resultSet.getInt(1);
            parkinginformation.setId(result);
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
        return DB.execute("DELETE FROM parking_information WHERE id in(" + StringUtil.join(",", ids) + ")");
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return DB.execute("DELETE FROM parking_information WHERE id='" + id + "'");
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return DB.execute("DELETE FROM parking_information WHERE " + where);
    }
}
