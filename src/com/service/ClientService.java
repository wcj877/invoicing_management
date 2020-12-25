package com.service;

import com.dao.ClientDao;
import com.dao.impl.ClientDaoImpl;
import com.domin.Client;

import java.util.List;

public class ClientService {
    private ClientDao dao = new ClientDaoImpl();
    private static ClientService instance = null;
    private ClientService(){};

    public static ClientService newInstance(){
        if (instance == null){
            instance = new ClientService();

        }
        return instance;
    }

    /**
     * 添加客户
     * @param client
     */
    public void add(Client client){
        dao.add(client);
    }

    /**
     * 修改客户
     * @param client
     */
    public void update(Client client){
        dao.update(client);
    }

    /**
     * 删除客户
     * @param id
     */
    public void delete(String id){
        dao.delete(id);
    }

    /**
     * 获取全部客户
     * @return
     */
    public List<Client> findAll(){
        return dao.findAll();
    }

    /**
     * 获取客户
     * @param id
     * @return
     */
    public Client findClient(String id){
        return dao.findClient(id);
    }
}
