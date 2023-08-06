package com.gin.dao;

import com.gin.entity.Complaint;

import java.util.*;

public interface ComplaintDao {
    /**
     * Query all row data
     * @return
     */
    List<Complaint> selectAll();

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
    List<Complaint> selectPages(int pagesize, int page, String where, String orderby);

    /**
     * Query a row by id
     * @param id
     * @return
     */
    Complaint find(int id);

    /**
     * find aliases
     * @param id
     * @return
     */
    Complaint selectOne(int id);

    /**
     * Query a row of data based on conditions
     * @param where
     * @return
     */
    Complaint findWhere(String where);

    /**
     * findWhere alias
     * @param where
     * @return
     */
    Complaint selectOneWhere(String where);

    /**
     * Update data according to id
     * @param complaint     * @return
     */
    int update(Complaint complaint);

    /**
     * Insert data based on entity class
     * @param complaint     * @return
     */
    long insert(Complaint complaint);

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
