package com.service;

import com.dao.SalesOrderDao;
import com.dao.impl.SalesOrderDaoImpl;
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
}
