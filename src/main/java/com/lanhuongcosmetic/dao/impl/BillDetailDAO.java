package com.lanhuongcosmetic.dao.impl;

import com.lanhuongcosmetic.dao.IBillDetailDAO;
import com.lanhuongcosmetic.mapper.BillDetailMapper;
import com.lanhuongcosmetic.model.BillDetailModel;

import java.util.List;

public class BillDetailDAO extends AbstractDAO<BillDetailModel> implements IBillDetailDAO {
    @Override
    public List<BillDetailModel> findBillDetailByBillId(int bill_id) {
        StringBuilder sql=new StringBuilder("SELECT bill_detail_id, bill_id, p.product_name, p.product_price ,quantity ");
        sql.append("FROM bill_detail as bd join product as p on bd.product_id = p.product_id ");
        sql.append("WHERE bill_id = ?");
        List<BillDetailModel> billDetailModels = query(sql.toString(), new BillDetailMapper(), bill_id);
        return query(sql.toString(), new BillDetailMapper(), bill_id);
    }
}
