package com.service;

import com.dao.ProductDao;
import com.dao.impl.ProductDaoImpl;
import com.domin.Product;

import java.util.List;

public class ProductService {
    private ProductDao dao = new ProductDaoImpl();

    private static ProductService instance = null;

    private ProductService(){};

    public static ProductService newInstance(){
        if (instance == null){
            instance = new ProductService();
        }
        return instance;
    }

    /**
     * 增加一个商品
     * @param product
     */

    public void add(Product product){
        dao.addProduct(product);
    }

    /**
     * 修改商品
     * @param product
     */
    public void update(Product product){
        dao.updateProduct(product);
    }

    /**
     * 删除商品
     * @param productId
     */
    public void delete(String productId){
        dao.deleteProduct(productId);
    }

    /**
     * 返回所有商品
     */
    public List<Product> findAll(){
        return dao.findProductAll();
    }

    /**
     * 获取商品
     * @param id
     * @return
     */
    public Product findProduct(String id){
        return dao.findProduct(id);
    }
}
