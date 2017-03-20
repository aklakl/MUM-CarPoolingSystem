package business;

import com.google.gson.JsonObject;

import util.JsonUtil;
import Model.Users;
import dao.DataAccess;

public class UserBusiness {

	public UserBusiness() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	public JsonObject addUser(String jsonStr) {
		JsonObject result = new JsonObject();
		System.out.println("addUser jsonStr:"+jsonStr);
		DataAccess<Users> dataAccess = new DataAccess<Users>();
		Users users = (Users)JsonUtil.JSONToObject(jsonStr, Users.class); 
		boolean executeResult = dataAccess.add(users);
		result.addProperty("result", executeResult);
		return result;
	}
	
}
