package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kosta.dto.UserDTO;
import kosta.util.DbUtil;

public class UserDAOImpl implements UserDAO {

	@Override
	public int join(UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		UserDTO user = null;
		int result = 0;
		
		String sql = "INSERT INTO USER VALUE(?,?,?,?,?,NULL,?,?,NULL)";
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, userDTO.getUserId());
			ps.setString(2, userDTO.getUserPwd());
			ps.setString(3, userDTO.getUserEmail());
			ps.setString(4, userDTO.getUserAddr());
			ps.setString(5, userDTO.getUserPhone());
			ps.setString(6, userDTO.getDogName());
			ps.setString(7, userDTO.getDogBirthday());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public UserDTO login(UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserDTO user = null;
		
		String sql = "SELECT USER_ID, USER_PWD FROM USER WHERE USER_ID=? AND USER_PWD=?";
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);

			ps.setString(1, userDTO.getUserId());
			ps.setString(2, userDTO.getUserPwd());
			
			rs=ps.executeQuery();
			if(rs.next()) {
				user = new UserDTO(rs.getString(1),rs.getString(2));
			}
			
			
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return user;
	}

	@Override
	public int updatePwd(String userPwd, UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
	
		String sql = "UPDATE USER SET USER_PWD =? WHERE USER_ID =? AND USER_PWD=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, userPwd);
			ps.setString(2, userDTO.getUserId());
			ps.setString(3, userDTO.getUserPwd());
			
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		
		return result;
	}

	@Override
	public int updateAddr(String userAddr, UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
	
		String sql = "UPDATE USER SET USER_ADDR =? WHERE USER_ID =? AND USER_PWD=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, userAddr);
			ps.setString(2, userDTO.getUserId());
			ps.setString(3, userDTO.getUserPwd());
			
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		
		return result;
	}

	@Override
	public int updateEmail(String userEmail, UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
	
		String sql = "UPDATE USER SET USER_EMAIL =? WHERE USER_ID =? AND USER_PWD=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, userEmail);
			ps.setString(2, userDTO.getUserId());
			ps.setString(3, userDTO.getUserPwd());
			
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		
		return result;
	}

	@Override
	public int updatePhone(String userupdatePhone, UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
	
		String sql = "UPDATE USER SET USER_PHONE =? WHERE USER_ID =? AND USER_PWD=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, userupdatePhone);
			ps.setString(2, userDTO.getUserId());
			ps.setString(3, userDTO.getUserPwd());
			
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		
		return result;
	}

	@Override
	public int updateProfile(String userProfile, UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
	
		String sql = "UPDATE USER SET USER_PROFILE =? WHERE USER_ID =? AND USER_PWD=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, userProfile);
			ps.setString(2, userDTO.getUserId());
			ps.setString(3, userDTO.getUserPwd());
			
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		
		return result;
	}

	@Override
	public int updateDogName(String userDogName, UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
	
		String sql = "UPDATE USER SET USER_DOGNAME =? WHERE USER_ID =? AND USER_PWD=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, userDogName);
			ps.setString(2, userDTO.getUserId());
			ps.setString(3, userDTO.getUserPwd());
			
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		
		return result;
	}

	@Override
	public int updateDogBirthday(String userDogBirthday, UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
	
		String sql = "UPDATE USER SET USER_DOGBIRTHDAY =? WHERE USER_ID =? AND USER_PWD=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, userDogBirthday);
			ps.setString(2, userDTO.getUserId());
			ps.setString(3, userDTO.getUserPwd());
			
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		
		return result;
	}

	@Override
	public UserDTO selectPoint(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserDTO user = null;
		
		String sql = "SELECT USER_POINT FROM T_USER WHERE USER_ID=?";
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);

			ps.setString(1, userId);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				user = new UserDTO(null, null, null, null, null, null, null, null, rs.getInt(1));
			}
			
			
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return user;
	}

	@Override
	public String searchId(UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String id = null;
		
		String sql = "SELECT USER_ID FROM USER WHERE PHONE_NUMBER=? AND EMAIL=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, userDTO.getUserPhone());
			ps.setString(2, userDTO.getUserEmail());
			
			rs=ps.executeQuery();
			if(rs.next()) {
				id = rs.getString(1);
			}
			
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return id;
	}

	@Override
	public String searchPwd(UserDTO userDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String pwd = null;
		
		String sql = "SELECT USER_PWD FROM USER WHERE USER_ID=? PHONE_NUMBER=? AND EMAIL=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, userDTO.getUserId());
			ps.setString(2, userDTO.getUserPhone());
			ps.setString(3, userDTO.getUserEmail());
			
			rs=ps.executeQuery();
			if(rs.next()) {
				pwd = rs.getString(1);
			}
			
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return pwd;
	}

}
