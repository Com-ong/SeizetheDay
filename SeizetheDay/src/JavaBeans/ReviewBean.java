package JavaBeans;

import java.util.Date;

public class ReviewBean {
	
	private int commentSeq;
	private int userSeq;        
	private int exhibitionSeq;      
	private Date commentDate;     
	private String commentText;     
	
	public int getCommentSeq() {
		return commentSeq;
	}
	public void setCommentSeq(int commentSeq) {
		this.commentSeq = commentSeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getExibitionSeq() {
		return exhibitionSeq;
	}
	public void setExhibitionSeq(int exhibitionSeq) {
		this.exhibitionSeq = exhibitionSeq;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
}