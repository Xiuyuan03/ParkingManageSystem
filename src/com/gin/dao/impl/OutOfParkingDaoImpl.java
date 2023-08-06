package com.gin.dao.impl;

import com.gin.dao.*;
import com.gin.entity.*;
import com.gin.util.DBUtil;
import com.gin.util.StringUtil;
import com.jntoo.db.DB;
import java.sql.*;
import java.util.*;

public class OutOfParkingDaoImpl implements OutOfParkingDao {

    /**
     * Query all row data
     *
     * @return
     */

    public List<OutOfParking> selectAll() {
        return DB.select("SELECT * FROM outOfParking", OutOfParking.class);
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
        Map<String, String> map = DB.find("SELECT COUNT(*) as count FROM outOfParking WHERE " + (where));
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

    public List<OutOfParking> selectPages(int pagesize, int page, String where, String orderby) {
        int offset = (page - 1) * pagesize; // pagination position
        String sql = "SELECT * FROM outOfParking " + "WHERE " + where + " ORDER BY " + orderby + " " + "LIMIT " + offset + "," + pagesize;

        List<OutOfParking> list = DB.select(sql, OutOfParking.class);
        return list;
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public OutOfParking find(int id) {
        return DB.find("SELECT * FROM outOfParking WHERE id=?", OutOfParking.class, id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public OutOfParking selectOne(int id) {
        return find(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public OutOfParking findWhere(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        return DB.find("SELECT * FROM outOfParking WHERE " + where, OutOfParking.class);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public OutOfParking selectOneWhere(String where) {
        return findWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param outOfParking     * @return
     */

    public int update(OutOfParking outOfParking) {
        if (outOfParking.getId() == null) {
            return -1;
        }

        String sql = "UPDATE outOfParking SET ";
        List<String> tmpList = new ArrayList();
        List<Object> values = new ArrayList();

        // Write the data to the database if it is not null
        if (outOfParking.getParking_id() != null) {
            tmpList.add("parking_id=?");
            values.add(outOfParking.getParking_id());
        }
        if (outOfParking.getParking_lot_information_id() != null) {
            tmpList.add("parking_lot_information_id=?");
            values.add(outOfParking.getParking_lot_information_id());
        }
        if (outOfParking.getParking_lot_number() != null) {
            tmpList.add("parking_lot_number=?");
            values.add(outOfParking.getParking_lot_number());
        }
        if (outOfParking.getParking_lot_name() != null) {
            tmpList.add("parking_lot_name=?");
            values.add(outOfParking.getParking_lot_name());
        }
        if (outOfParking.getLocation() != null) {
            tmpList.add("location=?");
            values.add(outOfParking.getLocation());
        }
        if (outOfParking.getPark_time() != null) {
            tmpList.add("park_time=?");
            values.add(outOfParking.getPark_time());
        }
        if (outOfParking.getCard_number() != null) {
            tmpList.add("card_number=?");
            values.add(outOfParking.getCard_number());
        }
        if (outOfParking.getSerial_number() != null) {
            tmpList.add("serial_number=?");
            values.add(outOfParking.getSerial_number());
        }
        if (outOfParking.getCardholder() != null) {
            tmpList.add("cardholder=?");
            values.add(outOfParking.getCardholder());
        }
        if (outOfParking.getPhone() != null) {
            tmpList.add("phone=?");
            values.add(outOfParking.getPhone());
        }
        if (outOfParking.getType() != null) {
            tmpList.add("type=?");
            values.add(outOfParking.getType());
        }
        if (outOfParking.getCharge_amount() != null) {
            tmpList.add("charge_amount=?");
            values.add(outOfParking.getCharge_amount());
        }
        if (outOfParking.getVehicle_type() != null) {
            tmpList.add("vehicle_type=?");
            values.add(outOfParking.getVehicle_type());
        }
        if (outOfParking.getParking_space() != null) {
            tmpList.add("parking_space=?");
            values.add(outOfParking.getParking_space());
        }
        if (outOfParking.getParking_person() != null) {
            tmpList.add("parking_person=?");
            values.add(outOfParking.getParking_person());
        }
        if (outOfParking.getChuchangshijian() != null) {
            tmpList.add("exit_time=?");
            values.add(outOfParking.getChuchangshijian());
        }
        if (outOfParking.getDuration() != null) {
            tmpList.add("duration=?");
            values.add(outOfParking.getDuration());
        }
        if (outOfParking.getAmount() != null) {
            tmpList.add("amount=?");
            values.add(outOfParking.getAmount());
        }
        if (outOfParking.getIs_paid() != null) {
            tmpList.add("is_paid=?");
            values.add(outOfParking.getIs_paid());
        }

        sql += StringUtil.join(" , ", tmpList); // Write these lists into the sql statement
        sql += " WHERE id=? ";
        values.add(outOfParking.getId());

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
     * @param outOfParking     * @return
     */

    public long insert(OutOfParking outOfParking) {
        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int result = -1;

        try {
            String sql =
                "INSERT INTO outOfParking(parking_id,parking_lot_information_id,parking_lot_number,parking_lot_name,location,park_time,card_number,serial_number,cardholder,phone,type,charge_amount,vehicle_type,parking_space,parking_person,exit_time,duration,amount,is_paid) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            System.out.printf(sql);
            statement = conn.prepareStatement(sql, 1);
            statement.setObject(1, outOfParking.getParking_id());
            statement.setObject(2, outOfParking.getParking_lot_information_id());
            statement.setObject(3, outOfParking.getParking_lot_number());
            statement.setObject(4, outOfParking.getParking_lot_name());
            statement.setObject(5, outOfParking.getLocation());
            statement.setObject(6, outOfParking.getPark_time());
            statement.setObject(7, outOfParking.getCard_number());
            statement.setObject(8, outOfParking.getSerial_number());
            statement.setObject(9, outOfParking.getCardholder());
            statement.setObject(10, outOfParking.getPhone());
            statement.setObject(11, outOfParking.getType());
            statement.setObject(12, outOfParking.getCharge_amount());
            statement.setObject(13, outOfParking.getVehicle_type());
            statement.setObject(14, outOfParking.getParking_space());
            statement.setObject(15, outOfParking.getParking_person());
            statement.setObject(16, outOfParking.getChuchangshijian());
            statement.setObject(17, outOfParking.getDuration());
            statement.setObject(18, outOfParking.getAmount());
            statement.setObject(19, outOfParking.getIs_paid());
            statement.setObject(19, outOfParking.getIs_paid());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            resultSet.next();
            result = resultSet.getInt(1);
            outOfParking.setId(result);
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
        return DB.execute("DELETE FROM outOfParking WHERE id in(" + StringUtil.join(",", ids) + ")");
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return DB.execute("DELETE FROM outOfParking WHERE id='" + id + "'");
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return DB.execute("DELETE FROM outOfParking WHERE " + where);
    }
}
