package com.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AuthFilter", urlPatterns = "/*")
public class AuthFilter implements Filter {
    public void destroy() {
    }

    /**
     * 当用户的登录状态异常是跳转到登录界面
     * 异常状态包括session失效和未登录就要跳转到其他页面
     * @param req
     * @param resp
     * @param chain
     * @throws ServletException
     * @throws IOException
     */
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String uri = request.getRequestURI();
        if (uri.endsWith("auth-login.jsp") || uri.endsWith("StaffServlet")){
            chain.doFilter(request, response);
            return;
        }

        String id = (String) request.getSession().getAttribute("id");

        if (id == null){
            response.sendRedirect("auth-login.jsp");
            return;
        }

        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
