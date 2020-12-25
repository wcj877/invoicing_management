package com.dao.impl;

import com.dao.SalesOrderDao;
import com.domin.BuyOrder;
import com.domin.SalesOrder;
import com.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.List;

public class SalesOrderDaoImpl implements SalesOrderDao {
    QueryRunner queryRunner = JDBCUtils.getQueryRunner();


    @Override
    public void add(SalesOrder salesOrder) {
        String sql =" INSERT salesOrder(salesOrderId, salesNumber, productId, clientId, staffId, time, price) VALUES(?,?,?,?,?,?,?)";
        try {
            queryRunner.update(sql, salesOrder.getSalesOrderId(), salesOrder.getSalesNumber(), salesOrder.getProductId(), salesOrder.getClientId(),
                    salesOrder.getStaffId(), salesOrder.getTime(), salesOrder.getPrice());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<SalesOrder> findAll() {
        StringBuilder sb = new StringBuilder();
        sb.append(" SELECT SalesOrder.salesOrderId, salesNumber, SalesOrder.productId,productName, SalesOrder.clientId, clientName, " +
                "SalesOrder.staffId, staffName, time, price " +
                "FROM SalesOrder,product,client,staff " +
                "WHERE SalesOrder.productId = product.productId AND SalesOrder.clientId = client.clientId AND " +
                "staff.staffId = SalesOrder.staffId;");

        try {
            // 根据当前页，查询当前页数据(一页数据)
            return queryRunner.query(sb.toString(), new BeanListHandler<SalesOrder>(SalesOrder.class));
            // 设置到pb对象中
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
