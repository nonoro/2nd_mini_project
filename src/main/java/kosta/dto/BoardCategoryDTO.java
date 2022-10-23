package kosta.dto;

public class BoardCategoryDTO {
	private int boardCategoryCode;
	private String categoryContent;
	
	public BoardCategoryDTO() { }

	public BoardCategoryDTO(int boardCategoryCode, String categoryContent) {
		super();
		this.boardCategoryCode = boardCategoryCode;
		this.categoryContent = categoryContent;
	}

	public int getBoardCategoryCode() {
		return boardCategoryCode;
	}

	public void setBoardCategoryCode(int boardCategoryCode) {
		this.boardCategoryCode = boardCategoryCode;
	}

	public String getCategoryContent() {
		return categoryContent;
	}

	public void setCategoryContent(String categoryContent) {
		this.categoryContent = categoryContent;
	}
	
}
