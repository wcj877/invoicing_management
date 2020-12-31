package com.servelet;

import com.domin.MonthOutOfStock;
import com.domin.MonthWarehousing;
import com.domin.Store;
import com.google.gson.Gson;
import com.service.BuyOrderService;
import com.service.SalesOrderService;
import jdk.nashorn.internal.ir.CallNode;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "StatisticalStoreServlet", urlPatterns = "/StatisticalStoreServlet")
public class StatisticalStoreServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String methodName = request.getParameter("method");

        try {
            Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            method.setAccessible(true);
            method.invoke(this, request, response);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    //获取统计数据
    protected void getStatistical(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String year = request.getParameter("year");

        ServletContext application = request.getServletContext();

        List<Store> storeList = (List<Store>) application.getAttribute("storeList");

        if (id == null || "".equals(id)){//当未选择仓库时默认为第一个仓库的id
            id = storeList.get(0).getStoreId();
        }

        BuyOrderService buyOrderService = BuyOrderService.newInstance();
        SalesOrderService salesOrderService = SalesOrderService.newInstance();

        List<MonthWarehousing> storeWarehousing = buyOrderService.findStoreNum(id, year);
        int sumBuyNum = buyOrderService.getSumBuyNum(id, year);

        List<MonthOutOfStock> storeOutOfStock = salesOrderService.findStoreNum(id, year);
        int sumSalesNum = salesOrderService.getSumSalesNum(id, year);

        int[] warehousingNum = new int[12];//每月入库数
        int[] outOfStockNum = new int[12];//每月出库数
        int[] storeSum = new int[12];//每月库存数
        int[] storeRemaining = new int[12];//仓库每月剩余容量


        for (int i = 0; i < warehousingNum.length; i++) {
            for (MonthWarehousing warehousing: storeWarehousing){
                if (i+1 == warehousing.getMonth()){
                    warehousingNum[i] = warehousing.getNum();
                }
            }
        }

        for (int i = 0; i < outOfStockNum.length; i++) {
            for (MonthOutOfStock outOfStock: storeOutOfStock){
                if (i+1 == outOfStock.getMonth()){
                    outOfStockNum[i] = outOfStock.getNum();
                }
            }
        }

        storeSum[0] = sumBuyNum-sumSalesNum + warehousingNum[0] - outOfStockNum[0];
        for (int i = 1; i < storeSum.length; i++) {
            storeSum[i] = storeSum[i-1];
            for (MonthWarehousing warehousing : storeWarehousing){
                if (i+1 == warehousing.getMonth()){
                    storeSum[i] += warehousing.getNum();
                }
            }

            for (MonthOutOfStock outOfStock: storeOutOfStock){
                if (i+1 == outOfStock.getMonth()){
                    storeSum[i] -= outOfStock.getNum();
                }
            }
        }


        int remaining = 0;//仓库容量
        for (Store store:storeList){
            if (store.getStoreId().equals(id)){
                remaining = store.getNumber();
            }
        }

        for (int i = 0; i < storeRemaining.length; i++) {
            storeRemaining[i] = remaining - storeSum[i];
        }

        Map<String, int[]> map = new HashMap<>();
        map.put("warehousingNum", warehousingNum);
        map.put("outOfStockNum", outOfStockNum);
        map.put("storeSum", storeSum);
        map.put("storeRemaining", storeRemaining);

        Gson gson = new Gson();
        String jsonStr = gson.toJson(map);
        response.setContentType("text/javascript");
        response.getWriter().print(jsonStr);
    }
}
