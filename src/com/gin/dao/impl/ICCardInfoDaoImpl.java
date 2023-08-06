package com.gin.dao.impl;

import com.gin.dao.*;
import com.gin.entity.ICCardInfo;
import com.gin.util.DBUtil;
import com.gin.util.StringUtil;
import com.jntoo.db.DB;
import java.sql.*;
import java.util.*;

public class ICCardInfoDaoImpl implements ICCardInfoDao {

    /**
     * Query all row data
     *
     * @return
     */

    public List<ICCardInfo> selectAll() {
        return DB.select("SELECT * FROM ic_card_info", ICCardInfo.class);
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
        Map<String, String> map = DB.find("SELECT COUNT(*) as count FROM ic_card_info WHERE " + (where));
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

    public List<ICCardInfo> selectPages(int pagesize, int page, String where, String orderby) {
        int offset = (page - 1) * pagesize; // pagination position
        String sql = "SELECT * FROM ic_card_info " + "WHERE " + where + " ORDER BY " + orderby + " " + "LIMIT " + offset + "," + pagesize;

        List<ICCardInfo> list = DB.select(sql, ICCardInfo.class);
        return list;
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public ICCardInfo find(int id) {
        return DB.find("SELECT * FROM ic_card_info WHERE id=?", ICCardInfo.class, id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public ICCardInfo selectOne(int id) {
        return find(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public ICCardInfo findWhere(String where) {
        if (StringUtil.isNullOrEmpty(where)) {
            where = "1=1";
        }
        return DB.find("SELECT * FROM ic_card_info WHERE " + where, ICCardInfo.class);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public ICCardInfo selectOneWhere(String where) {
        return findWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param icCardInfo     * @return
     */

    public int update(ICCardInfo icCardInfo) {
        if (icCardInfo.getId() == null) {
            return -1;
        }

        String sql = "UPDATE ic_card_info SET ";
        List<String> tmpList = new ArrayList();
        List<Object> values = new ArrayList();

        // Write the data to the database if it is not null
        if (icCardInfo.getSerial_number() != null) {
            tmpList.add("serial_number=?");
            values.add(icCardInfo.getSerial_number());
        }
        if (icCardInfo.getCard_number() != null) {
            tmpList.add("card_number=?");
            values.add(icCardInfo.getCard_number());
        }
        if (icCardInfo.getCardholder() != null) {
            tmpList.add("cardholder=?");
            values.add(icCardInfo.getCardholder());
        }
        if (icCardInfo.getPhone() != null) {
            tmpList.add("phone=?");
            values.add(icCardInfo.getPhone());
        }
        if (icCardInfo.getCard_balance() != null) {
            tmpList.add("card_balance=?");
            values.add(icCardInfo.getCard_balance());
        }
        if (icCardInfo.getOperator() != null) {
            tmpList.add("operator=?");
            values.add(icCardInfo.getOperator());
        }

        sql += StringUtil.join(" , ", tmpList); // Write these lists into the sql statement
        sql += " WHERE id=? ";
        values.add(icCardInfo.getId());

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
     * @param icCardInfo     * @return
     */

    public long insert(ICCardInfo icCardInfo) {
        Connection conn = DBUtil.getConn();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int result = -1;

        try {
            String sql = "INSERT INTO ic_card_info(serial_number,card_number,cardholder,phone,card_balance,operator) VALUES (?,?,?,?,?,?)";
            System.out.printf(sql);
            statement = conn.prepareStatement(sql, 1);
            statement.setObject(1, icCardInfo.getSerial_number());
            statement.setObject(2, icCardInfo.getCard_number());
            statement.setObject(3, icCardInfo.getCardholder());
            statement.setObject(4, icCardInfo.getPhone());
            statement.setObject(5, icCardInfo.getCard_balance());
            statement.setObject(6, icCardInfo.getOperator());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            resultSet.next();
            result = resultSet.getInt(1);
            icCardInfo.setId(result);
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
        return DB.execute("DELETE FROM ic_card_info WHERE id in(" + StringUtil.join(",", ids) + ")");
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return DB.execute("DELETE FROM ic_card_info WHERE id='" + id + "'");
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return DB.execute("DELETE FROM ic_card_info WHERE " + where);
    }
}
