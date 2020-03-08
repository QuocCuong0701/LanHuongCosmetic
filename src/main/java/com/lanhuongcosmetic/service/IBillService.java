package com.lanhuongcosmetic.service;

import com.lanhuongcosmetic.model.BillModel;
import com.lanhuongcosmetic.paging.Pageble;

import java.sql.Timestamp;
import java.util.List;

public interface IBillService {
    List<BillModel> findAll(Pageble pageble);
    BillModel save(BillModel billModel);
    BillModel update(int bill_id);
    void delete(int[] ids);
    BillModel findOne(int bill_id);
    BillModel findOneByIdAndDate(int user_id, Timestamp date);
    int getTotalItem();
}
