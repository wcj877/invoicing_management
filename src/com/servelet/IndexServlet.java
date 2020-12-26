package com.servelet;

import com.dao.ClassifyDao;
import com.dao.StoreDao;
import com.dao.impl.ClassifyDaoImpl;
import com.dao.impl.StoreDaoImpl;
import com.domin.Classify;
import com.domin.Staff;
import com.domin.Store;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

//@WebServlet(name = "IndexServlet")
public class IndexServlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ClassifyDao classifyDao = new ClassifyDaoImpl();

        List<Classify> classifyList = classifyDao.findAll();
        config.getServletContext().setAttribute("classifyList", classifyList);

        StoreDao storeDao = new StoreDaoImpl();
        List<Store> storeList = storeDao.findAll();
        config.getServletContext().setAttribute("storeList", storeList);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter writer = response.getWriter();

        if ("online".equalsIgnoreCase(request.getParameter("method"))){
            writer.write(request.getServletContext().getAttribute("onlineNumber").toString());
        }
    }
}
