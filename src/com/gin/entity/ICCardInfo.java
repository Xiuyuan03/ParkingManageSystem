package com.gin.entity;

/**
 *  Entity class of IC card information module
 */
public class ICCardInfo {

    private Integer id;

    private String serial_number;
    private String card_number;
    private String cardholder;
    private String phone;
    private Double card_balance;
    private String operator;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSerial_number() {
        return serial_number;
    }

    public void setSerial_number(String serialNumber) {
        this.serial_number = serialNumber == null ? "" : serialNumber.trim();
    }

    public String getCard_number() {
        return card_number;
    }

    public void setCard_number(String cardNumber) {
        this.card_number = cardNumber == null ? "" : cardNumber.trim();
    }

    public String getCardholder() {
        return cardholder;
    }

    public void setCardholder(String cardholder) {
        this.cardholder = cardholder == null ? "" : cardholder.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? "" : phone.trim();
    }

    public Double getCard_balance() {
        return card_balance;
    }

    public void setCard_balance(Double card_balance) {
        this.card_balance = card_balance == null ? 0.0f : card_balance;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? "" : operator.trim();
    }
}
