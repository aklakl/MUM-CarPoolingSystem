package Controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Likes;
import dao.DBConnection;
import dao.DataAccess;


@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Home() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Connection connection = DBConnection.getConection();
		try {
			Statement statement = connection.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		Likes l = new Likes(3);
		DataAccess da = new DataAccess();
		try {
			da.delete(l);
			System.out.println("Deleted");
		} catch (IllegalArgumentException | IllegalAccessException | SQLException e) {
			e.printStackTrace();
		}
		
		
		l.setPostid(2542);
		da.update(l);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		
	}

}
