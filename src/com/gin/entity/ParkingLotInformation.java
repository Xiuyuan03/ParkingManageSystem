package com.gin.entity;

/**
 *  The entity class of the parking lot information module
 */
public class ParkingLotInformation {

    private Integer id;

    private String parking_lot_number;
    private String parking_lot_name;
    private Integer location;
    private String introduction;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? "" : introduction.trim();
    }
}
