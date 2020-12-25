package com.dao;

import com.domin.Product;
import com.web.Page;

import java.util.List;

public interface ProductDao {

    /**
     * 增加一个商品
     * @param product
     */

    void addProduct(Product product);

    /**
     * 修改商品
     * @param product
     */
    void updateProduct(Product product);

    /**
     * 删除商品
     * @param productId
     */
    void deleteProduct(String productId);

    /**
     * 返回所有商品
     */
    List<Product> findProductAll();

    /**
     * 查找商品
     * @param id 商品id
     * @return
     */
    Product findProduct(String id);
}
