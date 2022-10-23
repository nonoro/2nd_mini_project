package kosta.dao;

import java.sql.SQLException;

import kosta.dto.UserDTO;

public interface UserDAO {
	/**
	 * 회원가입
	 * INSERT INTO USER VALUE(?,?,?,?,?,NULL,?,?);
	 */
	int join(UserDTO user) throws SQLException;
	
	
	/**
	 * 로그인
	 * SELECT USER_ID, USER_PWD FROM USER WHERE USER_ID=? AND USER_PWD=?;
	 */
	UserDTO login(UserDTO user) throws SQLException;
	
	/**
	 * 로그아웃
	 */
	
	/**
	 * 개인정보 수정(비밀번호)
	 * UPDATE USER SET USER_PWD =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updatePwd(String userPwd, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(주소)
	 * UPDATE USER SET USER_ADDR =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updateAddr(String userAddr, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(이메일)
	 * UPDATE USER SET USER_EMAIL =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updateEmail(String userEmail, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(전화번호)
	 * UPDATE USER SET USER_PHONE =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updatePhone(String userupdatePhone, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(프로필)
	 * UPDATE USER SET USER_PROFILE =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updateProfile(String userProfile, UserDTO userDTO) throws SQLException;

	/**
	 * 개인정보 수정(강아지 이름)
	 * UPDATE USER SET USER_DOGNAME =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updateDogName(String userDogName, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(강아지 정보)
	 * UPDATE USER SET USER_DOGBIRTHDAY =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updateDogBirthday(String userDogBirthday, UserDTO userDTO) throws SQLException;
	
	/**
	 * 주문내역 조회
	 * SELECT * FROM T_ORDER WHERE USER_ID=?;
	 */
	

	/**
	 * 배송상태 조회
	 * SELECT ORDER_complete FROM T_ORDER WHERE USER_ID=?;
	 */
	
	
	/**
	 * 주문한 상품 취소요청
	 * UPDATE OrderHistory SET ORDER_STATE=2 WHERE USER_ID=?;
	 */
	
	//주문한 상품의 후기 및 평점을 등록,수정,조회,삭제 하는 기능
	
	/**
	 * 포인트 조회
	 * SELECT USER_POINT FROM T_USER WHERE USER_ID=?;
	 */
	UserDTO selectPoint(String userId) throws SQLException;
	
	/**
	 * 아이디 찾기
	 * SELECT USER_ID FROM USER WHERE PHONE_NUMBER=? AND EMAIL=?;
	 */
	String searchId(UserDTO userDTO) throws SQLException;
	
	/**
	 * 비밀번호 찾기
	 * SELECT USER_PWD FROM USER WHERE USER_ID=? PHONE_NUMBER=? AND EMAIL=?;
	 */
	String searchPwd(UserDTO userDTO) throws SQLException;
	
	
	
	
}
