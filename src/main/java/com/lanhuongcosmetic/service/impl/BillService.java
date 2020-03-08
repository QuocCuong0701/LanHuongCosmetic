package com.lanhuongcosmetic.service.impl;

import com.lanhuongcosmetic.dao.IBillDAO;
import com.lanhuongcosmetic.model.BillModel;
import com.lanhuongcosmetic.paging.Pageble;
import com.lanhuongcosmetic.service.IBillService;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

public class BillService implements IBillService {
    @Inject
    private IBillDAO iBillDAO;

    @Override
    public List<BillModel> findAll(Pageble pageble) {
        return iBillDAO.findAll(pageble);
    }

    @Override
    public BillModel save(BillModel billModel) {
        int bill_id = iBillDAO.save(billModel);
        return iBillDAO.findOne(bill_id);
    }

    @Override
    public BillModel update(int bill_id) {
        iBillDAO.update(bill_id);
        return iBillDAO.findOne(bill_id);
    }

    @Override
    public void delete(int[] ids) {
        for (int id : ids) {
            iBillDAO.delete(id);
        }
    }

    @Override
    public BillModel findOne(int bill_id) {
        BillModel billModel = iBillDAO.findOne(bill_id);
        return billModel;
    }

    @Override
    public BillModel findOneByIdAndDate(int user_id, Timestamp date) {
        return iBillDAO.findOneByIdAndDate(user_id, date);
    }

    @Override
    public int getTotalItem() {
        return iBillDAO.getTotalItem();
    }
}
