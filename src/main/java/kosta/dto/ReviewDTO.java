package kosta.dto;

public class ReviewDTO {
	private int reviewCode;
	private String userId;
	private int productCode;
	private int reviewGrade;
	private String reviewDetail;
	private String reviewPostdate;
	private String reviewFile;
	
	public ReviewDTO() { }
	public ReviewDTO(int reviewCode, String userId, int productCode, int reviewGrade, String reviewDetail,
			String reviewPostdate, String reviewFile) {
		super();
		this.reviewCode = reviewCode;
		this.userId = userId;
		this.productCode = productCode;
		this.reviewGrade = reviewGrade;
		this.reviewDetail = reviewDetail;
		this.reviewPostdate = reviewPostdate;
		this.reviewFile = reviewFile;
	}
	
	
	public ReviewDTO(int productCode, int reviewGrade, String reviewDetail, String reviewPostdate, String reviewFile) {
		super();
		this.productCode = productCode;
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
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
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
