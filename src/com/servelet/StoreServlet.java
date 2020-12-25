package com.servelet;

import com.dao.StoreDao;
import com.dao.impl.StoreDaoImpl;
import com.domin.Store;
import com.service.StoreService;
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
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

@WebServlet(name = "StoreServlet", urlPatterns = "/StoreServlet")
public class StoreServlet extends HttpServlet {
    private StoreService service = StoreService.newInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
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

    protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Store> storeList = service.findAll();

        request.getServletContext().setAttribute("storeList", storeList);

        request.getRequestDispatcher("store.jsp").forward(request, response);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();


        service.delete(request.getParameter("id"));

        List<Store> storeList = service.findAll();

        request.getServletContext().setAttribute("storeList", storeList);

        writer.print("OK");

    }

    protected void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Store store = new Store();

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
                        BeanUtils.setProperty(store, name, value);
                    } else {// 上传内容
                        String fieldName = item.getFieldName();
                        String path = getServletContext().getRealPath("/upload");
                        File f = new File(path);
                        if (!f.exists()) {
                            f.mkdir();
                        }
                        // 全部绝对路径
                        String name = item.getName();

                        BeanUtils.setProperty(store, fieldName, "upload/" + name);

                        // 拼接文件名
                        File file = new File(path, name);
                        // 上传
                        if (!file.isDirectory()) {
                            item.write(file);
                        }
                        item.delete(); // 删除组件运行时产生的临时文件
                    }
                }
                service.add(store);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            this.findAll(request, response);
        }
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();

        Store store = new Store();

        store.setStoreId(request.getParameter("id"));
        store.setStoreName(request.getParameter("name"));
        store.setAddress(request.getParameter("address"));
        store.setStoreDescribe(request.getParameter("describe"));

        service.update(store);

        List<Store> storeList = service.findAll();

        request.getServletContext().setAttribute("storeList", storeList);

        writer.print("OK");
    }
}
