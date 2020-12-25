package com.service;

import com.dao.StoreDao;
import com.dao.impl.StoreDaoImpl;
import com.domin.Store;

import java.util.List;

public class StoreService {
    private StoreDao dao = new StoreDaoImpl();

    private static StoreService instance = null;

    private StoreService(){};

    public static StoreService newInstance(){
        if (instance == null){
            instance = new StoreService();
        }
        return instance;
    }

    /**
     * 增加一个仓库
     * @param store
     */
    public void add(Store store){
        dao.add(store);
    }

    /**
     * 修改仓库
     * @param store
     */
    public void update(Store store){
        dao.update(store);
    }

    /**
     * 删除仓库
     * @param storeId
     */
    public void delete(String storeId){
        dao.delete(storeId);
    }

    /**
     * 获取所有仓库
     * @return
     */
    public List<Store> findAll(){
        return dao.findAll();
    }
}
