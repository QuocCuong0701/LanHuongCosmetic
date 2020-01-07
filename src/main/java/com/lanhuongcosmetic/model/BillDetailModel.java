package com.lanhuongcosmetic.model;

public class BillDetailModel extends Abstractmodel<BillDetailModel>{
    private int bill_detail_id;
    private double price;
    private int quantity;

    public int getBill_detail_id() {
        return bill_detail_id;
    }

    public void setBill_detail_id(int bill_detail_id) {
        this.bill_detail_id = bill_detail_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
