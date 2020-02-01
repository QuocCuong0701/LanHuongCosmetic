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
}
