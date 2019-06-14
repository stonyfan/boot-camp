package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.MyDBAccess;
import model.DBConfigFile;
/**
 * Servlet implementation class ServletSample
 */
@WebServlet("/ListServlet")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ListServlet() {
        super();
  
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		ServletContext sce = getServletContext();
		DBConfigFile dbProperties = (DBConfigFile) sce.getAttribute("dbProperties");
		
		MyDBAccess db = new MyDBAccess(dbProperties.getDriver(),
										dbProperties.getUrl(),
										dbProperties.getUser(),
										dbProperties.getPassword());
		request.setAttribute("articles",db.sqlList());
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/List.jsp").forward(request,response);
	}

}
