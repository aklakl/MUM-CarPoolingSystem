package business;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import util.JsonUtil;
import Model.Posts;
import dao.DataAccess;
import util.JsonUtil;

public class PostBusiness {

	public PostBusiness() {
		
	}

	public Object addPost(String jsonStr) {
		JsonObject result = new JsonObject();
		DataAccess<Posts> dataAccess = new DataAccess<Posts>();
		Posts posts = (Posts)JsonUtil.JSONToObject(jsonStr, Posts.class); 
		boolean executeResult = dataAccess.add(posts);
		result.addProperty("result", executeResult);
		return result;
	}
	
	public JsonObject searchPost(String jsonStr) {
		JsonObject result = new JsonObject();
		DataAccess<Posts> dataAccess = new DataAccess<Posts>();
		JsonObject jparamters =  JsonUtil.jsonStringToJsonObject(jsonStr);
		String sqlParamter = "";
		if (jparamters.get("sqlParamter")!=null){
			sqlParamter = jparamters.get("sqlParamter").toString();
		}
		List<Posts> list = (List<Posts>)dataAccess.search(new Posts(),sqlParamter );
		Gson gson = new Gson();
		String str = gson.toJson(list);
		result.addProperty("datalist", str);
		result.addProperty("result", "ok");
		result.addProperty("count", list.size());
		return result;
	}
 
	public Object deletePost(String jsonStr) {
		JsonObject result = new JsonObject();
		DataAccess<Posts> dataAccess = new DataAccess<Posts>();
		Posts post = (Posts)JsonUtil.JSONToObject(jsonStr, Posts.class); 
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
	
	public List<Posts> findpost(/*int userid*/){
		String sqlCondition = "";
		
		List<Posts> post = new ArrayList<Posts>();
		DataAccess ds = new DataAccess();
		post = (List)ds.search( new Posts(), sqlCondition);
		getComment(post);
		return post;
		
	} 
	
	
	
	public void getComment(List<Posts> post){
		for(Posts p : post){
			CommentBusiness cb = new CommentBusiness();
			cb.getCommentByPost(p);
		}
		
				
	}
	
	
}
