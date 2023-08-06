package com.gin.entity;

/**
 *  The entity class of the parking space information module
 */
public class ParkingInformation {

    private Integer id;

    private String parking_lot_number;
    private String parking_lot_name;
    private Integer row;
    private Integer columns;

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

    public Integer getRow() {
        return row;
    }

    public void setRow(Integer row) {
        this.row = row == null ? 0 : row;
    }

    public Integer getColumns() {
        return columns;
    }

    public void setColumns(Integer columns) {
        this.columns = columns == null ? 0 : columns;
    }
}
