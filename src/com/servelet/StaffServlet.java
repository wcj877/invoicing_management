package com.servelet;

import com.dao.StaffDao;
import com.dao.impl.StaffDaoImpl;
import com.domin.Staff;
import com.domin.Store;
import com.service.StaffService;
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
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

@WebServlet(name = "StaffServlet", urlPatterns = "/StaffServlet")
public class StaffServlet extends HttpServlet {
    private StaffService service = StaffService.newInstance();

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

    //获取所有员工信息
    protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Staff> staffList = service.finAll();
        request.setAttribute("staffList", staffList);

        request.getRequestDispatcher("staff.jsp").forward(request, response);
    }

    //删除员工
    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter writer = resp.getWriter();
        service.delete(req.getParameter("id"));
        writer.print("OK");
    }

    //添加员工
    protected void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Staff staff = new Staff();

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
                        BeanUtils.setProperty(staff, name, value);
                    } else {// 上传内容
                        String fieldName = item.getFieldName();
                        String path = getServletContext().getRealPath("/upload");
                        File f = new File(path);
                        if (!f.exists()) {
                            f.mkdir();
                        }
                        // 全部绝对路径
                        String name = item.getName();

                        BeanUtils.setProperty(staff, fieldName, "upload/" + name);

                        // 拼接文件名
                        File file = new File(path, name);
                        // 上传
                        if (!file.isDirectory()) {
                            item.write(file);
                        }
                        item.delete(); // 删除组件运行时产生的临时文件
                    }
                }


                service.add(staff);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            this.findAll(request, response);
        }
    }

    //修改员工
    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();

        Staff staff = new Staff();

        staff.setStaffId(request.getParameter("id"));
        staff.setStaffName(request.getParameter("name"));
        staff.setDuty(request.getParameter("duty"));
        staff.setPassword(request.getParameter("password"));

        service.update(staff);

        writer.print("OK");
    }

    //获取员工信息验证账号与密码是否正确
    protected void findStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Staff staff = new Staff();

        try {
            //采用默认临界值和系统临时文件夹构造文件项工厂对象
            FileItemFactory factory = new DiskFileItemFactory();
//使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            ServletFileUpload upload = new ServletFileUpload(factory);
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
                        BeanUtils.setProperty(staff, name, value);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        Staff staff1 = service.findStaff(staff.getStaffId(), staff.getPassword());
        if (staff1 != null){
            session.setAttribute("name", staff1.getStaffName());
            session.setAttribute("id", staff.getStaffId());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "账号或密码错误");
            request.getRequestDispatcher("auth-login.jsp").forward(request, response);
        }
    }
}
