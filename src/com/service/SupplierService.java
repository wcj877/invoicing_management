package com.service;

import com.dao.SupplierDao;
import com.dao.impl.SupplierDaoImpl;
import com.domin.Supplier;

import java.util.List;

public class SupplierService {
    private SupplierDao dao = new SupplierDaoImpl();
    private static SupplierService instance = null;

    private SupplierService(){};

    public static SupplierService newInstance(){
        if (instance == null){
            instance = new SupplierService();
        }
        return instance;
    }

    /**
     * 增加一个供应商
     * @param supplier
     */
    public void add(Supplier supplier){
        dao.add(supplier);
    }

    /**
     * 修改供应商
     * @param supplier
     */
    public void update(Supplier supplier){
        dao.update(supplier);
    }

    /**
     * 删除供应商
     * @param id
     */
    public void delete(String id){
        dao.delete(id);
    }

    /**
     * 获取所有供应商
     * @return
     */
    public List<Supplier> findAll(){
        return dao.findAll();
    }

    public Supplier findSupplier(String id){
        return dao.findSupplier(id);
    }
}
