package com.domin;

//商品
public class Product {
    private int productId;
    private String productName;
    private String describes;
    private int classifyId;
    private String photo;
    private String storeId;//货架
    private int buyVolume;//总进货量
    private double buyPrice; //库存总价值
    private int salesVolume;//销售量
    private double saPrice;//获利

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes;
    }

    public int getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(int classifyId) {
        this.classifyId = classifyId;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }

    public int getBuyVolume() {
        return buyVolume;
    }

    public void setBuyVolume(int buyVolume) {
        this.buyVolume = buyVolume;
    }

    public double getBuyPrice() {
        return buyPrice;
    }

    public void setBuyPrice(double buyPrice) {
        this.buyPrice = buyPrice;
    }

    public int getSalesVolume() {
        return salesVolume;
    }

    public void setSalesVolume(int salesVolume) {
        this.salesVolume = salesVolume;
    }

    public double getSaPrice() {
        return saPrice;
    }

    public void setSaPrice(double saPrice) {
        this.saPrice = saPrice;
    }
}
