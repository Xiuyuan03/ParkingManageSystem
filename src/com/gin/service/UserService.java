package com.gin.service;

import com.gin.entity.User;

import java.util.List;

public interface UserService {
    User login(String username, String password);
    boolean editPassword(Object id, String newPassword);

    /**
     * Query all row data
     * @return
     */
    List<User> selectAll();

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
    List<User> selectPages(int pagesize, int page, String where, String orderby);

    /**
     * Query a row by id
     * @param id
     * @return
     */
    User find(int id);

    /**
     * find aliases
     * @param id
     * @return
     */
    User selectOne(int id);

    /**
     * Query a row of data based on conditions
     * @param where
     * @return
     */
    User findWhere(String where);

    /**
     * findWhere alias
     * @param where
     * @return
     */
    User selectOneWhere(String where);

    /**
     * Update data according to id
     * @param user     * @return
     */
    int update(User user);

    /**
     * Insert data based on entity class
     * @param user     * @return
     */
    long insert(User user);

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
