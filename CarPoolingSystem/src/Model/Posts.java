package Model;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;

public class Posts {
	
	private int postid;
	private int userid;
	private String post;
	private int posttype;
	private List<Comments>commensts;
	//private LocalDate date;
	
	/*public LocalDate getDate() {
		
		return LocalDate.of(date.getYear(), date.getMonth(), date.getDayOfMonth());
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}*/
	public int getPostid() {
		return postid;
	}
	public List<Comments> getCommensts() {
		return commensts;
	}
	public void setCommensts(List<Comments> commensts) {
		this.commensts = commensts;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public int getPosttype() {
		return posttype;
	}
	public void setPosttype(int posttype) {
		this.posttype = posttype;
	}
	
}
