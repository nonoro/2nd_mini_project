package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.BoardDTO;
import kosta.util.DbUtil;

public class BoardDAOImpl implements BoardDAO {

	@Override
	public List<BoardDTO> categoryList(int category) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs= null;
		BoardDTO board = null;
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		String sql = "SELECT * FROM T_BOARD WHERE CATEGORY_CODE=?";
		try {
			con = DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, category);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				board = new BoardDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
				list.add(board);
			}
			
		}finally {
			DbUtil.dbClose(con, ps, rs);
		}		
		
		return list;
	}

	@Override
	public int insertBoard(BoardDTO board) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		String sql = "INSERT INTO T_BOARD VALUES(?,?,?,?,?,?,SYSDATE,?);";
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, board.getBoardCode());
			ps.setInt(2, board.getCategoryCode());
			ps.setString(3, board.getUserId());
			ps.setString(4, board.getBoardTitle());
			ps.setString(5, board.getBoardContent());
			ps.setString(6, board.getBoardNick());
			ps.setString(7, board.getBoardFile());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int updateBoard(BoardDTO board) throws SQLException {
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = "UPDATE T_BOARD SET BOARD_TITLE=?, BOARD_CONTENT=?, BOARD_FILE=? WHERE BOARD_CODE=? AND USER_ID=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, board.getBoardTitle());
			ps.setString(2, board.getBoardContent());
			ps.setString(3, board.getBoardFile());
			ps.setInt(4, board.getBoardCode());
			ps.setString(5, board.getUserId());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		return result;
	}

	@Override
	public int deleteBoard(BoardDTO board) throws SQLException {
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = "DELETE FROM T_BOARD WHERE BOARD_CODE=? AND USER_ID=?;";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, board.getBoardCode());
			ps.setString(2, board.getUserId());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		return result;
	}
	
	@Override
	public BoardDTO selectByCode(int reviewCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs= null;
		BoardDTO board = null;
		
		String sql = "select * from t_board where board_code = ?";
		try {
			con = DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, reviewCode);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				board = new BoardDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
			
			}
			
		}finally {
			DbUtil.dbClose(con, ps, rs);
		}		
		
		return board;
	}
	
}
