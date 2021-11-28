package comment;

import java.util.Date;

public class CommentDTO {
	private String boardID;
	private String commentUser;
	private String commentDate;
	private String CommentContent;
	
	public String getCommentUser() {
		return commentUser;
	}
	public String getBoardID() {
		return boardID;
	}
	public void setBoardID(String boardID) {
		this.boardID = boardID;
	}
	public void setCommentUser(String commentUser) {
		this.commentUser = commentUser;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String nowday) {
		this.commentDate = nowday;
	}
	public String getCommentContent() {
		return CommentContent;
	}
	public void setCommentContent(String commentContent) {
		CommentContent = commentContent;
	}
}
