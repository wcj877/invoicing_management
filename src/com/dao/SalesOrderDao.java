package com.dao;

import com.domin.MonthOutOfStock;
import com.domin.MonthlySales;
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

    /**
     * 获取每月销售统计
     * @return
     */
    List<MonthlySales> findMonth(String id, String year);


    /**
     * 获取year的每月出库数
     * @param storeId 仓库id
     * @param year 年份
     * @return
     */
    List<MonthOutOfStock> findStoreNum(String storeId, String year);


    /**
     * 获取仓库在year年前的总出库数
     * @param storeId 仓库Id
     * @param year 年份
     * @return
     */
    int getSumSalesNum(String storeId, String year);
}
