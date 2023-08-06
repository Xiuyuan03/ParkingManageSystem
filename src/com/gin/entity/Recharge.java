package com.gin.entity;

/**
 *  Entity class of recharge module
 */
public class Recharge {
    private Integer id;
    private Integer ic_card_info_id;
    private String serial_number;
    private String card_number;
    private Double recharge_amount;
    private String operator;
    private String is_paid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIc_card_info_id() {
        return ic_card_info_id;
    }

    public void setIc_card_info_id(Integer ic_card_info_id) {
        this.ic_card_info_id = ic_card_info_id;
    }

    public String getSerial_number() {
        return serial_number;
    }

    public void setSerial_number(String serial_number) {
        this.serial_number = serial_number;
    }

    public String getCard_number() {
        return card_number;
    }

    public void setCard_number(String card_number) {
        this.card_number = card_number;
    }

    public Double getRecharge_amount() {
        return recharge_amount;
    }

    public void setRecharge_amount(Double recharge_amount) {
        this.recharge_amount = recharge_amount;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getIs_paid() {
        return is_paid;
    }

    public void setIs_paid(String is_paid) {
        this.is_paid = is_paid;
    }
}
