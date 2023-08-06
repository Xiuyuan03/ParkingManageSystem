package com.gin.service.impl;

import com.gin.dao.ChargingStandardDao;
import com.gin.dao.impl.*;
import com.gin.entity.ChargingStandard;
import com.gin.service.*;
import java.util.List;

public class ChargingStandardServiceImpl implements ChargingStandardService {

    private ChargingStandardDao dao = new ChargingStandardDaoImpl();

    /**
     * Query all row data
     *
     * @return
     */

    public List<ChargingStandard> selectAll() {
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

    public List<ChargingStandard> selectPages(int pagesize, int page, String where, String orderby) {
        return dao.selectPages(pagesize, page, where, orderby);
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public ChargingStandard find(int id) {
        return dao.find(id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public ChargingStandard selectOne(int id) {
        return dao.selectOne(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public ChargingStandard findWhere(String where) {
        return dao.findWhere(where);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public ChargingStandard selectOneWhere(String where) {
        return dao.selectOneWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param charging_standard     * @return
     */

    public int update(ChargingStandard charging_standard) {
        return dao.update(charging_standard);
    }

    /**
     * Insert data based on entity class
     *
     * @param charging_standard     * @return
     */

    public long insert(ChargingStandard charging_standard) {
        return dao.insert(charging_standard);
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
