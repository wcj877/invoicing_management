package com.dao;

import com.domin.Supplier;

import java.util.List;

public interface SupplierDao {

    /**
     * 增加一个供应商
     * @param supplier
     */
    void add(Supplier supplier);

    /**
     * 修改供应商
     * @param supplier
     */
    void update(Supplier supplier);

    /**
     * 删除供应商
     * @param id
     */
    void delete(String id);

    /**
     * 获取所有供应商
     * @return
     */
    List<Supplier> findAll();

    /**
     * 查找供应商
     * @param id
     * @return
     */
    Supplier findSupplier(String id);
}
