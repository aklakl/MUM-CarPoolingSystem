package business;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonObject;

import Model.*;
import dao.DataAccess;
import util.JsonUtil;


public class CommentBusiness {

	public CommentBusiness() {
		
	}
	
	public void getCommentByPost(Posts p){
		String sqlCondition = " where postid ='"+p.getPostid()+"'";
		List<Comments> comment = new ArrayList<Comments>();
		DataAccess ds = new DataAccess();
		comment = (List)ds.search( new Comments(), sqlCondition);
		p.setCommensts(comment);
		//return p;
	}
	
	public JsonObject addComment(String jsonStr) {
		JsonObject result = new JsonObject();
		DataAccess<Comments> dataAccess = new DataAccess<Comments>();
		Comments comments = (Comments)JsonUtil.JSONToObject(jsonStr, Comments.class); 
		boolean executeResult = dataAccess.add(comments);
		result.addProperty("result", executeResult);
		return result;
	}
	
	public Object deleteComment(String jsonStr) {
		JsonObject result = new JsonObject();
		DataAccess<Comments> dataAccess = new DataAccess<Comments>();
		Comments comments = (Comments)JsonUtil.JSONToObject(jsonStr, Comments.class); 
		boolean executeResult;
		try {
			executeResult = dataAccess.delete(comments);
			result.addProperty("result", executeResult);
		} catch (Exception e) {
			e.printStackTrace();
			result.addProperty("error", e.toString());
		}
		return result;
	}
	
	
	
}