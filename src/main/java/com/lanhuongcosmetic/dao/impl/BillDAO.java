package com.lanhuongcosmetic.dao.impl;

import com.lanhuongcosmetic.dao.IBillDAO;
import com.lanhuongcosmetic.mapper.BillMapper;
import com.lanhuongcosmetic.model.BillModel;
import com.lanhuongcosmetic.paging.Pageble;
import org.apache.commons.lang.StringUtils;

import java.sql.Timestamp;
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
        String sql = "INSERT INTO bill(user_id, full_name, total, address, phone, date, status) VALUES (?,?,?,?,?,?,?)";
        return insert(sql, billModel.getUser_id(), billModel.getFull_name(), billModel.getTotal(), billModel.getAddress(),
                billModel.getPhone(), billModel.getDate(), 0);
    }

    @Override
    public void update(int bill_id) {
        String sql = "UPDATE bill SET status = ? WHERE bill_id = ?";
        update(sql, 1, bill_id);
    }

    @Override
    public void delete(int bill_id) {
        String sql = "DELETE FROM bill WHERE bill_id = ?";
        update(sql, bill_id);
    }

    @Override
    public BillModel findOne(int bill_id) {
        String sql = "SELECT * FROM bill WHERE bill_id = ?";
        List<BillModel> billModels = query(sql, new BillMapper(), bill_id);
        return billModels.isEmpty() ? null : billModels.get(0);
    }

    @Override
    public BillModel findOneByIdAndDate(int user_id, Timestamp date) {
        String sql = "SELECT * FROM bill WHERE user_id = ? AND date = ?";
        List<BillModel> billModels = query(sql, new BillMapper(), user_id, date);
        return billModels.isEmpty() ? null : billModels.get(0);
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM bill";
        return count(sql);
    }
}
