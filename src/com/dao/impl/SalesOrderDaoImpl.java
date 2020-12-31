package com.dao.impl;

import com.dao.SalesOrderDao;
import com.domin.*;
import com.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import javax.lang.model.element.NestingKind;
import java.math.BigDecimal;
import java.sql.SQLException;
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

    @Override
    public List<MonthlySales> findMonth(String id, String year) {
        StringBuilder sb = new StringBuilder();
        sb.append(" SELECT MONTH(salesorder.time) as month , SUM(salesorder.salesNumber) as sumNumber , SUM(salesorder.salesNumber*salesorder.price) AS sumPrice " +
                " FROM salesorder ");
        if (id != null && !"".equals(id) )
            sb.append(" WHERE salesorder.productId = '").append(id).append("'  and ");
        else
            sb.append(" where ");

        sb.append("  YEAR(salesorder.time) = '").append(year).append("' ");

        sb.append("  group by month(salesorder.time); ");

        try {
            // 根据当前页，查询当前页数据(一页数据)
            return queryRunner.query(sb.toString(), new BeanListHandler<MonthlySales>(MonthlySales.class));
            // 设置到pb对象中
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<MonthOutOfStock> findStoreNum(String storeId, String year) {
        String sql = " SELECT  MONTH(salesorder.time) AS month, SUM(salesorder.salesNumber) AS num  " +
                " FROM salesorder,store,product  " +
                " WHERE product.productId = salesorder.productId AND product.storeId = store.storeId AND store.storeId = ? AND YEAR(salesorder.time)=? " +
                " group BY MONTH(salesorder.time) ";

        try {
            return queryRunner.query(sql, new BeanListHandler<>(MonthOutOfStock.class), storeId, year);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int getSumSalesNum(String storeId, String year) {
        String sql = " SELECT SUM(salesorder.salesNumber) AS sum " +
                " FROM salesorder,store,product " +
                " WHERE product.productId = salesorder.productId AND product.storeId = store.storeId AND store.storeId = ? AND YEAR(salesorder.time)<? ";

        try {
            BigDecimal sum = queryRunner.query(sql, new ScalarHandler<>(), storeId, year);
            if (sum == null)
                sum = new BigDecimal(0);
            return sum.intValue();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
