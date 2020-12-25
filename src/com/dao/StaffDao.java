package com.dao;

import com.domin.Staff;

import java.util.List;

public interface StaffDao {

    /**
     * 添加一个员工
     * @param staff
     */
    void add(Staff staff);

    /**
     * 修改员工
     * @param staff
     */
    void update(Staff staff);

    /**
     * 删除员工
     * @param id
     */
    void delete(String id);

    /**
     * 获取所有员工
     * @return
     */
    List<Staff> finAll();

    /**
     * 查找员工
     * @param id
     * @return
     */
    Staff findStaff(String id, String password);
}
