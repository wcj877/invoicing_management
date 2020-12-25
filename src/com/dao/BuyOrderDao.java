package com.dao;

import com.domin.BuyOrder;

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
}
