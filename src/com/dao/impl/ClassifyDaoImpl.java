package com.dao.impl;

import com.dao.ClassifyDao;
import com.domin.Classify;
import com.domin.Product;
import com.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.List;

public class ClassifyDaoImpl implements ClassifyDao {
    QueryRunner queryRunner = JDBCUtils.getQueryRunner();

    @Override
    public void add(String classifyName) {
        String sql =" INSERT classify(classifyName) VALUES(?)";
        try {
            queryRunner.update(sql, classifyName);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Classify classify) {
        String sql =" update classify set classifyName=?" +
                "where classifyId = ?";
        try {
            queryRunner.update(sql, classify.getClassifyName(), classify.getClassifyId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(String classifyId) {
        String sql ="DELETE FROM classify WHERE classifyId=?";
        try {
            queryRunner.update(sql,classifyId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Classify> findAll() {
        StringBuilder sb = new StringBuilder();
        sb.append(" SELECT * FROM classify");

        try {
            // 根据当前页，查询当前页数据(一页数据)
            return queryRunner.query(sb.toString(), new BeanListHandler<Classify>(Classify.class));
            // 设置到pb对象中
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
