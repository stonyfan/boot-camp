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
 * Servlet implementation class ModifyServlet
 */
@WebServlet("/ModifyServlet")
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		ServletContext sce = getServletContext();
		DBConfigFile dbProperties = (DBConfigFile) sce.getAttribute("dbProperties");
		
		MyDBAccess db = new MyDBAccess(dbProperties.getDriver(),
										dbProperties.getUrl(),
										dbProperties.getUser(),
										dbProperties.getPassword());
		
		String[] modifyId =request.getParameterValues("hoge");
		if(modifyId!=null) {
		int id =  Integer.parseInt(modifyId[0]);
		String modifyName = request.getParameter("modify");
		System.out.println(modifyName);
		
		db.modifyData(modifyName,id);
		}
	    String a ="ListServlet";
	    response.sendRedirect(a);
	}

}
