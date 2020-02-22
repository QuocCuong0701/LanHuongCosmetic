package com.lanhuongcosmetic.dao;

import com.lanhuongcosmetic.model.BillDetailModel;

import java.util.List;

public interface IBillDetailDAO extends GenericDAO<BillDetailModel> {
    List<BillDetailModel> findBillDetailByBillId(int bill_id);
    List<BillDetailModel> findBillDetailByBillId();
    int save(BillDetailModel billDetailModel);
    BillDetailModel findOne(int bill_detail_id);
}
