package com.gin.service.impl;

import com.gin.dao.ReplyDao;
import com.gin.dao.impl.ReplyDaoImpl;
import com.gin.entity.Reply;
import com.gin.service.*;
import java.util.List;

public class ReplyServiceImpl implements ReplyService {

    private ReplyDao dao = new ReplyDaoImpl();

    /**
     * Query all row data
     *
     * @return
     */

    public List<Reply> selectAll() {
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

    public List<Reply> selectPages(int pagesize, int page, String where, String orderby) {
        return dao.selectPages(pagesize, page, where, orderby);
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public Reply find(int id) {
        return dao.find(id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public Reply selectOne(int id) {
        return dao.selectOne(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public Reply findWhere(String where) {
        return dao.findWhere(where);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public Reply selectOneWhere(String where) {
        return dao.selectOneWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param reply     * @return
     */

    public int update(Reply reply) {
        return dao.update(reply);
    }

    /**
     * Insert data based on entity class
     *
     * @param reply     * @return
     */

    public long insert(Reply reply) {
        return dao.insert(reply);
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
