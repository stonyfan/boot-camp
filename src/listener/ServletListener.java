package listener;


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import model.DBConfigFile;


/**
 * Application Lifecycle Listener implementation class ServletListener
 *
 */
@WebListener
public class ServletListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ServletListener() {
        // TODO Auto-generated constructor stub
    	
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	//String path = sce.getServletContext().getRealPath("/WEB-INF/db.properties");
    	String path = sce.getServletContext().getRealPath("/WEB-INF/db-home.properties");
    	DBConfigFile dbProperties =new DBConfigFile();
    	dbProperties.getDbProperties(path);
		sce.getServletContext().setAttribute("dbProperties",dbProperties);
    }
	
}
