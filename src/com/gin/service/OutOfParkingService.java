package com.gin.service;

import com.gin.entity.*;
import java.util.List;

public interface OutOfParkingService {
    /**
     * Query all row data
     * @return
     */
    List<OutOfParking> selectAll();

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
    List<OutOfParking> selectPages(int pagesize, int page, String where, String orderby);

    /**
     * Query a row by id
     * @param id
     * @return
     */
    OutOfParking find(int id);

    /**
     * find aliases
     * @param id
     * @return
     */
    OutOfParking selectOne(int id);

    /**
     * Query a row of data based on conditions
     * @param where
     * @return
     */
    OutOfParking findWhere(String where);

    /**
     * findWhere alias
     * @param where
     * @return
     */
    OutOfParking selectOneWhere(String where);

    /**
     * Update data according to id
     * @param outOfParking     * @return
     */
    int update(OutOfParking outOfParking);

    /**
     * Insert data based on entity class
     * @param outOfParking     * @return
     */
    long insert(OutOfParking outOfParking);

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
