 package kosta.service;

import java.sql.SQLException;

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
	
	
}
