package Controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Users;
import business.UserBusiness;


@WebServlet("/UserControler")
public class UserControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserControler() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//doGet(request, response);
		
		
		
		PrintWriter out = response.getWriter();
		String username = request.getParameter("txtusername");
		String pasword = request.getParameter("password");
		HttpSession session = request.getSession();
		//String message = request.getParameter("info");
		
		UserBusiness userBusiness = new UserBusiness();
		Users user = userBusiness.finduser(username, pasword);
		
		
		if(user == null){
			
			String message = "Invalid user, please check your username and password";
			
			session.setAttribute("message", message);
			//System.out.println("Hallow from nul");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}
		else{
			
			
			session.removeAttribute("message");
			session.setAttribute("logedinuser", user);
			//out.println(user.getFullname());
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/home.jsp");
			dispatcher.forward(request, response);
		}
		
		
		//session.removeAttribute("logedinuser"); // to remove the user
	}

}
