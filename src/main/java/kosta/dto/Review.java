package kosta.dto;

public class Review {
	private int reviewCode;
	private String userId;
	private int poductCode;
	private int reviewGrade;
	private String reviewDetail;
	private String reviewPostdate;
	private String reviewFile;
	
	public Review() { }
	public Review(int reviewCode, String userId, int poductCode, int reviewGrade, String reviewDetail,
			String reviewPostdate, String reviewFile) {
		super();
		this.reviewCode = reviewCode;
		this.userId = userId;
		this.poductCode = poductCode;
		this.reviewGrade = reviewGrade;
		this.reviewDetail = reviewDetail;
		this.reviewPostdate = reviewPostdate;
		this.reviewFile = reviewFile;
	}
	public int getReviewCode() {
		return reviewCode;
	}
	public void setReviewCode(int reviewCode) {
		this.reviewCode = reviewCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPoductCode() {
		return poductCode;
	}
	public void setPoductCode(int poductCode) {
		this.poductCode = poductCode;
	}
	public int getReviewGrade() {
		return reviewGrade;
	}
	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}
	public String getReviewDetail() {
		return reviewDetail;
	}
	public void setReviewDetail(String reviewDetail) {
		this.reviewDetail = reviewDetail;
	}
	public String getReviewPostdate() {
		return reviewPostdate;
	}
	public void setReviewPostdate(String reviewPostdate) {
		this.reviewPostdate = reviewPostdate;
	}
	public String getReviewFile() {
		return reviewFile;
	}
	public void setReviewFile(String reviewFile) {
		this.reviewFile = reviewFile;
	}
	
	
	
}
