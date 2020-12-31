package com.servelet;

import com.domin.MonthlyPurchase;
import com.domin.MonthlySales;
import com.domin.Product;
import com.google.gson.Gson;
import com.service.BuyOrderService;
import com.service.ProductService;
import com.service.SalesOrderService;

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

@WebServlet(name = "StatisticsServlet", urlPatterns = "/StatisticsServlet")
public class StatisticsServlet extends HttpServlet {
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


    //获取商品的采购数量与销售数量统计
    private void getNumber(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String year = request.getParameter("year");

        BuyOrderService buyOrderService = BuyOrderService.newInstance();
        List<MonthlyPurchase> monthlyPurchasesList = buyOrderService.findMonth(id, year);

        SalesOrderService salesOrderService = SalesOrderService.newInstance();
        List<MonthlySales> monthlySalesList = salesOrderService.findMonth(id, year);


        int[] purchasesNumber = new int[12];
        int[] salesNumber = new int[12];


        for (int i = 0; i < purchasesNumber.length; i++) {
            for (MonthlyPurchase purchase: monthlyPurchasesList){
                if (i+1 == purchase.getMonth())
                    purchasesNumber[i] = (int) purchase.getSumNumber();
            }
        }

        for (int i = 0; i < salesNumber.length; i++) {
            for (MonthlySales monthlySales: monthlySalesList){
                if (i+1 == monthlySales.getMonth())
                    salesNumber[i] = monthlySales.getSumNumber();
            }
        }

        Map<String, int[]> map = new HashMap<>();
        map.put("purchase", purchasesNumber);
        map.put("sales", salesNumber);

        Gson gson = new Gson();
        String jsonStr = gson.toJson(map);
        response.setContentType("text/javascript");
        response.getWriter().print(jsonStr);
    }

    //获取商品采购总价格与销售总价格统计
    private void getPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String year = request.getParameter("year");


        BuyOrderService buyOrderService = BuyOrderService.newInstance();
        List<MonthlyPurchase> monthlyPurchasesList = buyOrderService.findMonth(id, year);

        SalesOrderService salesOrderService = SalesOrderService.newInstance();
        List<MonthlySales> monthlySalesList = salesOrderService.findMonth(id, year);

        int[] purchasesPrice = new int[12];
        int[] salesPrice = new int[12];

        for (int i = 0; i < purchasesPrice.length; i++) {
            for (MonthlyPurchase purchase: monthlyPurchasesList){
                if (i+1 == purchase.getMonth())
                    purchasesPrice[i] = (int) purchase.getSumPrice();
            }
        }

        for (int i = 0; i < salesPrice.length; i++) {
            for (MonthlySales sales: monthlySalesList){
                if (i+1 == sales.getMonth())
                    salesPrice[i] = (int) sales.getSumPrice();
            }
        }

        Map<String, int[]> map = new HashMap<>();
        map.put("purchase", purchasesPrice);
        map.put("sales", salesPrice);


        Gson gson = new Gson();
        String jsonStr = gson.toJson(map);
        response.setContentType("text/javascript");
        response.getWriter().print(jsonStr);
    }

    private void getProductAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String year = request.getParameter("year");


        BuyOrderService buyOrderService = BuyOrderService.newInstance();
        List<MonthlyPurchase> monthlyPurchasesList = buyOrderService.findMonth(id, year);

        SalesOrderService salesOrderService = SalesOrderService.newInstance();
        List<MonthlySales> monthlySalesList = salesOrderService.findMonth(id, year);


        int[] purchasesNumber = new int[12];
        int[] salesNumber = new int[12];


        for (int i = 0; i < purchasesNumber.length; i++) {
            for (MonthlyPurchase purchase: monthlyPurchasesList){
                if (i+1 == purchase.getMonth())
                    purchasesNumber[i] = (int) purchase.getSumNumber();
            }
        }

        for (int i = 0; i < salesNumber.length; i++) {
            for (MonthlySales monthlySales: monthlySalesList){
                if (i+1 == monthlySales.getMonth())
                    salesNumber[i] = monthlySales.getSumNumber();
            }
        }

        Map<String, int[]> map = new HashMap<>();
        map.put("purchase", purchasesNumber);
        map.put("sales", salesNumber);

        Gson gson = new Gson();
        String jsonStr = gson.toJson(map);
        response.setContentType("text/javascript");
        response.getWriter().print(jsonStr);
    }

    private void jump(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService service = ProductService.newInstance();

        List<Product> productList = service.findAll();

        request.setAttribute("productList", productList);

        request.getRequestDispatcher("statistics.jsp").forward(request, response);
    }
}
