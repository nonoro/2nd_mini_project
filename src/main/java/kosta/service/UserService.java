 package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.OrderDTO;
import kosta.dto.PointDTO;
import kosta.dto.UserDTO;
import kosta.exception.AuthenticationException;

public interface UserService {
	/**
	 * 회원가입
	 */
	void join(UserDTO user) throws SQLException;
	
	/**
	 * 로그인 기능
	 */
	UserDTO login(UserDTO userDTO) throws SQLException, AuthenticationException;
	
	/**
	 * 개인정보 수정(비밀번호)
	 */
	void updatePwd(String newPwd, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(주소)
	 */
	void updateAddr(String newAddr, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(이메일)
	 */
	void updateEmail(String newEmail, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(전화번호)
	 */
	void updatePhone(String newPhone, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(프로필)
	 */
	void updateProfile(String newProfile, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(강아지 이름)
	 */
	void updateDogName(String newDogName, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(강아지 생일)
	 */
	void updateDogBirthday(String newDogBirthday, UserDTO userDTO) throws SQLException;
	
	/**
	 * 포인트 조회
	 */
	UserDTO selectPoint(String userId) throws SQLException;
		
	/**
	 * 아이디 찾기
	 */
	String searchId(UserDTO userDTO) throws SQLException;
		
	/**
	 * 비밀번호 찾기
	 */
		String searchPwd(UserDTO userDTO) throws SQLException;
		
	/////////////////////////////////////////////////////////////////////////////////////
	/*
	* MANAGEMENT
	*/
	
	/**
	* 가입 회원수조회(-1은 관리자 아이디 제외)
	* SELECT COUNT(USER_ID)-1 FROM T_USER;
	*/
	int userCount() throws SQLException;
	
	/**
	* 매출액조회(당월 매출)
	* SELECT SUM(ORDER_TOTALPRICE) FROM T_ORDER WHERE ORDER_DATE LIKE '%?/%';
	
	int monthSalse(int year, int month) throws SQLException;
	*/
	/**
	* 매출액조회(당해 매출)
	* SELECT SUM(ORDER_TOTALPRICE) FROM T_ORDER WHERE ORDER_DATE LIKE '?/%';
	*/
	List<OrderDTO> yearSalse(int year) throws SQLException;
	
	/**
	* 매출액조회(전체 매출)
	*	SELECT SUM(ORDER_TOTALPRICE) FROM T_ORDER;	
	*/
	int allSalse() throws SQLException;
	
	/**
	* 상태가 준비중인 상품 리스트업
	* SELECT * FROM T_ORDER WHERE ORDER_COMPLETE = 0;
	*/
	List<OrderDTO> readyProduct() throws SQLException;
	
	/**
	* 상태가 준비중인 상품의 ORDER_COMPLETE를 배송중으로 변경
	* UPDATE T_ORDRE SET ORDRE_COMPLETE=1 WHERE ORDER_CODE=?
	*/
	void updateReady(int orderCode) throws SQLException;
	
	/**
	 * 생일 포인트 지급
	 * UPDATE T_USER SET USER_POINT = USER_POINT+5000 WHERE TO_CHAR(SYSDATE,'MM-DD') =
		TO_CHAR((SELECT DOG_BIRTHDAY FROM T_USER WHERE USER_ID = ?),'MM-DD')	
	 */
	String birthdayPoint(UserDTO userDTO) throws SQLException;
	
	/**
	 * 생일 포인트적립 중복체크 
	 */
	PointDTO birthdayCheck(String userId) throws SQLException;
	
	
	/**
	 * 생일포인트 지급 시 포인트 테이블 insert
	 * INSERT INTO T_POINT VALUES(POINT_CODE_SEQ.NEXTVAL, ?, 5000, SYSDATE, NULL)
	 */
	void insertBirthday(String userId)throws SQLException;
	

	/**
	 * 모든유저정보
	 */

	List<UserDTO> selectAll() throws SQLException;

}
