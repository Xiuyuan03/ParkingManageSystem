package com.gin.dao.impl;

import com.gin.dao.*;
import com.gin.entity.*;
import com.gin.util.DBUtil;
import com.gin.util.StringUtil;
import com.jntoo.db.DB;
import java.sql.*;
import java.util.*;

public class ParkingLotInformationDaoImpl implements ParkingLotInformationDao {

    /**
     * Query all row data
     *
     * @return
     */

    public List<ParkingLotInformation> selectAll() {
        return DB.select("SELECT * FROM parking_lot_information", ParkingLotInformation.class);
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
        Map<String, String> map = DB.find("SELECT COUNT(*) as count FROM parking_lot_information WHERE " + (where));
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

    public List<ParkingLotInformation> selectPages(int pagesize, int page, String where, String orderby) {
        int offset = (page - 1) * pagesize; // pagination position
        String sql = "SELECT * FROM parking_lot_information " + "WHERE " + where + " ORDER BY " + orderby + " " + "LIMIT " + offset + "," + pagesize;

        List<ParkingLotInformation> list = DB.select(sql, ParkingLotInformation.class);
        return list;
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public ParkingLotInformation find(int id) {
        return DB.find("SELECT * FROM parking_lot_information WHERE id=?", ParkingLotInformation.class, id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public ParkingLotInformation selectOne(int id) {
        return find(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public ParkingLotInformation findWhere(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        return DB.find("SELECT * FROM parking_lot_information WHERE " + where, ParkingLotInformation.class);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public ParkingLotInformation selectOneWhere(String where) {
        return findWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param parkingLotInformation     * @return
     */

    public int update(ParkingLotInformation parkingLotInformation) {
        if (parkingLotInformation.getId() == null) {
            return -1;
        }

        String sql = "UPDATE parking_lot_information SET ";
        List<String> tmpList = new ArrayList();
        List<Object> values = new ArrayList();

        // Write the data to the database if it is not null
        if (parkingLotInformation.getParking_lot_number() != null) {
            tmpList.add("parking_lot_number=?");
            values.add(parkingLotInformation.getParking_lot_number());
        }
        if (parkingLotInformation.getParking_lot_name() != null) {
            tmpList.add("parking_lot_name=?");
            values.add(parkingLotInformation.getParking_lot_name());
        }
        if (parkingLotInformation.getLocation() != null) {
            tmpList.add("location=?");
            values.add(parkingLotInformation.getLocation());
        }
        if (parkingLotInformation.getIntroduction() != null) {
            tmpList.add("introduction=?");
            values.add(parkingLotInformation.getIntroduction());
        }

        sql += StringUtil.join(" , ", tmpList); // Write these lists into the sql statement
        sql += " WHERE id=? ";
        values.add(parkingLotInformation.getId());

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
     * @param parkingLotInformation     * @return
     */

    public long insert(ParkingLotInformation parkingLotInformation) {
        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int result = -1;

        try {
            String sql = "INSERT INTO parking_lot_information(parking_lot_number,parking_lot_name,location,introduction) VALUES (?,?,?,?)";
            System.out.printf(sql);
            statement = conn.prepareStatement(sql, 1);
            statement.setObject(1, parkingLotInformation.getParking_lot_number());
            statement.setObject(2, parkingLotInformation.getParking_lot_name());
            statement.setObject(3, parkingLotInformation.getLocation());
            statement.setObject(4, parkingLotInformation.getIntroduction());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            resultSet.next();
            result = resultSet.getInt(1);
            parkingLotInformation.setId(result);
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
        return DB.execute("DELETE FROM parking_lot_information WHERE id in(" + StringUtil.join(",", ids) + ")");
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return DB.execute("DELETE FROM parking_lot_information WHERE id='" + id + "'");
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return DB.execute("DELETE FROM parking_lot_information WHERE " + where);
    }
}
