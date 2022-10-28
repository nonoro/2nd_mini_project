package kosta.dto;

public class PointDTO {
	private int pointCode;
	private int orderCode;
	private String userId;
	private int pointSave;
	private String pointSavedate;
	private String pointUseddate;
	
	public PointDTO() { }

	public PointDTO(int pointCode, int orderCode, String userId, int pointSave, String pointSavedate,
			String pointUseddate) {
		super();
		this.pointCode = pointCode;
		this.orderCode = orderCode;
		this.userId = userId;
		this.pointSave = pointSave;
		this.pointSavedate = pointSavedate;
		this.pointUseddate = pointUseddate;
	}

	public int getPointCode() {
		return pointCode;
	}

	public void setPointCode(int pointCode) {
		this.pointCode = pointCode;
	}

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPointSave() {
		return pointSave;
	}

	public void setPointSave(int pointSave) {
		this.pointSave = pointSave;
	}

	public String getPointSavedate() {
		return pointSavedate;
	}

	public void setPointSavedate(String pointSavedate) {
		this.pointSavedate = pointSavedate;
	}

	public String getPointUseddate() {
		return pointUseddate;
	}

	public void setPointUseddate(String pointUseddate) {
		this.pointUseddate = pointUseddate;
	}
	
	
}
