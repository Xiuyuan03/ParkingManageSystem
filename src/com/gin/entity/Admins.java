package com.gin.entity;

import java.io.Serializable;
import java.util.Date;

/**
 *  administrator模块的实体类
 */
public class Admins {

    private Integer id;

    private String username;
    private String pwd;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? "" : username.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? "" : pwd.trim();
    }
}
