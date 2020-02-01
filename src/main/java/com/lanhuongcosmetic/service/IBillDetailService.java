package com.lanhuongcosmetic.service;

import com.lanhuongcosmetic.model.BillDetailModel;

import java.util.List;

public interface IBillDetailService {
    List<BillDetailModel> findBillDetailByBillId(int bill_id);
}
