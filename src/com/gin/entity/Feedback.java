package com.gin.entity;

/**
 *  Entity class of feedback module
 */
public class Feedback {

    private Integer id;

    private Integer complaint_id;
    private String name;
    private String phone;
    private String complainant;
    private String content;
    private String feedback_person;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getComplaint_id() {
        return complaint_id;
    }

    public void setComplaint_id(Integer complaint_id) {
        this.complaint_id = complaint_id == null ? 0 : complaint_id;
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

    public String getComplainant() {
        return complainant;
    }

    public void setComplainant(String complainant) {
        this.complainant = complainant == null ? "" : complainant.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? "" : content.trim();
    }

    public String getFeedback_person() {
        return feedback_person;
    }

    public void setFeedback_person(String feedback_person) {
        this.feedback_person = feedback_person == null ? "" : feedback_person.trim();
    }
}
