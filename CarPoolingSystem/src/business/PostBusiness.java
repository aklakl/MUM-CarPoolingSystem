package business;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import util.JsonUtil;
import Model.Post;
import dao.DataAccess;

public class PostBusiness {

	public PostBusiness() {
		// TODO Auto-generated constructor stub
	}

	public Object add(String jsonStr) {
		System.out.println("jsonStr:"+jsonStr);
		DataAccess<Post> dataAccess = new DataAccess<Post>();
		Post post = (Post)JsonUtil.JSONToObject(jsonStr, Post.class); 
		return dataAccess.add(post);
	}
	
	
	
}
