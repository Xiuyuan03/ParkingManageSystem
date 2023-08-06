package com.gin.dao;

import com.gin.entity.*;
import java.util.*;

public interface MessageDao {
    /**
     * Query all row data
     * @return
     */
    List<Message> selectAll();

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
    List<Message> selectPages(int pagesize, int page, String where, String orderby);

    /**
     * Query a row by id
     * @param id
     * @return
     */
    Message find(int id);

    /**
     * find aliases
     * @param id
     * @return
     */
    Message selectOne(int id);

    /**
     * Query a row of data based on conditions
     * @param where
     * @return
     */
    Message findWhere(String where);

    /**
     * findWhere alias
     * @param where
     * @return
     */
    Message selectOneWhere(String where);

    /**
     * Update data according to id
     * @param message     * @return
     */
    int update(Message message);

    /**
     * Insert data based on entity class
     * @param message     * @return
     */
    long insert(Message message);

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
