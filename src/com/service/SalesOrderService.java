package com.service;

import com.dao.SalesOrderDao;
import com.dao.impl.SalesOrderDaoImpl;
import com.domin.MonthOutOfStock;
import com.domin.MonthWarehousing;
import com.domin.MonthlySales;
import com.domin.SalesOrder;

import java.util.List;

public class SalesOrderService {
    private SalesOrderDao dao = new SalesOrderDaoImpl();
    private static SalesOrderService instance = null;

    private SalesOrderService(){ };

    public static SalesOrderService newInstance(){
        if (instance == null){
            instance = new SalesOrderService();
        }
        return instance;
    }

    /**
     * 添加一个销售订单
     * @param salesOrder
     */
    public void add(SalesOrder salesOrder){
        dao.add(salesOrder);
    }

    /**
     * 获取所有销售订单
     * @return
     */
    public List<SalesOrder> findAll(){
        return dao.findAll();
    }

    /**
     * 获取每月销售统计
     * @return
     */
    public List<MonthlySales> findMonth(String id, String year){
        return dao.findMonth(id, year);
    }

    /**
     * 获取year年前的总出库数
     * @param storeId 仓库id
     * @param year 年份
     * @return
     */
    public int getSumSalesNum(String storeId, String year) {
        return dao.getSumSalesNum(storeId, year);
    }

    /**
     * 获取year年每月的出库数
     * @param id 仓库id
     * @param year 年份
     * @return
     */
    public List<MonthOutOfStock> findStoreNum(String id, String year) {
        return dao.findStoreNum(id, year);
    }
}
