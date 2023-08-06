package com.gin.entity;

/**
 *  Entity class of charging standard module
 */
public class ChargingStandard {

    private Integer id;

    private String type;
    private Double amount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? "" : type.trim();
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount == null ? 0.0f : amount;
    }
}
