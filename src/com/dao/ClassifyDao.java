package com.dao;

import com.domin.Classify;

import java.util.List;

public interface ClassifyDao {

    /**
     * 添加一个分类
     * @param classifyName
     */
    void add(String classifyName);

    /**
     * 修改分类
     * @param classify
     */
    void update(Classify classify);

    /**
     * 删除分类
     * @param classifyId
     */
    void delete(String classifyId);

    /**
     * 获取所有分类
     * @return
     */
    List<Classify> findAll();
}
