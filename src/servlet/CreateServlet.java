package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBConfigFile;
import model.list;
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


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doPost(request, response);
		///get db(config) path
		ServletContext context= this.getServletContext();
		String path = context.getRealPath("/WEB-INF/db.properties");
		
		//get db(config) value 
		DBConfigFile dbP =new DBConfigFile();
		dbP.getDbProperties(path);
		
		// connect to DB by db(config) value   
		MyDBAccess db = new MyDBAccess(dbP.getDriver(),dbP.getUrl(),dbP.getUser(),dbP.getPassword());
		String nameCreate = request.getParameter("name");
		String nameC = request.getParameter("create");
		System.out.println(nameC);
	    try {
	    	List<list> list= new ArrayList<list>();
			db.open();
			Connection conn=db.getConnections();
			String sql = "insert into sample (name,created,modified) values (?,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)";
			//
			PreparedStatement stmt = conn.prepareStatement(sql);
			Timestamp current = new Timestamp(System.currentTimeMillis());
			stmt.setString(1, nameCreate);

			stmt.executeUpdate();

			db.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    String a ="ListServlet";
	    response.sendRedirect(a);
	}

}
