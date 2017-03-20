package business;

import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Model.Post;
import dao.DataAccess;
import util.JsonUtil;

public class PostBusiness {

	public PostBusiness() {
		// TODO Auto-generated constructor stub
	}

	public Object addPost(String jsonStr) {
		JsonObject result = new JsonObject();
		DataAccess<Post> dataAccess = new DataAccess<Post>();
		Post post = (Post)JsonUtil.JSONToObject(jsonStr, Post.class); 
		boolean executeResult = dataAccess.add(post);
		result.addProperty("result", executeResult);
		return result;
	}
	
	public JsonObject searchPost(String jsonStr) {
		JsonObject result = new JsonObject();
		DataAccess<Post> dataAccess = new DataAccess<Post>();
		JsonObject jparamters =  JsonUtil.jsonStringToJsonObject(jsonStr);
		String sqlParamter = "";
		if (jparamters.get("sqlParamter")!=null){
			sqlParamter = jparamters.get("sqlParamter").toString();
		}
		List<Post> list = (List<Post>)dataAccess.search(new Post(),sqlParamter );
		Gson gson = new Gson();
		String str = gson.toJson(list);
		result.addProperty("datalist", str);
		result.addProperty("result", "ok");
		result.addProperty("count", list.size());
		return result;
	}
 
	public Object deletePost(String jsonStr) {
		JsonObject result = new JsonObject();
		DataAccess<Post> dataAccess = new DataAccess<Post>();
		Post post = (Post)JsonUtil.JSONToObject(jsonStr, Post.class); 
		boolean executeResult;
		try {
			executeResult = dataAccess.delete(post);
			result.addProperty("result", executeResult);
		} catch (Exception e) {
			e.printStackTrace();
			result.addProperty("error", e.toString());
		}
		return result;
	}
	
	
}
