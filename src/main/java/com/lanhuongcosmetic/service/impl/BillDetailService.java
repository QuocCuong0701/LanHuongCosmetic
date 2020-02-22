package com.lanhuongcosmetic.service.impl;

import com.lanhuongcosmetic.dao.IBillDetailDAO;
import com.lanhuongcosmetic.model.BillDetailModel;
import com.lanhuongcosmetic.service.IBillDetailService;

import javax.inject.Inject;
import java.util.List;

public class BillDetailService implements IBillDetailService {
    @Inject
    private IBillDetailDAO iBillDetailDAO;
    @Override
    public List<BillDetailModel> findBillDetailByBillId(int bil_id) {
        return iBillDetailDAO.findBillDetailByBillId(bil_id);
    }

    @Override
    public BillDetailModel save(BillDetailModel billDetailModel) {
        int bill_detail_id = iBillDetailDAO.save(billDetailModel);
        return iBillDetailDAO.findOne(bill_detail_id);
    }

    @Override
    public BillDetailModel findOne(int bill_detail_id) {
        return iBillDetailDAO.findOne(bill_detail_id);
    }
}
