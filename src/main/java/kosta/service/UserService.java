 package kosta.service;

import java.sql.SQLException;

import kosta.dto.UserDTO;
import kosta.exception.AuthenticationException;

public interface UserService {
	
	/**
	 * 로그인 기능
	 */
	UserDTO login(UserDTO userDTO) throws SQLException, AuthenticationException;
}
