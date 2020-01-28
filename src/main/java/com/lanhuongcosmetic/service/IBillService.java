package com.lanhuongcosmetic.service;

import com.lanhuongcosmetic.model.BillModel;
import com.lanhuongcosmetic.paging.Pageble;

import java.util.List;

public interface IBillService {
    List<BillModel> findAll(Pageble pageble);
    BillModel save(BillModel billModel);
    BillModel update(BillModel billModel);
    void delete(int[] ids);
    BillModel findOne(int bill_id);
    int getTotalItem();
}
