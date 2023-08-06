package com.gin.dao;

import com.gin.entity.*;
import java.util.*;

public interface ParkingDao {
    /**
     * Query all row data
     * @return
     */
    List<Parking> selectAll();

    /**
     * Query the number of rows according to the condition
     * @param where
     * @return
     */
    long count(String where);

    /**
     * Query the list and paginate according to the condition
     * @param pagesize
     * @param page
     * @param where
     * @param orderby
     * @return
     */
    List<Parking> selectPages(int pagesize, int page, String where, String orderby);

    /**
     * Query a row by id
     * @param id
     * @return
     */
    Parking find(int id);

    /**
     * find aliases
     * @param id
     * @return
     */
    Parking selectOne(int id);

    /**
     * Query a row of data based on conditions
     * @param where
     * @return
     */
    Parking findWhere(String where);

    /**
     * findWhere alias
     * @param where
     * @return
     */
    Parking selectOneWhere(String where);

    /**
     * Update data according to id
     * @param parking     * @return
     */
    int update(Parking parking);

    /**
     * Insert data based on entity class
     * @param parking     * @return
     */
    long insert(Parking parking);

    /**
     * Delete data row according to list id
     * @param ids
     * @return
     */
    int delete(List ids);

    /**
     * delete row by id
     * @param id
     * @return
     */
    int delete(Object id);

    /**
     * Delete rows based on condition
     * @param where
     * @return
     */
    int deleteWhere(String where);
}
