package com.gin.service.impl;

import com.gin.dao.*;
import com.gin.dao.impl.*;
import com.gin.entity.*;
import com.gin.service.*;
import java.util.List;

public class FeedbackServiceImpl implements FeedbackService {

    private FeedbackDao dao = new FeedbackDaoImpl();

    /**
     * Query all row data
     *
     * @return
     */

    public List<Feedback> selectAll() {
        return dao.selectAll();
    }

    /**
     * Query the number of rows according to the condition
     *
     * @param where
     * @return
     */

    public long count(String where) {
        return dao.count(where);
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

    public List<Feedback> selectPages(int pagesize, int page, String where, String orderby) {
        return dao.selectPages(pagesize, page, where, orderby);
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public Feedback find(int id) {
        return dao.find(id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public Feedback selectOne(int id) {
        return dao.selectOne(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public Feedback findWhere(String where) {
        return dao.findWhere(where);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public Feedback selectOneWhere(String where) {
        return dao.selectOneWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param feedback     * @return
     */

    public int update(Feedback feedback) {
        return dao.update(feedback);
    }

    /**
     * Insert data based on entity class
     *
     * @param feedback     * @return
     */

    public long insert(Feedback feedback) {
        return dao.insert(feedback);
    }

    /**
     * Delete data row according to list id
     *
     * @param ids
     * @return
     */

    public int delete(List ids) {
        return dao.delete(ids);
    }

    /**
     * delete row by id
     *
     * @param id
     * @return
     */

    public int delete(Object id) {
        return dao.delete(id);
    }

    /**
     * Delete rows based on condition
     *
     * @param where
     * @return
     */

    public int deleteWhere(String where) {
        return dao.deleteWhere(where);
    }
}
