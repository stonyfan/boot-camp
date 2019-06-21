package servlet;

import java.io.IOException;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBConfigFile;
import service.MyDBAccess;

/**
 * Servlet implementation class CreateServlet
 */
@WebServlet("/CreateServlet")
public class CreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String a ="ListServlet";
	    response.sendRedirect(a);
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ServletContext sce = getServletContext();
		DBConfigFile dbProperties = (DBConfigFile) sce.getAttribute("dbProperties");
		
		MyDBAccess db = new MyDBAccess(dbProperties.getDriver(),
										dbProperties.getUrl(),
										dbProperties.getUser(),
										dbProperties.getPassword());
		String nameCreate = request.getParameter("name");
		System.out.println(nameCreate);
		db.createData(nameCreate);
	    String a ="ListServlet";
	    response.sendRedirect(a);
	}

}
