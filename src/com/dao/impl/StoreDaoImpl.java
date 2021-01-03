package com.dao.impl;

import com.dao.StoreDao;
import com.domin.Classify;
import com.domin.Store;
import com.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.List;

public class StoreDaoImpl implements StoreDao {
    QueryRunner queryRunner = JDBCUtils.getQueryRunner();

    @Override
    public void add(Store store) {
        String sql =" INSERT store(storeName,address,staffId,storeDescribe,number) VALUES(?,?,?,?,?)";
        try {
            queryRunner.update(sql, store.getStoreName(), store.getAddress(), store.getStaffId(), store.getStoreDescribe(), store.getNumber());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Store store) {
        String sql =" update store set storeName=?, address=? , storeDescribe = ?, number = ?" +
                "where storeId = ?";
        try {
            queryRunner.update(sql, store.getStoreName(), store.getAddress(), store.getStoreDescribe(), store.getNumber(), store.getStoreId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(String storeId) {
        String sql ="DELETE FROM store WHERE storeId=?";
        try {
            queryRunner.update(sql,storeId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Store> findAll() {
       String sql =  " SELECT * FROM store";

        try {
            // 根据当前页，查询当前页数据(一页数据)
            return queryRunner.query(sql, new BeanListHandler<Store>(Store.class));
            // 设置到pb对象中
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
