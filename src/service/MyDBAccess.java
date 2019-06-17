package service;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import model.list;

public class MyDBAccess {
	
	private String driver;
	private  String url;
	private  String user;
	private  String password ;

   private Connection connection;
   private Statement statement;
   private ResultSet resultset;
   private ArrayList<list> sqllist;
  
   
   public MyDBAccess(String driver, String url, String user, String password) {
       this.driver = driver;
       this.url = url;
       this.user = user;
       this.password = password;
   }

 
    
   public synchronized void open() throws Exception {
       Class.forName(driver);
       connection = DriverManager.getConnection(url, user, password);
       statement = connection.createStatement();
   }

   public ResultSet getResultSet(String sql) throws Exception {
       if ( statement.execute(sql) ) {
           return statement.getResultSet();
       }
       return null;
   }
   
   public Connection getConnections() {
	return connection;
}

   public void execute(String sql) throws Exception {
       statement.execute(sql);
   }

   public synchronized void close() throws Exception {
       if ( resultset != null ) resultset.close();
       if ( statement != null ) statement.close();
       if ( connection != null ) connection.close();
   }
   
     
   public ArrayList<list> sqlList() {
	   try {
		   open();
		   ResultSet rs = getResultSet("select * from sample order by id");
	    	 this.sqllist= new ArrayList<list>();
			  while(rs.next()) {
			        int id = rs.getInt("id"); 
			        String name = rs.getString("name"); 
			        Date created = rs.getDate("created");
			        Date modified = rs.getDate("modified");
			        sqllist.add(new list(id,name,created,modified));
			    }
			 
			 close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
	   return sqllist;
   }
   
  public void deleteData(String[] delDatas) {
	  try {
		  open();
		  int delDataLength=delDatas.length;
			while(delDataLength>0){	    
		    	delDataLength--;
				String sql = "delete from sample where id = ?";
				PreparedStatement stmt =connection.prepareStatement(sql);
			
				stmt.setString(1, delDatas[delDataLength]);
				stmt.executeUpdate();
		}
			close();
	  }catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  }
   
   public void createData(String name) {
	
	    try {
			open();			
			String sql = "insert into sample (name,created,modified) values (?,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.executeUpdate();
		close();
		} catch (Exception e) {
			e.printStackTrace();
		}
   }
}

