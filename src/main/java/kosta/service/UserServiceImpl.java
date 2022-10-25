package kosta.service;

import java.sql.SQLException;

import kosta.dao.UserDAO;
import kosta.dao.UserDAOImpl;
import kosta.dto.UserDTO;
import kosta.exception.AuthenticationException;

public class UserServiceImpl implements UserService {
	private UserDAO userDAO = new UserDAOImpl();

	@Override
	public void join(UserDTO user) throws SQLException {
		int result = userDAO.join(user);
		if(result == 0) {
			throw new SQLException("회원가입에 실패했습니다.");
		}
	}
	
	@Override
	public UserDTO login(UserDTO userDTO) throws SQLException, AuthenticationException {
		//dao 호출
			UserDTO dbDTO = userDAO.login(userDTO);
			if(dbDTO == null) {
				throw new AuthenticationException("정보를 다시 확인해주세요.");
			}
			
			return dbDTO;
	}

	@Override
	public void updatePwd(String newPwd, UserDTO userDTO) throws SQLException {
		int result = userDAO.updatePwd(newPwd, userDTO);
		if(result == 0) {
			throw new SQLException("비밀번호를 변경할 수 없습니다.");
		}
	}

	@Override
	public void updateAddr(String newAddr, UserDTO userDTO) throws SQLException {
		int result = userDAO.updateAddr(newAddr, userDTO);
		if(result == 0) {
			throw new SQLException("주소를 변경할 수 없습니다.");
		}
	}

	@Override
	public void updateEmail(String newEmail, UserDTO userDTO) throws SQLException {
		int result = userDAO.updateEmail(newEmail, userDTO);
		if(result == 0) {
			throw new SQLException("이메일을 변경할 수 없습니다.");
		}
	}

	@Override
	public void updatePhone(String newPhone, UserDTO userDTO) throws SQLException {
		int result = userDAO.updatePhone(newPhone, userDTO);
		if(result == 0) {
			throw new SQLException("휴대폰번호를 변경할 수 없습니다.");
		}
	}

	@Override
	public void updateProfile(String newProfile, UserDTO userDTO) throws SQLException {
		int result = userDAO.updateProfile(newProfile, userDTO);
		if(result == 0) {
			throw new SQLException("프로필을 변경할 수 없습니다.");
		}
	}

	@Override
	public void updateDogName(String newDogName, UserDTO userDTO) throws SQLException {
		int result = userDAO.updateDogName(newDogName, userDTO);
		if(result == 0) {
			throw new SQLException("강아지이름을 변경할 수 없습니다.");
		}
	}

	@Override
	public void updateDogBirthday(String newDogBirthday, UserDTO userDTO) throws SQLException {
		int result = userDAO.updateDogBirthday(newDogBirthday, userDTO);
		if(result == 0) {
			throw new SQLException("강아지생일을 변경할 수 없습니다.");
		}
	}

	@Override
	public UserDTO selectPoint(String userId) throws SQLException {
		UserDTO dbDTO = userDAO.selectPoint(userId);
		if(dbDTO == null) {
			throw new SQLException("포인트를 확인할 수 없습니다.");
		}
		
		return dbDTO;
	}

	@Override
	public String searchId(UserDTO userDTO) throws SQLException {
		String userId = userDAO.searchId(userDTO);
		if(userId == null) throw new SQLException("아이디를 찾을 수 없습니다.");
		
		return userId;
	}

	@Override
	public String searchPwd(UserDTO userDTO) throws SQLException {
		String userPwd = userDAO.searchPwd(userDTO);
		if(userPwd == null) throw new SQLException("아이디를 찾을 수 없습니다.");
		
		return userPwd;
	}
	
	
	

}





