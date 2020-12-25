package com.dao.impl;

import com.dao.StaffDao;
import com.domin.Staff;
import com.domin.Store;
import com.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.List;

public class StaffDaoImpl implements StaffDao {
    QueryRunner queryRunner = JDBCUtils.getQueryRunner();

    @Override
    public void add(Staff staff) {
        String sql =" INSERT staff(staffId,staffName,duty,password) VALUES(?,?,?,?)";
        try {
            queryRunner.update(sql, staff.getStaffId(), staff.getStaffName(), staff.getDuty(), staff.getPassword());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Staff staff) {
        String sql = null;
        if (staff.getPassword().length()>0 || staff.getPassword() != null){
            sql =" update staff set staffName=?, duty=? , password = ?" +
                    "where staffId = ?";
        } else {
            sql =" update staff set staffName=?, duty=? " +
                    "where staffId = ?";
        }

        try {
            if (staff.getPassword().length()>0 || staff.getPassword() != null){
                queryRunner.update(sql, staff.getStaffName(), staff.getDuty(), staff.getPassword(), staff.getStaffId());
            } else {
                queryRunner.update(sql, staff.getStaffName(), staff.getDuty(), staff.getStaffId());
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(String id) {
        String sql ="DELETE FROM staff WHERE staffId=?";
        try {
            queryRunner.update(sql,id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Staff> finAll() {
        String sql =  " SELECT * FROM staff";

        try {
            // 根据当前页，查询当前页数据(一页数据)
            return queryRunner.query(sql, new BeanListHandler<Staff>(Staff.class));
            // 设置到pb对象中
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Staff findStaff(String id, String password) {
        String sql =  " SELECT * FROM staff where staffId=? and password = ?";

        try {
            // 根据当前页，查询当前页数据(一页数据)
            return queryRunner.query(sql, new BeanHandler<Staff>(Staff.class), id, password);
            // 设置到pb对象中
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
