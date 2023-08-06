package com.gin.service;

import com.gin.entity.Reply;

import java.util.List;

public interface ReplyService {
    /**
     * Query all row data
     * @return
     */
    List<Reply> selectAll();

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
    List<Reply> selectPages(int pagesize, int page, String where, String orderby);

    /**
     * Query a row by id
     * @param id
     * @return
     */
    Reply find(int id);

    /**
     * find aliases
     * @param id
     * @return
     */
    Reply selectOne(int id);

    /**
     * Query a row of data based on conditions
     * @param where
     * @return
     */
    Reply findWhere(String where);

    /**
     * findWhere alias
     * @param where
     * @return
     */
    Reply selectOneWhere(String where);

    /**
     * Update data according to id
     * @param reply     * @return
     */
    int update(Reply reply);

    /**
     * Insert data based on entity class
     * @param reply     * @return
     */
    long insert(Reply reply);

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
