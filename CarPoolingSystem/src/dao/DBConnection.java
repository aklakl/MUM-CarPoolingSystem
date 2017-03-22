package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	static String dburl = "jdbc:mysql://localhost:3306/carpoolingdb";
	
	static Connection con ;//
			
	public static Connection getConection(){
		
		if (con == null){
			try {
				con = DriverManager.getConnection(dburl, "root", "");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return con;
	}

    public DBConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.out.println("MySQL JDBC driver not found in DBConnection\n" + ex);
            System.exit(0);
        }
    }

    public static void main(String[] arg){
    	Connection connection = DBConnection.getConection();
    	try {
			connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }


   

}

