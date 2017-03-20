package Controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.JsonUtil;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		JsonObject jsonObject = new JsonObject();
		try {
			jsonObject = dealWithAJAx(request);
		    out.write(jsonObject.toString());
		} catch (Exception e) {
		    e.printStackTrace();
		    jsonObject.addProperty("error", e.toString());
		    out.write(jsonObject.toString());
		} finally {
		    if (out != null) {
		        out.close();
		    }
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	//{businessClass:"xxxclass",method:"search",parameters:"self to analytical"}
	public JsonObject dealWithAJAx(HttpServletRequest request) throws Exception  { //throws Exception
		JsonObject  result = new JsonObject();
		String businessClass = request.getParameter("businessClass");
		String methodName = request.getParameter("methodName");
		String parameters = request.getParameter("parameters");
		Class clz;
		String className = "business."+businessClass;
		try {
			//JsonArray jsonParameters = JsonUtil.jsonStringToJsonArray(parameters.toString());
			clz = Class.forName(className);
			Object obj = clz.newInstance();
			Method m = obj.getClass().getDeclaredMethod(methodName, String.class);
			System.out.println(this.getClass().getSimpleName()+"|parameters:"+parameters);
			result = (JsonObject) m.invoke(obj, parameters);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			result.addProperty("error", e.toString());
		} finally {
			
		}
		return result; 
	}
	
 
	
	public static void main(String[] args) throws SQLException, IllegalArgumentException, IllegalAccessException {
		String className = "business.PostBusiness";
		String methodName = "add";
		Class clz;
		try {
			clz = Class.forName(className);
			Object obj = clz.newInstance();
			Method m = obj.getClass().getDeclaredMethod(methodName, String.class);
			String  result = (String) m.invoke(obj, "aaaaa");
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
