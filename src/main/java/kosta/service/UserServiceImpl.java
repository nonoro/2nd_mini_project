package kosta.service;

import java.sql.SQLException;

import kosta.dao.UserDAO;
import kosta.dao.UserDAOImpl;
import kosta.dto.UserDTO;
import kosta.exception.AuthenticationException;

public class UserServiceImpl implements UserService {
	private UserDAO userDAO = new UserDAOImpl();

	@Override
	public UserDTO login(UserDTO userDTO) throws SQLException, AuthenticationException {
		//dao 호출
			UserDTO dbDTO = userDAO.login(userDTO);
			if(dbDTO == null) {
				throw new AuthenticationException("정보를 다시 확인해주세요.");
			}
			
			return dbDTO;
	}
	
	
	

}





