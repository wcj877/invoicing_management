package com.service;

import com.dao.StaffDao;
import com.dao.impl.StaffDaoImpl;
import com.domin.Staff;

import javax.lang.model.element.NestingKind;
import java.util.List;

public class StaffService {
    private StaffDao dao = new StaffDaoImpl();
    private static StaffService instance = null;

    private StaffService(){};

    public static StaffService newInstance(){
        if (instance == null){
            instance = new StaffService();
        }
        return  instance;
    }


    /**
     * 添加一个员工
     * @param staff
     */
    public void add(Staff staff){
        dao.add(staff);
    }

    /**
     * 修改员工
     * @param staff
     */
    public void update(Staff staff){
        dao.update(staff);
    }

    /**
     * 删除员工
     * @param id
     */
    public void delete(String id){
        dao.delete(id);
    }

    /**
     * 获取所有员工
     * @return
     */
    public List<Staff> finAll(){
        return dao.finAll();
    }

    /**
     * 查找员工
     * @param id
     * @param password
     * @return
     */
    public Staff findStaff(String id, String password){
        return dao.findStaff(id, password);
    }
}
