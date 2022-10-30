package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.OrderDTO;
import kosta.dto.PointDTO;
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
	int updatePwd(String newPwd, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(주소)
	 * UPDATE USER SET USER_ADDR =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updateAddr(String newAddr, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(이메일)
	 * UPDATE USER SET USER_EMAIL =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updateEmail(String newEmail, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(전화번호)
	 * UPDATE USER SET USER_PHONE =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updatePhone(String newPhone, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(프로필)
	 * UPDATE USER SET USER_PROFILE =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updateProfile(String newProfile, UserDTO userDTO) throws SQLException;

	/**
	 * 개인정보 수정(강아지 이름)
	 * UPDATE USER SET USER_DOGNAME =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updateDogName(String newDogName, UserDTO userDTO) throws SQLException;
	
	/**
	 * 개인정보 수정(강아지 정보)
	 * UPDATE USER SET USER_DOGBIRTHDAY =? WHERE USER_ID =? AND USER_PWD=?;
	 */
	int updateDogBirthday(String newDogBirthday, UserDTO userDTO) throws SQLException;
	
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
	int updateReady(int orderCode) throws SQLException;
	
	/**
	 * 생일 포인트 지급
	 * UPDATE T_USER SET USER_POINT = USER_POINT+5000 WHERE TO_CHAR(SYSDATE,'MM-DD') =
		TO_CHAR((SELECT DOG_BIRTHDAY FROM T_USER WHERE USER_ID = ?),'MM-DD')	
	 */
	int birthdayPoint(UserDTO userDTO) throws SQLException;

	/**
	 * 생일 포인트 지급 중복체크
	 * SELECT * FROM T_POINT WHERE USER_ID = 't3' AND POINT_SAVE = 5000 AND POINT_SAVEDATE = TO_CHAR(SYSDATE,'YY-MM-DD')
	 */
	PointDTO birthdayCheck(String userId) throws SQLException;
	
	
	/**
	 * 생일포인트 지급 시 포인트 테이블 insert
	 * INSERT INTO T_POINT VALUES(POINT_CODE_SEQ.NEXTVAL, ?, 5000, SYSDATE, NULL)
	 */
	int insertBirthday(String userId)throws SQLException;


	List<UserDTO> selectAll() throws SQLException;
	
}
