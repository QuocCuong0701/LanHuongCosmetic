package com.lanhuongcosmetic.dao.impl;

import com.lanhuongcosmetic.dao.IBillDAO;
import com.lanhuongcosmetic.mapper.BillMapper;
import com.lanhuongcosmetic.model.BillModel;
import com.lanhuongcosmetic.paging.Pageble;
import org.apache.commons.lang.StringUtils;

import java.util.List;

public class BillDAO extends AbstractDAO<BillModel> implements IBillDAO {

    @Override
    public List<BillModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("SELECT * FROM bill");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new BillMapper());
    }

    @Override
    public int save(BillModel billModel) {
        StringBuilder sql=new StringBuilder("INSERT INTO bill(user_id, full_name, total, address, phone, date, status) ");
        sql.append("VALUES (?,?,?,?,?,?,?)");
        return insert(sql.toString(),billModel.getUser_id(), billModel.getTotal(), billModel.getAddress(),
                billModel.getPhone(), billModel.getDate(),billModel.isStatus());
    }

    @Override
    public void update(BillModel billModel) {
        String sql="UPDATE bill SET status = ? WHERE bill_id = ?";
        update(sql, billModel.isStatus(), billModel.getBill_id());
    }

    @Override
    public void delete(int bill_id) {
        String sql = "DELETE FROM bill WHERE bill_id = ?";
        update(sql, bill_id);
    }

    @Override
    public BillModel findOne(int bill_id) {
        String sql="SELECT * FROM bill WHERE bill_id = ?";
        List<BillModel> billModels = query(sql, new BillMapper(), bill_id);
        return billModels.isEmpty() ? null : billModels.get(0);
    }

    @Override
    public int getTotalItem() {
        String sql="SELECT count(*) FROM bill";
        return count(sql);
    }
}
