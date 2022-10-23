package kosta.dto;

public class UserDTO {
	private String userId;
	private String userPwd;
	private String userEmail;
	private String userAddr;
	private String userPhone;
	private String userProfile;
	private String dogName;
	private String dogBirthday;
	private int userPoint;
	
	public UserDTO() { }

	public UserDTO(String userId, String userPwd, String userEmail, String userAddr, String userPhone, String userProfile,
			String dogName, String dogBirthday, int userPoint) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userEmail = userEmail;
		this.userAddr = userAddr;
		this.userPhone = userPhone;
		this.userProfile = userProfile;
		this.dogName = dogName;
		this.dogBirthday = dogBirthday;
		this.userPoint = userPoint;
	}
	
	public UserDTO(String userId, String userPwd) {
		this.userId = userId;
		this.userPwd = userPwd;
		
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public String getDogBirthday() {
		return dogBirthday;
	}

	public void setDogBirthday(String dogBirthday) {
		this.dogBirthday = dogBirthday;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	
	
	
}
