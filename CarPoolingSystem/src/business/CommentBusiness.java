package business;

import java.util.ArrayList;
import java.util.List;

import Model.*;
import dao.DataAccess;


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
}