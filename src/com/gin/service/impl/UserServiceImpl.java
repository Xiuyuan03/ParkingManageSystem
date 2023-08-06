package com.gin.service.impl;

import com.gin.dao.UserDao;
import com.gin.dao.impl.UserDaoImpl;
import com.gin.service.*;
import java.util.List;
import com.gin.entity.*;

public class UserServiceImpl implements UserService {

    private UserDao dao = new UserDaoImpl();

    public User login(String username, String password) {
        return dao.findWhere("account='" + username + "' AND password='" + password + "'");
    }

    public boolean editPassword(Object id, String newPassword) {
        User user = new User();
        user.setPassword(newPassword);
        user.setId(Integer.valueOf(String.valueOf(id)));
        update(user);
        return true;
    }

    /**
     * Query all row data
     *
     * @return
     */

    public List<User> selectAll() {
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

    public List<User> selectPages(int pagesize, int page, String where, String orderby) {
        return dao.selectPages(pagesize, page, where, orderby);
    }

    /**
     * Query a row by id
     *
     * @param id
     * @return
     */

    public User find(int id) {
        return dao.find(id);
    }

    /**
     * find aliases
     *
     * @param id
     * @return
     */

    public User selectOne(int id) {
        return dao.selectOne(id);
    }

    /**
     * Query a row of data based on conditions
     *
     * @param where
     * @return
     */

    public User findWhere(String where) {
        return dao.findWhere(where);
    }

    /**
     * findWhere alias
     *
     * @param where
     * @return
     */

    public User selectOneWhere(String where) {
        return dao.selectOneWhere(where);
    }

    /**
     * Update data according to id
     *
     * @param user     * @return
     */

    public int update(User user) {
        return dao.update(user);
    }

    /**
     * Insert data based on entity class
     *
     * @param user     * @return
     */

    public long insert(User user) {
        return dao.insert(user);
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
