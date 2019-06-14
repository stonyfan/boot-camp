package model;

import java.util.Properties;
import java.io.FileInputStream;
import java.io.InputStream;

public class DBConfigFile {

	private Properties properties;
	
	
	public void getDbProperties(String dbProperties) {
	    properties=new Properties();
		try {	
		InputStream inputStream = new FileInputStream(dbProperties);
		properties.load(inputStream);
		inputStream.close();
		}catch(Exception ex) {
			System.out.println("Faild to read db.properties");
		}
	}
	
	public String getDriver() {
		return properties.getProperty("driver");
	}
	public String getUrl() {
		return properties.getProperty("url");
	}
	public String getUser() {
		return properties.getProperty("user");
	}
	public String getPassword() {
		return properties.getProperty("password");
	}
	
}
