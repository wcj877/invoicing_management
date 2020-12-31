package com.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;

//统计在线人数
@WebListener()
public class PopulationListener implements ServletContextListener, HttpSessionListener,
        HttpSessionAttributeListener {

    // Public constructor is required by servlet spec
    public PopulationListener() {
    }

    // -------------------------------------------------------
    // ServletContextListener implementation
    // -------------------------------------------------------
    public void contextInitialized(ServletContextEvent sce) {
      /* This method is called when the servlet context is
         initialized(when the Web application is deployed). 
         You can initialize servlet context related data here.
      */
    }

    public void contextDestroyed(ServletContextEvent sce) {
      /* This method is invoked when the Servlet Context 
         (the Web application) is undeployed or 
         Application Server shuts down.
      */
    }

    // -------------------------------------------------------
    // HttpSessionListener implementation
    // -------------------------------------------------------
    public void sessionCreated(HttpSessionEvent se) {
        ServletContext application = se.getSession().getServletContext();

        Integer onlineNumber = (Integer) application.getAttribute("onlineNumber");

        if (onlineNumber == null)
            onlineNumber = 0;
        onlineNumber++;

        application.setAttribute("onlineNumber", onlineNumber);
        System.out.println("新增一位在线用户");

    }

    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
        ServletContext application = se.getSession().getServletContext();
        Integer onlineNumber = (Integer) application.getAttribute("onlineNumber");

        onlineNumber--;

        application.setAttribute("onlineNumber", onlineNumber);
        System.out.println("减少一位在线用户");
    }

    // -------------------------------------------------------
    // HttpSessionAttributeListener implementation
    // -------------------------------------------------------

    public void attributeAdded(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute 
         is added to a session.
      */
        System.out.println("session 增加属性 ");
        System.out.println("属性是" + sbe.getName());
        System.out.println("值是" + sbe.getValue());
    }

    public void attributeRemoved(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute
         is removed from a session.
      */
    }

    public void attributeReplaced(HttpSessionBindingEvent sbe) {
      /* This method is invoked when an attibute
         is replaced in a session.
      */
    }
}
