package com.lanhuongcosmetic.model;

import java.sql.Timestamp;

public class BillModel extends Abstractmodel<BillModel>{
    private double total;
    private String address;
    private String phone;
    private Timestamp date;

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}
