package kosta.dto;
 
public class BoardDTO {
	private int boardCode;
	private int categoryCode;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private String boardNick;
	private String boardPostdate;
	private String boardFile;
	
	public BoardDTO() { }

	public BoardDTO(int boardCode, int categoryCode, String userId, String boardTitle, String boardContent,
			String boardNick, String boardPostdate, String boardFile) {
		super();
		this.boardCode = boardCode;
		this.categoryCode = categoryCode;
		this.userId = userId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardNick = boardNick;
		this.boardPostdate = boardPostdate;
		this.boardFile = boardFile;
	}

	
	
	public BoardDTO(int categoryCode, String userId, String boardTitle, String boardContent, String boardNick,
			String boardPostdate, String boardFile) {
		super();
		this.categoryCode = categoryCode;
		this.userId = userId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardNick = boardNick;
		this.boardPostdate = boardPostdate;
		this.boardFile = boardFile;
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

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardNick() {
		return boardNick;
	}

	public void setBoardNick(String boardNick) {
		this.boardNick = boardNick;
	}

	public String getBoardPostdate() {
		return boardPostdate;
	}

	public void setBoardPostdate(String boardPostdate) {
		this.boardPostdate = boardPostdate;
	}

	public String getBoardFile() {
		return boardFile;
	}

	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}
	
}
