package com.dao;

import com.domin.Client;

import java.util.List;

public interface ClientDao {

    /**
     * 添加一个客户
     * @param client
     */
    void add(Client client);

    /**
     * 修改客户
     * @param client
     */
    void update(Client client);

    /**
     * 删除客户
     * @param id
     */
    void delete(String id);


    /**
     * 获取所有客户
     * @return
     */
    List<Client> findAll();

    /**
     * 查找客户
     * @param id
     * @return
     */
    Client findClient(String id);
}
