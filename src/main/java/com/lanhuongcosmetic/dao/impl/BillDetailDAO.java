package com.lanhuongcosmetic.dao.impl;

import com.lanhuongcosmetic.dao.IBillDetailDAO;
import com.lanhuongcosmetic.mapper.BillDetailMapper;
import com.lanhuongcosmetic.mapper.ProductMapper;
import com.lanhuongcosmetic.model.BillDetailModel;
import com.lanhuongcosmetic.model.ProductModel;

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

    @Override
    public List<BillDetailModel> findBillDetailByBillId() {
        StringBuilder sql=new StringBuilder("SELECT bill_id, bill_detail_id, bill_id, p.product_name, p.product_price ,quantity ");
        sql.append("FROM bill_detail as bd join product as p on bd.product_id = p.product_id ");
        List<BillDetailModel> billDetailModels = query(sql.toString(), new BillDetailMapper());
        return query(sql.toString(), new BillDetailMapper());
    }

    @Override
    public int save(BillDetailModel billDetailModel) {
        StringBuilder sql=new StringBuilder("INSERT INTO bill_detail (bill_id, product_id, quantity, ");
        sql.append("total) VALUES (?,?,?,?)");
        return insert(sql.toString(), billDetailModel.getBill_id(), billDetailModel.getProduct_id(),
                billDetailModel.getQuantity(), billDetailModel.getTotal());
    }

    @Override
    public BillDetailModel findOne(int bill_detail_id) {
        String sql = "SELECT * FROM bill_detail WHERE bill_detail_id = ?";
        List<BillDetailModel> billDetailModels = query(sql, new BillDetailMapper(), bill_detail_id);
        return billDetailModels.isEmpty() ? null : billDetailModels.get(0);
    }
}
