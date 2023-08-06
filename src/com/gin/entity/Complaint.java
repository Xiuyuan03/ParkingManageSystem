package com.gin.entity;

/**
 *  Entity class of complaint module
 */
public class Complaint {

    private Integer id;

    private String name;
    private String phone;
    private String content;
    private String complainant;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? "" : name.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? "" : phone.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? "" : content.trim();
    }

    public String getComplainant() {
        return complainant;
    }

    public void setComplainant(String complainant) {
        this.complainant = complainant == null ? "" : complainant.trim();
    }
}
