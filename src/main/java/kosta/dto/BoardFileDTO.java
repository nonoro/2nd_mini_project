package kosta.dto;

public class BoardFile {
	private int boardFile; 
	private int boardCode;
	private String boardFileName;
	
	public BoardFile() { 
	}
	public BoardFile(int boardFile, int boardCode, String boardFileName) {
		super();
		this.boardFile = boardFile;
		this.boardCode = boardCode;
		this.boardFileName = boardFileName;
	}
	public int getBoardFile() {
		return boardFile;
	}
	public void setBoardFile(int boardFile) {
		this.boardFile = boardFile;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public String getBoardFileName() {
		return boardFileName;
	}
	public void setBoardFileName(String boardFileName) {
		this.boardFileName = boardFileName;
	}
	
	
}
