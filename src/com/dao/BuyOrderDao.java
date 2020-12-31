package com.dao;

import com.domin.BuyOrder;
import com.domin.MonthWarehousing;
import com.domin.MonthlyPurchase;

import java.util.List;

public interface BuyOrderDao {
    /**
     * 添加一个采购订单
     * @param buyOrder
     */
    void add(BuyOrder buyOrder);

    /**
     * 获取所有采购订单
     * @return
     */
    List<BuyOrder> findAll();


    /**
     * 获取每月采购统计
     * @return
     */
    List<MonthlyPurchase> findMonth(String id, String year);


    /**
     * 获取仓库入库统计
     * @param id
     * @param year
     * @return
     */
    List<MonthWarehousing> findStoreNum(String id, String year);

    /**
     * 获取year年前的总入库数
     * @param storeId
     * @param year
     * @return
     */
    int getSumBuyNum(String storeId, String year);
}
