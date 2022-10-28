package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kosta.dto.ReviewDTO;
import kosta.util.DbUtil;

public class ReviewDAOImpl implements ReviewDAO {

	@Override
	public int insert(ReviewDTO reivewDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		String sql = "INSERT INTO REVIEW VALUES(review_code_seq.NEXTVAL,?,?,?,?,sysdate,?,?)";
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, reivewDTO.getUserId());
			ps.setInt(2, reivewDTO.getProductCode());
			ps.setInt(3, reivewDTO.getReviewGrade());
			ps.setString(4, reivewDTO.getReviewDetail());;
			ps.setString(5, reivewDTO.getReviewFile());
			ps.setString(6, reivewDTO.getDogName());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public List<ReviewDTO> selectAll(ReviewDTO reviewDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs= null;
		ReviewDTO review = null;
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
	
		String sql = "SELECT USER_ID, PRODUCT_CODE, REVIEW_GRADE, REVIEW_DETAIL, REVIEW_POSTDATE, REVIEW_FILE, DOGNAME FROM REVIEW WHERE PRODUCT_CODE=?";
		try {
			con = DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, reviewDTO.getProductCode());
			
			rs = ps.executeQuery();
			while(rs.next()) {
				review = new ReviewDTO(0,rs.getString(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
				list.add(review);
			}
			
		}finally {
			DbUtil.dbClose(con, ps, rs);
		}		
		
		return list;
	}

	@Override
	public int update(ReviewDTO reviewDTO) throws SQLException {
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = "UPDATE REVIEW SET REVIEW_GRADE=?, REVIEW_DETAIL=? WHERE REVIEW_CODE=? AND USER_ID=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, reviewDTO.getReviewGrade());
			ps.setString(2, reviewDTO.getReviewDetail());
			ps.setInt(3, reviewDTO.getReviewCode());
			ps.setString(4, reviewDTO.getUserId());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		return result;
	}

	@Override
	public int delete(int reviewCode) throws SQLException {
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = "DELETE FROM REVIEW WHERE REVIEW_CODE=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, reviewCode);
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		return result;
	}
	
	@Override
	public ReviewDTO selectByCode(int reviewCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs= null;
		ReviewDTO review = null;
		
		String sql = "select * from review where review_code = ?";
		try {
			con = DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, reviewCode);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				review = new ReviewDTO(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
			
			}
			
		}finally {
			DbUtil.dbClose(con, ps, rs);
		}		
		
		return review;
	}

	@Override
	public int selectAvrGrade(int productCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs= null;
		int avrGrade = 0;
		
		String sql = "SELECT trunc(AVG(REVIEW_GRADE), 0.1) FROM REVIEW WHERE PRODUCT_CODE=?";
		try {
			con = DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, productCode);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				avrGrade = rs.getInt(1);
			
			}
			
		}finally {
			DbUtil.dbClose(con, ps, rs);
		}		
		
		return avrGrade;
	}

}
