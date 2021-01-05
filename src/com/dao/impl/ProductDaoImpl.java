package com.dao.impl;

import com.dao.ProductDao;
import com.domin.Product;
import com.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class ProductDaoImpl implements ProductDao {
    QueryRunner queryRunner = JDBCUtils.getQueryRunner();

    @Override
    public void addProduct(Product product) {
        String sql =" INSERT product(productName,describes,classifyId,photo,storeId) VALUES(?,?,?,?,?)";
        try {
            queryRunner.update(sql, product.getProductName(), product.getDescribes(), product.getClassifyId(),
                    product.getPhoto(), product.getStoreId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateProduct(Product product) {
        String sql =" update product set productName=?, describes=? " +
                "where productId = ?";
        try {
            queryRunner.update(sql,product.getProductName(), product.getDescribes(), product.getProductId() );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteProduct(String productId) {
        String sql ="DELETE FROM product WHERE productId=?";
        try {
            queryRunner.update(sql,productId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Product> findProductAll() {
        StringBuilder sb = new StringBuilder();
        /**
         * 运行此项目前先将这两个视图创建，
         * 创建后才可以查询
         */

        //创建销售视图
//        sb.append(" CREATE VIEW view_sa  " +
//                "AS select product.productId, productName, describes, classifyId, photo, storeId,  " +
//                "IF(SUM(salesorder.salesNumber)>=0,SUM(salesorder.salesNumber),0) as salesVolume ,  " +
//                "IF(SUM(salesorder.salesNumber * salesorder.price)>=0,SUM(salesorder.salesNumber * salesorder.price),0) as saPrice   " +
//                "from product LEFT JOIN salesorder ON product.productId = salesorder.productId   " +
//                "group by product.productId;  ");
//
//        //创建采购视图
//        sb.append("CREATE VIEW view_buy  " +
//                " AS  " +
//                "SELECT product.productId, productName, describes, classifyId, photo, storeId,  " +
//                "IF(SUM(buyorder.buyNumber * buyorder.price)>=0, SUM(buyorder.buyNumber * buyorder.price) ,0) as buyPrice ,  " +
//                "IF(SUM(buyorder.buyNumber)>=0,SUM(buyorder.buyNumber),0) as buyVolume   " +
//                "from buyorder RIGHT JOIN product ON product.productId = buyorder.productId  " +
//                "group by product.productId;  ");

        //创建表
        sb.append("SELECT view_buy.productId, view_buy.productName, view_buy.describes, view_buy.classifyId, view_buy.photo,  " +
                " view_buy.storeId, salesVolume, saPrice, buyVolume, buyPrice  " +
                "FROM view_sa,view_buy where view_sa.productId = view_buy.productId;  ");
        try {
            // 根据当前页，查询当前页数据(一页数据)
                return queryRunner.query(sb.toString(), new BeanListHandler<Product>(Product.class));
                // 设置到pb对象中
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product findProduct(String id) {
        String sql ="SELECT * FROM product WHERE productId=?";
        try {
            return queryRunner.query(sql,new BeanHandler<>(Product.class), id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}