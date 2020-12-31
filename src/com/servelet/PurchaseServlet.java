package com.servelet;

import com.domin.BuyOrder;
import com.domin.Product;
import com.domin.Supplier;
import com.service.BuyOrderService;
import com.service.ProductService;
import com.service.SupplierService;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "PurchaseServlet", urlPatterns = "/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {

    BuyOrderService service = BuyOrderService.newInstance();

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


    protected void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BuyOrder buyOrder = new BuyOrder();

        try {
            //采用默认临界值和系统临时文件夹构造文件项工厂对象
            FileItemFactory factory = new DiskFileItemFactory();
//使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setFileSizeMax(10 * 1024 * 1024); // 单个文件大小限制
            upload.setSizeMax(50 * 1024 * 1024); // 总文件大小限制
            upload.setHeaderEncoding("UTF-8"); // 对中文文件编码处理

            //用于判断是普通表单，还是带文件上传的表单
            if (upload.isMultipartContent(request)) {

                //使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
                List<FileItem> list = upload.parseRequest(request);
                for (FileItem item : list) {

                    if (item.isFormField()) {// 普通本文内容
                        String name = item.getFieldName();
                        // 获取值
                        String value = item.getString();
                        value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
                        BeanUtils.setProperty(buyOrder, name, value);
                    } else {// 上传内容
                        String fieldName = item.getFieldName();
                        String path = getServletContext().getRealPath("/upload");
                        File f = new File(path);
                        if (!f.exists()) {
                            f.mkdir();
                        }
                        // 全部绝对路径
                        String name = item.getName();

                        BeanUtils.setProperty(buyOrder, fieldName, "upload/" + name);

                        // 拼接文件名
                        File file = new File(path, name);
                        // 上传
                        if (!file.isDirectory()) {
                            item.write(file);
                        }
                        item.delete(); // 删除组件运行时产生的临时文件
                    }
                }

                SimpleDateFormat formatter= new SimpleDateFormat("yyyyMMddHHmmss");
                SimpleDateFormat formatterDate= new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                Date date = new Date(System.currentTimeMillis());

                buyOrder.setBuyOrderId("cg" + formatter.format(date));
                buyOrder.setTime(formatterDate.format(date));
//                buyOrder.setStaffId(request.getSession().getAttribute("id"));
                buyOrder.setStaffId("511221");

                service.add(buyOrder);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            this.findAll(request, response);
        }
    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BuyOrder> buyOrderList = service.findAll();

        SupplierService supplierService = SupplierService.newInstance();
        List<Supplier> supplierList = supplierService.findAll();//获取所有供应商

        ProductService productService = ProductService.newInstance();
        List<Product> productList = productService.findAll();//获取所有商品

        request.setAttribute("buyOrderList", buyOrderList);
        request.setAttribute("supplierList", supplierList);
        request.setAttribute("productList", productList);

        request.getRequestDispatcher("purchase.jsp").forward(request, response);
    }

}
