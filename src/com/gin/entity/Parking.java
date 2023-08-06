package com.gin.entity;

/**
 *  Entity class for parking module
 */
public class Parking {

    private Integer id;

    private Integer parking_lot_information_id;
    private String parking_lot_number;
    private String parking_lot_name;
    private Integer location;
    private String park_time;
    private Integer ic_card_id;
    private String card_number;
    private Integer choose_type;
    private String serial_number;
    private String cardholder;
    private String phone;
    private String type;
    private Double charge_amount;
    private String vehicle_type;
    private String parking_space;
    private String parking_person;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParking_lot_information_id() {
        return parking_lot_information_id;
    }

    public void setParking_lot_information_id(Integer parking_lot_information_id) {
        this.parking_lot_information_id = parking_lot_information_id == null ? 0 : parking_lot_information_id;
    }

    public String getParking_lot_number() {
        return parking_lot_number;
    }

    public void setParking_lot_number(String parking_lot_number) {
        this.parking_lot_number = parking_lot_number == null ? "" : parking_lot_number.trim();
    }

    public String getParking_lot_name() {
        return parking_lot_name;
    }

    public void setParking_lot_name(String parking_lot_name) {
        this.parking_lot_name = parking_lot_name == null ? "" : parking_lot_name.trim();
    }

    public Integer getLocation() {
        return location;
    }

    public void setLocation(Integer location) {
        this.location = location == null ? 0 : location;
    }

    public String getPark_time() {
        return park_time;
    }

    public void setPark_time(String park_time) {
        this.park_time = park_time == null ? "" : park_time.trim();
    }

    public Integer getIc_card_id() {
        return ic_card_id;
    }

    public void setIc_card_id(Integer ic_card_id) {
        this.ic_card_id = ic_card_id == null ? 0 : ic_card_id;
    }

    public String getCard_number() {
        return card_number;
    }

    public void setCard_number(String card_number) {
        this.card_number = card_number == null ? "" : card_number.trim();
    }

    public Integer getChoose_type() {
        return choose_type;
    }

    public void setChoose_type(Integer choose_type) {
        this.choose_type = choose_type == null ? 0 : choose_type;
    }

    public String getSerial_number() {
        return serial_number;
    }

    public void setSerial_number(String serial_number) {
        this.serial_number = serial_number == null ? "" : serial_number.trim();
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? "" : type.trim();
    }

    public Double getCharge_amount() {
        return charge_amount;
    }

    public void setCharge_amount(Double charge_amount) {
        this.charge_amount = charge_amount == null ? 0.0f : charge_amount;
    }

    public String getVehicle_type() {
        return vehicle_type;
    }

    public void setVehicle_type(String vehicle_type) {
        this.vehicle_type = vehicle_type == null ? "" : vehicle_type.trim();
    }

    public String getParking_space() {
        return parking_space;
    }

    public void setParking_space(String parking_space) {
        this.parking_space = parking_space == null ? "" : parking_space.trim();
    }

    public String getParking_person() {
        return parking_person;
    }

    public void setParking_person(String parking_person) {
        this.parking_person = parking_person == null ? "" : parking_person.trim();
    }
}
