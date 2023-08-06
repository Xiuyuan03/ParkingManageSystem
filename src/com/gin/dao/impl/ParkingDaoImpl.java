package com.gin.dao.impl;

import com.gin.dao.*;
import com.gin.entity.*;
import com.gin.util.DBUtil;
import com.gin.util.StringUtil;
import com.jntoo.db.DB;
import java.sql.*;
import java.util.*;

public class ParkingDaoImpl implements ParkingDao {

    /**
     * Query all row data
     *
     * @return
     */

    public List<Parking> selectAll() {
        return DB.select("SELECT * FROM parking", Parking.class);
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
        Map<String, String> map = DB.find("SELECT COUNT(*) as count FROM parking WHERE " + (where));
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

    public List<Parking> selectPages(int pagesize, int page, String where, String orderby) {
        int offset = (page - 1) * pagesize; // pagination position
        String sql = "SELECT * FROM parking " + "WHERE " + where + " ORDER BY " + orderby + " " + "LIMIT " + offset + "," + pagesize;

        List<Parking> list = DB.select(sql, Parking.class);
        return list;
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public Parking find(int id) {
        return DB.find("SELECT * FROM parking WHERE id=?", Parking.class, id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public Parking selectOne(int id) {
        return find(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public Parking findWhere(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        return DB.find("SELECT * FROM parking WHERE " + where, Parking.class);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public Parking selectOneWhere(String where) {
        return findWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param parking     * @return
     */

    public int update(Parking parking) {
        if (parking.getId() == null) {
            return -1;
        }

        String sql = "UPDATE parking SET ";
        List<String> tmpList = new ArrayList();
        List<Object> values = new ArrayList();

        // Write the data to the database if it is not null
        if (parking.getParking_lot_information_id() != null) {
            tmpList.add("parking_lot_information_id=?");
            values.add(parking.getParking_lot_information_id());
        }
        if (parking.getParking_lot_number() != null) {
            tmpList.add("parking_lot_number=?");
            values.add(parking.getParking_lot_number());
        }
        if (parking.getParking_lot_name() != null) {
            tmpList.add("parking_lot_name=?");
            values.add(parking.getParking_lot_name());
        }
        if (parking.getLocation() != null) {
            tmpList.add("location=?");
            values.add(parking.getLocation());
        }
        if (parking.getPark_time() != null) {
            tmpList.add("park_time=?");
            values.add(parking.getPark_time());
        }
        if (parking.getIc_card_id() != null) {
            tmpList.add("ic_card_id=?");
            values.add(parking.getIc_card_id());
        }
        if (parking.getCard_number() != null) {
            tmpList.add("card_number=?");
            values.add(parking.getCard_number());
        }
        if (parking.getChoose_type() != null) {
            tmpList.add("choose_type=?");
            values.add(parking.getChoose_type());
        }
        if (parking.getSerial_number() != null) {
            tmpList.add("serial_number=?");
            values.add(parking.getSerial_number());
        }
        if (parking.getCardholder() != null) {
            tmpList.add("cardholder=?");
            values.add(parking.getCardholder());
        }
        if (parking.getPhone() != null) {
            tmpList.add("phone=?");
            values.add(parking.getPhone());
        }
        if (parking.getType() != null) {
            tmpList.add("type=?");
            values.add(parking.getType());
        }
        if (parking.getCharge_amount() != null) {
            tmpList.add("charge_amount=?");
            values.add(parking.getCharge_amount());
        }
        if (parking.getVehicle_type() != null) {
            tmpList.add("vehicle_type=?");
            values.add(parking.getVehicle_type());
        }
        if (parking.getParking_space() != null) {
            tmpList.add("parking_space=?");
            values.add(parking.getParking_space());
        }
        if (parking.getParking_person() != null) {
            tmpList.add("parking_person=?");
            values.add(parking.getParking_person());
        }

        sql += StringUtil.join(" , ", tmpList); // Write these lists into the sql statement
        sql += " WHERE id=? ";
        values.add(parking.getId());

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
     * @param parking     * @return
     */

    public long insert(Parking parking) {
        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int result = -1;

        try {
            String sql =
                "INSERT INTO parking(parking_lot_information_id,parking_lot_number,parking_lot_name,location,park_time,ic_card_id,card_number,choose_type,serial_number,cardholder,phone,type,charge_amount,vehicle_type,parking_space,parking_person) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            System.out.printf(sql);
            statement = conn.prepareStatement(sql, 1);
            statement.setObject(1, parking.getParking_lot_information_id());
            statement.setObject(2, parking.getParking_lot_number());
            statement.setObject(3, parking.getParking_lot_name());
            statement.setObject(4, parking.getLocation());
            statement.setObject(5, parking.getPark_time());
            statement.setObject(6, parking.getIc_card_id());
            statement.setObject(7, parking.getCard_number());
            statement.setObject(8, parking.getChoose_type());
            statement.setObject(9, parking.getSerial_number());
            statement.setObject(10, parking.getCardholder());
            statement.setObject(11, parking.getPhone());
            statement.setObject(12, parking.getType());
            statement.setObject(13, parking.getCharge_amount());
            statement.setObject(14, parking.getVehicle_type());
            statement.setObject(15, parking.getParking_space());
            statement.setObject(16, parking.getParking_person());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            resultSet.next();
            result = resultSet.getInt(1);
            parking.setId(result);
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
        return DB.execute("DELETE FROM parking WHERE id in(" + StringUtil.join(",", ids) + ")");
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return DB.execute("DELETE FROM parking WHERE id='" + id + "'");
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return DB.execute("DELETE FROM parking WHERE " + where);
    }
}
