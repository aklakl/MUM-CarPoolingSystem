package Model;

import java.util.Date;
import java.util.List;

public class Posts {
	
	private int postid;
	private int userid;
	private String post;
	private int posttype;
	private Date datecreated;
	private Date dateupdated;
	private List<Comments>commensts;
	private List<Likes> likes;
	
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
	public Date getDatecreated() {
		return datecreated;
	}
	public void setDatecreated(Date datecreated) {
		this.datecreated = datecreated;
	}
	public Date getDateupdated() {
		return dateupdated;
	}
	public void setDateupdated(Date dateupdated) {
		this.dateupdated = dateupdated;
	}
	public List<Likes> getLikes() {
		return likes;
	}
	public void setLikes(List<Likes> likes) {
		this.likes = likes;
	}
 
}
