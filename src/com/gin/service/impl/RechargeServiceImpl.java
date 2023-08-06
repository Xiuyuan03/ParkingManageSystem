package com.gin.service.impl;

import com.gin.dao.*;
import com.gin.dao.impl.*;
import com.gin.entity.*;
import com.gin.service.*;
import java.util.List;

public class RechargeServiceImpl implements RechargeService {

    private RechargeDao dao = new RechargeDaoImpl();

    /**
     * Query all row data
     *
     * @return
     */

    public List<Recharge> selectAll() {
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

    public List<Recharge> selectPages(int pagesize, int page, String where, String orderby) {
        return dao.selectPages(pagesize, page, where, orderby);
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public Recharge find(int id) {
        return dao.find(id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public Recharge selectOne(int id) {
        return dao.selectOne(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public Recharge findWhere(String where) {
        return dao.findWhere(where);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public Recharge selectOneWhere(String where) {
        return dao.selectOneWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param chongzhi     * @return
     */

    public int update(Recharge chongzhi) {
        return dao.update(chongzhi);
    }

    /**
     * Insert data based on entity class
     *
     * @param chongzhi     * @return
     */

    public long insert(Recharge chongzhi) {
        return dao.insert(chongzhi);
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
