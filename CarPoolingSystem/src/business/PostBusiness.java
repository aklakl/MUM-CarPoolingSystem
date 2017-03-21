package business;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import util.JsonUtil;
import Model.Posts;
import dao.DataAccess;

public class PostBusiness {

	public PostBusiness() {
		// TODO Auto-generated constructor stub
	}

	public Object add(String jsonStr) {
		System.out.println("jsonStr:"+jsonStr);
		DataAccess<Posts> dataAccess = new DataAccess<Posts>();
		Posts post = (Posts)JsonUtil.JSONToObject(jsonStr, Posts.class); 
		return dataAccess.add(post);
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
