package com.gin.service;

import com.gin.entity.*;
import java.util.List;

public interface ChargingStandardService {
    /**
     * Query all row data
     * @return
     */
    List<ChargingStandard> selectAll();

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
    List<ChargingStandard> selectPages(int pagesize, int page, String where, String orderby);

    /**
     * Query a row by id
     * @param id
     * @return
     */
    ChargingStandard find(int id);

    /**
     * find aliases
     * @param id
     * @return
     */
    ChargingStandard selectOne(int id);

    /**
     * Query a row of data based on conditions
     * @param where
     * @return
     */
    ChargingStandard findWhere(String where);

    /**
     * findWhere alias
     * @param where
     * @return
     */
    ChargingStandard selectOneWhere(String where);

    /**
     * Update data according to id
     * @param chargingStandard     * @return
     */
    int update(ChargingStandard chargingStandard);

    /**
     * Insert data based on entity class
     * @param chargingStandard     * @return
     */
    long insert(ChargingStandard chargingStandard);

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
