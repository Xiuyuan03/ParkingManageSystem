package com.gin.service.impl;

import com.gin.dao.ICCardInfoDao;
import com.gin.dao.impl.ICCardInfoDaoImpl;
import com.gin.service.*;
import java.util.List;
import com.gin.entity.*;

public class ICCardInfoServiceImpl implements ICCardInfoService {

    private ICCardInfoDao dao = new ICCardInfoDaoImpl();

    /**
     * Query all row data
     *
     * @return
     */

    public List<ICCardInfo> selectAll() {
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

    public List<ICCardInfo> selectPages(int pagesize, int page, String where, String orderby) {
        return dao.selectPages(pagesize, page, where, orderby);
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public ICCardInfo find(int id) {
        return dao.find(id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public ICCardInfo selectOne(int id) {
        return dao.selectOne(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public ICCardInfo findWhere(String where) {
        return dao.findWhere(where);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public ICCardInfo selectOneWhere(String where) {
        return dao.selectOneWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param iCCardInfo     * @return
     */

    public int update(ICCardInfo iCCardInfo) {
        return dao.update(iCCardInfo);
    }

    /**
     * Insert data based on entity class
     *
     * @param iCCardInfo     * @return
     */

    public long insert(ICCardInfo iCCardInfo) {
        return dao.insert(iCCardInfo);
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
