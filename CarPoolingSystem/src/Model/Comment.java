package Model;

public class Comment {

	private int commentid;
	private Users userid;
	private Post postid;
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
	public Post getPostid() {
		return postid;
	}
	public void setPostid(Post postid) {
		this.postid = postid;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
		
	
}

