package com.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;

import javax.sql.DataSource;

/**
 * 封装数据库操作
 */
public class JDBCUtils {
    //连接池
    private static DataSource dataSource;//数据源
    static {
        dataSource = new ComboPooledDataSource();
    }

    public static DataSource getDataSource(){
        return dataSource;
    }

    public static QueryRunner getQueryRunner(){
        return  new QueryRunner(dataSource);
    }
}
