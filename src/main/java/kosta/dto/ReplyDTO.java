package kosta.dto;

public class ReplyDTO {
	private int replyCode;
	private int boardCode;
	private int categoryCode;
	private String userId;
	private String replyContent;
	private String replyregDate;
	
	public ReplyDTO() { }
	public ReplyDTO(int replyCode, int boardCode, int categoryCode, String userId, String replyContent,
			String replyregDate) {
		super();
		this.replyCode = replyCode;
		this.boardCode = boardCode;
		this.categoryCode = categoryCode;
		this.userId = userId;
		this.replyContent = replyContent;
		this.replyregDate = replyregDate;
	}
	public int getReplyCode() {
		return replyCode;
	}
	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public int getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyregDate() {
		return replyregDate;
	}
	public void setReplyregDate(String replyregDate) {
		this.replyregDate = replyregDate;
	}
	
	
}
