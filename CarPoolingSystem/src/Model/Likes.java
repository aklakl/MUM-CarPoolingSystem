package Model;

public class Likes {

	private int likeid;
	private int userid;
	private int postid; // private Post postid;
	
	public Likes() {
		
	}
	
	
	public Likes(int likeid) {
		this.likeid = likeid;
	}
	
	
	public int getLikeid() {
		return likeid;
	}
	public void setLikeid(int likeid) {
		this.likeid = likeid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(/*Post*/ int postid) {
		this.postid = postid;
	}
	
}
