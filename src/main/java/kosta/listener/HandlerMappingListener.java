package kosta.listener;

import kosta.controller.Controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

/**
 * ������ ���۵ɶ� �� Controller�� ������ü�� �̸� �����ؼ� Map�� ������ ��
 * ServletContext������ map�� �����Ѵ�.
 */
@WebListener
public class HandlerMappingListener implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent sce) {
    }


    public void contextInitialized(ServletContextEvent e) {


        ServletContext application = e.getServletContext();
        String fileName = application.getInitParameter("fileName");
        System.out.println("fileName= " + fileName);

        ResourceBundle rb = ResourceBundle.getBundle(fileName);

        System.out.println();

        try {
            Map<String, Controller> map = new HashMap<String, Controller>();
            Map<String, Class<?>> clzMap = new HashMap<String, Class<?>>();

            for (String key : rb.keySet()) {
                String value = rb.getString(key);

                Class<?> className = Class.forName(value);
                Controller con = (Controller) className.getDeclaredConstructor().newInstance();//reflection

                map.put(key, con);
                clzMap.put(key, className);

                System.out.println(key + " = " + con);
            }

            //���� ������Ʈ�� ��� �������� map�� ����� �� �ֵ��� ServletContext������ �����Ѵ�.

            application.setAttribute("map", map);
            application.setAttribute("clzMap", clzMap);
            application.setAttribute("path", application.getContextPath());//${path}


        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}


