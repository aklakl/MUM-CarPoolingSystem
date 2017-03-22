package business;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonObject;

import Model.Comments;
import Model.Likes;
import Model.Posts;
import dao.DataAccess;
import util.JsonUtil;

public class LikeBusiness {

	public LikeBusiness() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public void getLikeByPost(Posts p){
		String sqlCondition = " where postid ='"+p.getPostid()+"'";
		List<Likes> likes = new ArrayList<Likes>();
		DataAccess ds = new DataAccess();
		likes = (List)ds.search( new Likes(), sqlCondition);
		p.setLikes(likes);
		//return p;
	}
	
	public Object addLikes(String jsonStr) {
		JsonObject result = new JsonObject();
		DataAccess<Likes> dataAccess = new DataAccess<Likes>();
		Likes likes = (Likes)JsonUtil.JSONToObject(jsonStr, Likes.class); 
		boolean executeResult = dataAccess.add(likes);
		result.addProperty("result", executeResult);
		return result;
	}

}

