package com.service;

import com.dao.BuyOrderDao;
import com.dao.impl.BuyOrderDaoImpl;
import com.domin.BuyOrder;

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
}
