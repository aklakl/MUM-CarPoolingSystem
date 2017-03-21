package Model;

public class Comments {

	private int commentid;
	private Users userid;
	private Posts postid;
	private String comment;
	
	
	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
	public Users getUserid() {
		return userid;
	}
	public void setUserid(Users userid) {
		this.userid = userid;
	}
	public Posts getPostid() {
		return postid;
	}
	public void setPostid(Posts postid) {
		this.postid = postid;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
		
	
}

