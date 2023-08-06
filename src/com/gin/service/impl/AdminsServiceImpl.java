package com.gin.service.impl;

import com.gin.dao.*;
import com.gin.dao.impl.*;
import com.gin.entity.*;
import com.gin.service.*;
import java.util.List;

public class AdminsServiceImpl implements AdminsService {

    private AdminsDao dao = new AdminsDaoImpl();

    public Admins login(String username, String password) {
        return dao.findWhere("username='" + username + "' AND pwd='" + password + "'");
    }

    public boolean editPassword(Object id, String newPassword) {
        Admins admins = new Admins();
        admins.setPwd(newPassword);
        admins.setId(Integer.valueOf(String.valueOf(id)));
        update(admins);
        return true;
    }

    /**
     * Query all row data
     *
     * @return
     */

    public List<Admins> selectAll() {
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

    public List<Admins> selectPages(int pagesize, int page, String where, String orderby) {
        return dao.selectPages(pagesize, page, where, orderby);
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public Admins find(int id) {
        return dao.find(id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public Admins selectOne(int id) {
        return dao.selectOne(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public Admins findWhere(String where) {
        return dao.findWhere(where);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public Admins selectOneWhere(String where) {
        return dao.selectOneWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param admins     * @return
     */

    public int update(Admins admins) {
        return dao.update(admins);
    }

    /**
     * Insert data based on entity class
     *
     * @param admins     * @return
     */

    public long insert(Admins admins) {
        return dao.insert(admins);
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
