package com.dao.impl;

import com.dao.SupplierDao;
import com.domin.Staff;
import com.domin.Supplier;
import com.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.List;

public class SupplierDaoImpl implements SupplierDao {
    QueryRunner queryRunner = JDBCUtils.getQueryRunner();

    @Override
    public void add(Supplier supplier) {
        String sql =" INSERT supplier(supplierId,supplierContact,supplierPhone) VALUES(?,?,?)";
        try {
            queryRunner.update(sql,supplier.getSupplierId(), supplier.getSupplierContact(), supplier.getSupplierPhone());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Supplier supplier) {
        String sql =" update supplier set supplierContact=?, supplierPhone=?" +
                    "where supplierId = ?";

        try {
            queryRunner.update(sql, supplier.getSupplierContact(), supplier.getSupplierPhone(), supplier.getSupplierId());

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(String id) {
        String sql ="DELETE FROM supplier WHERE supplierId=?";
        try {
            queryRunner.update(sql,id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Supplier> findAll() {
        String sql =  " SELECT * FROM supplier";

        try {
            return queryRunner.query(sql, new BeanListHandler<Supplier>(Supplier.class));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Supplier findSupplier(String id) {
        String sql =  " SELECT * FROM supplier WHERE supplierId=?";

        try {
            return queryRunner.query(sql, new BeanHandler<Supplier>(Supplier.class), id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
