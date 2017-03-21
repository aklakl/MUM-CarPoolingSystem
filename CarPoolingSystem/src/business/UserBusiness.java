package business;

import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Model.Users;
import dao.DataAccess;
import util.JsonUtil;

public class UserBusiness {

	public UserBusiness() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	//modify by mingli
	public JsonObject addUser(String jsonStr) {
		JsonObject result = new JsonObject();
		DataAccess<Users> dataAccess = new DataAccess<Users>();
		Users users = (Users)JsonUtil.JSONToObject(jsonStr, Users.class); 
		boolean executeResult = dataAccess.add(users);
		result.addProperty("result", executeResult);
		return result;
	}
	
	public JsonObject searchUser(String jsonStr) {
		JsonObject result = new JsonObject();
		DataAccess<Users> dataAccess = new DataAccess<Users>();
		JsonObject jparamters =  JsonUtil.jsonStringToJsonObject(jsonStr);
		String sqlParamter = "";
		if (jparamters.get("sqlParamter")!=null){
			sqlParamter = jparamters.get("sqlParamter").getAsString();
		}
		List<Users> list = (List<Users>)dataAccess.search(new Users(),sqlParamter );
		Gson gson = new Gson();
		String str = gson.toJson(list);
		result.addProperty("datalist", str);
		result.addProperty("result", "ok");
		result.addProperty("count", list.size());
		return result;
	}
	
	public JsonObject saveUser(String jsonStr) {
		JsonObject result = new JsonObject();
		DataAccess<Users> dataAccess = new DataAccess<Users>();
		Users users = (Users)JsonUtil.JSONToObject(jsonStr, Users.class); 
		boolean executeResult = dataAccess.update(users);
		result.addProperty("result", executeResult);
		return result;
	}
	
	public Users finduser(String username, String password){
		String sqlCondition = " where email ='"+username+"' and  password='"+password+"'";
		//select * from  USERS  where email ='123' and password='123';
		Users u = null ;
		//u.setEmail(username);
		//u.setPassword(password);
		DataAccess ds = new DataAccess();
		List<Users> users = (List)ds.search( new Users(), sqlCondition);
		if (users.size()>1){
			//you have too many user to match;
			
		}else if (users.size()==0){
			//no mathc users 
		}else if (users.size()==1){
			//match user
			u = users.get(0);
		} 
		
		return u;
		
	} 
	
}
