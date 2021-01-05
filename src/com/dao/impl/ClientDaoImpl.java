package com.dao.impl;

import com.dao.ClientDao;
import com.domin.Client;
import com.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.List;

public class ClientDaoImpl implements ClientDao {
    QueryRunner queryRunner = JDBCUtils.getQueryRunner();


    @Override
    public void add(Client client) {
        String sql =" INSERT client(clientId, clientName,clientContact,clientPhone) VALUES(?,?,?,?)";
        try {
            queryRunner.update(sql,client.getClientId(), client.getClientName(), client.getClientContact(), client.getClientPhone());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Client client) {
        String sql =" update client set clientContact=?, clientPhone=?" +
                "where clientId = ?";

        try {
            queryRunner.update(sql, client.getClientContact(), client.getClientPhone(), client.getClientId());

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(String id) {
        String sql ="DELETE FROM client WHERE clientId=?";
        try {
            queryRunner.update(sql,id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Client> findAll() {
        String sql =  " SELECT * FROM client";

        try {
            return queryRunner.query(sql, new BeanListHandler<Client>(Client.class));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Client findClient(String id) {
        String sql =  " SELECT * FROM client WHERE clientId=?";

        try {
            return queryRunner.query(sql, new BeanHandler<Client>(Client.class), id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
