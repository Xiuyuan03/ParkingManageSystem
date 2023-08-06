package com.gin.dao;

import com.gin.entity.ICCardInfo;

import java.util.*;

public interface ICCardInfoDao {
    /**
     * Query all row data
     * @return
     */
    List<ICCardInfo> selectAll();

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
    List<ICCardInfo> selectPages(int pagesize, int page, String where, String orderby);

    /**
     * Query a row by id
     * @param id
     * @return
     */
    ICCardInfo find(int id);

    /**
     * find aliases
     * @param id
     * @return
     */
    ICCardInfo selectOne(int id);

    /**
     * Query a row of data based on conditions
     * @param where
     * @return
     */
    ICCardInfo findWhere(String where);

    /**
     * findWhere alias
     * @param where
     * @return
     */
    ICCardInfo selectOneWhere(String where);

    /**
     * Update data according to id
     * @param icCardInfo     * @return
     */
    int update(ICCardInfo icCardInfo);

    /**
     * Insert data based on entity class
     * @param icCardInfo     * @return
     */
    long insert(ICCardInfo icCardInfo);

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
