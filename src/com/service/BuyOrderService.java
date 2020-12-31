package com.service;

import com.dao.BuyOrderDao;
import com.dao.impl.BuyOrderDaoImpl;
import com.domin.BuyOrder;
import com.domin.MonthWarehousing;
import com.domin.MonthlyPurchase;

import java.util.List;

public class BuyOrderService {
    BuyOrderDao dao = new BuyOrderDaoImpl();

    private static BuyOrderService instance = null;

    private BuyOrderService(){};

    public static BuyOrderService newInstance(){
        if (instance == null){
            instance = new BuyOrderService();
        }
        return instance;
    }

    /**
     * 添加采购订单
     * @param buyOrder
     */
    public void add(BuyOrder buyOrder){
        dao.add(buyOrder);
    }

    /**
     * 获取所有采购订单
     * @return
     */
    public List<BuyOrder> findAll(){
        return dao.findAll();
    }

    /**
     * 获取每月采购订单
     * @return
     */
    public List<MonthlyPurchase> findMonth(String id, String year){
        return dao.findMonth(id, year);
    }

    /**
     * 获取year年前的总入库数
     * @param storeId 仓库id
     * @param year 年份
     * @return
     */
    public int getSumBuyNum(String storeId, String year) {
        return dao.getSumBuyNum(storeId, year);
    }

    /**
     * 获取year年每月的入库数
     * @param id 仓库id
     * @param year 年份
     * @return
     */
    public List<MonthWarehousing> findStoreNum(String id, String year) {
        return dao.findStoreNum(id, year);
    }
}
