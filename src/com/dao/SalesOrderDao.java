package com.dao;

import com.domin.SalesOrder;

import java.util.List;

public interface SalesOrderDao {
    /**
     * 添加一个销售订单
     * @param salesOrder
     */
    void add(SalesOrder salesOrder);

    /**
     * 获取所有销售订单
     * @return
     */
    List<SalesOrder> findAll();
}
