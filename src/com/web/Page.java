package com.web;

import java.util.List;

public class Page<T> {
    private int currentPage = 1; // 当前页, 默认显示第一页
    private int pageCount = 20; // 每页显示的行数(查询返回的行数), 默认每页显示4行
    private int totalCount; // 总记录数
    private int totalPage; // 总页数 = 总记录数 / 每页显示的行数 (+ 1)
    private List<T> pageData; // 分页查询到的数据
    private String condition = null;//查询的条件

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        if (totalCount % pageCount == 0) {
            totalPage = totalCount / pageCount;
        } else {
            totalPage = totalCount / pageCount + 1;
        }
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getPageData() {
        return pageData;
    }

    public void setPageData(List<T> pageData) {
        this.pageData = pageData;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currentPage=" + currentPage +
                ", pageCount=" + pageCount +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", pageData=" + pageData +
                '}';
    }

}
