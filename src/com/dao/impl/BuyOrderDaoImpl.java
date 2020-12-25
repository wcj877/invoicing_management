package com.dao.impl;

import com.dao.BuyOrderDao;
import com.domin.BuyOrder;
import com.domin.Classify;
import com.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.List;

public class BuyOrderDaoImpl implements BuyOrderDao {
    QueryRunner queryRunner = JDBCUtils.getQueryRunner();

    @Override
    public void add(BuyOrder buyOrder) {
        String sql =" INSERT buyOrder(buyOrderId, buyNumber, productId, supplierId, staffId, time, price) VALUES(?,?,?,?,?,?,?)";
        try {
            queryRunner.update(sql, buyOrder.getBuyOrderId(), buyOrder.getBuyNumber(), buyOrder.getProductId(), buyOrder.getSupplierId(),
                    buyOrder.getStaffId(), buyOrder.getTime(), buyOrder.getPrice());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<BuyOrder> findAll() {
        StringBuilder sb = new StringBuilder();
        sb.append(" SELECT BuyOrder.buyOrderId, buyNumber, BuyOrder.productId,productName, BuyOrder.supplierId,supplierName, " +
                "BuyOrder.staffId, staffName, time, price " +
                "FROM BuyOrder,product,supplier,staff " +
                "WHERE buyorder.productId = product.productId AND buyorder.supplierId = supplier.supplierId AND " +
                "staff.staffId = buyorder.staffId;");

        try {
            // 根据当前页，查询当前页数据(一页数据)
            return queryRunner.query(sb.toString(), new BeanListHandler<BuyOrder>(BuyOrder.class));
            // 设置到pb对象中
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
