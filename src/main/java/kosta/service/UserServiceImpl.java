package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.UserDAO;
import kosta.dao.UserDAOImpl;
import kosta.dto.OrderDTO;
import kosta.dto.PointDTO;
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

	@Override
	public int userCount() throws SQLException {
  int userCount = userDAO.userCount();
	      
	      return userCount;
	}

	/*
	 * @Override public int monthSalse(int year, int month) throws SQLException {
	 * int monthSalse = userDAO.monthSalse(year,month); if(monthSalse == 0) throw
	 * new SQLException(year+"년 "+month+"월 매출액이 없습니다.");
	 * 
	 * return monthSalse; }
	 */

	@Override
	public List<OrderDTO> yearSalse(int year) throws SQLException {
		List<OrderDTO> orderlist = userDAO.yearSalse(year);
		
		System.out.println(orderlist);
		if(orderlist == null) throw new SQLException(year+"년 매출액이 없습니다.");
		
		return orderlist;
	}

	@Override
	public int allSalse() throws SQLException {
		int allSalse = userDAO.allSalse();
		if(allSalse == 0) throw new SQLException("매출이 없습니다.");
		
		return allSalse;
	}

	@Override
	public List<OrderDTO> readyProduct() throws SQLException {
		List<OrderDTO> list = userDAO.readyProduct();
		if(list.size() == 0 || list.isEmpty()) throw new SQLException("준비중인 주문이 없습니다.");
		
		return list;
	}

	@Override
	public void updateReady(int orderCode) throws SQLException {
		int result = userDAO.updateReady(orderCode);
		if(result == 0) throw new SQLException("포인트를 확인할 수 없습니다.");
				
	}

	@Override
	public String birthdayPoint(UserDTO userDTO) throws SQLException {
		int result = userDAO.birthdayPoint(userDTO);
		String message = "강아지 생일을 축하드립니다. 5,000포인트 지급해 드렸습니다.";
		
		return message;
		
	}

	@Override
	public PointDTO birthdayCheck(String userId) throws SQLException {
		PointDTO birthdayPoint = userDAO.birthdayCheck(userId);
		if(birthdayPoint!=null) {
			return birthdayPoint;
		}else {
			return null;
		}
		
		
	}

	@Override
	public void insertBirthday(String userId) throws SQLException {
		int result = userDAO.insertBirthday(userId);
		if(result == 0) throw new SQLException("포인트 테이블 인서트 오류");
		
	}

	   public List<UserDTO> selectAll() throws SQLException {
	      List<UserDTO> userList = userDAO.selectAll();
	      
	      return userList;
	   }
	
	

}





