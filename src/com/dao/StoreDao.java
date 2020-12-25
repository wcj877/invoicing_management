package com.dao;

import com.domin.Store;

import java.util.List;

public interface StoreDao {

    /**
     * 增加一个仓库
     * @param store
     */
    void add(Store store);

    /**
     * 修改仓库
     * @param store
     */
    void update(Store store);

    /**
     * 删除仓库
     * @param storeId
     */
    void delete(String storeId);

    /**
     * 获取所有仓库
     * @return
     */
    List<Store> findAll();

}
