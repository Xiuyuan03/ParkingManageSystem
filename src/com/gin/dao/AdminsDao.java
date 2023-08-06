package com.gin.dao;

import com.gin.entity.*;
import java.util.*;

public interface AdminsDao {
    /**
     * Query all row data
     * @return
     */
    List<Admins> selectAll();

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
    List<Admins> selectPages(int pagesize, int page, String where, String orderby);

    /**
     * Query a row by id
     * @param id
     * @return
     */
    Admins find(int id);

    /**
     * find aliases
     * @param id
     * @return
     */
    Admins selectOne(int id);

    /**
     * Query a row of data based on conditions
     * @param where
     * @return
     */
    Admins findWhere(String where);

    /**
     * findWhere alias
     * @param where
     * @return
     */
    Admins selectOneWhere(String where);

    /**
     * Update data according to id
     * @param admins     * @return
     */
    int update(Admins admins);

    /**
     * Insert data based on entity class
     * @param admins     * @return
     */
    long insert(Admins admins);

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
