package com.dao.impl;

import com.dao.BuyOrderDao;
import com.domin.BuyOrder;
import com.domin.Classify;
import com.domin.MonthWarehousing;
import com.domin.MonthlyPurchase;
import com.mysql.cj.PreparedQuery;
import com.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import javax.lang.model.element.NestingKind;
import java.math.BigDecimal;
import java.sql.SQLException;
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

    @Override
    public List<MonthlyPurchase> findMonth(String id, String year) {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT MONTH(buyorder.time) as month , SUM(buyorder.buyNumber) as sumNumber , SUM(buyorder.buyNumber*buyorder.price) AS sumPrice " +
                "FROM buyorder ");
        if (id != null && !"".equals(id) )
            sb.append(" WHERE buyorder.productId = '").append(id).append("' and ");
        else
            sb.append(" where ");
        sb.append("  YEAR(buyorder.time) = '").append(year).append("' ");

        sb.append(" group by month(buyorder.time);");

        try {
            // 根据当前页，查询当前页数据(一页数据)
            return queryRunner.query(sb.toString(), new BeanListHandler<MonthlyPurchase>(MonthlyPurchase.class));
            // 设置到pb对象中
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<MonthWarehousing> findStoreNum(String id, String year) {
        String sql = " SELECT MONTH(buyorder.time) AS month, SUM(buyNumber) AS num " +
                " FROM buyorder,store,product " +
                " WHERE product.productId = buyorder.productId AND product.storeId = store.storeId AND store.storeId = ? AND YEAR(buyorder.time)=? " +
                " group BY MONTH(buyorder.time) ";

        try {
            return queryRunner.query(sql, new BeanListHandler<>(MonthWarehousing.class), id, year);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int getSumBuyNum(String storeId, String year) {
        String sql = " SELECT SUM(buyNumber) AS sum " +
                " FROM buyorder,store,product " +
                " WHERE product.productId = buyorder.productId AND product.storeId = store.storeId AND store.storeId = ? AND YEAR(buyorder.time)<?";

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
