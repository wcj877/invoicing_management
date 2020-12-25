package com.service;

import com.dao.ClassifyDao;
import com.dao.impl.ClassifyDaoImpl;
import com.domin.Classify;

import java.util.List;

public class ClassifyService {

    private ClassifyDao dao = new ClassifyDaoImpl();

    private static ClassifyService instance = null;
    private ClassifyService(){ };
    public static ClassifyService newInstance(){
        if (instance == null){
            instance = new ClassifyService();
        }
        return instance;
    }

    /**
     * 添加一个分类
     * @param classifyName
     */
    public void add(String classifyName){
        dao.add(classifyName);
    }

    /**
     * 修改分类
     * @param classify
     */
    public void update(Classify classify){
        dao.update(classify);
    }

    /**
     * 删除分类
     * @param classifyId
     */
    public void delete(String classifyId){
        dao.delete(classifyId);
    }

    /**
     * 获取所有分类
     * @return
     */
    public List<Classify> findAll(){
        return dao.findAll();
    }
}
