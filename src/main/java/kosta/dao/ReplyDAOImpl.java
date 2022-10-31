package kosta.dao;

import kosta.dto.BoardDTO;
import kosta.dto.ReplyDTO;
import kosta.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReplyDAOImpl implements ReplyDAO {

	@Override
	public List<ReplyDTO> replyList(int boardCode, int categoryCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs= null;
		ReplyDTO reply = null;
		List<ReplyDTO> replyList = new ArrayList<ReplyDTO>();


		String sql = "SELECT * FROM reply WHERE board_CODE=? and category_code=?";
		try {
			con = DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, boardCode);
			ps.setInt(2, categoryCode);

			rs = ps.executeQuery();
			while(rs.next()) {
				reply = new ReplyDTO(rs.getInt(1),rs.getInt(2),rs.getInt(3), rs.getString(4),rs.getString(5),rs.getString(6));
				replyList.add(reply);

			}
			
		}finally {
			DbUtil.dbClose(con, ps, rs);
		}



		return replyList;
	}

	@Override
	public int insertReply(ReplyDTO reply) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		String sql = "INSERT INTO reply VALUEs(reply_code_seq.nextval, ?, ?, ?, ?, sysdate)";
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);

			ps.setInt(1, reply.getBoardCode());
			ps.setInt(2, reply.getCategoryCode());
			ps.setString(3, reply.getUserId());
			ps.setString(4, reply.getReplyContent());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int updateReply(ReplyDTO reply) throws SQLException {
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = "UPDATE reply SET REPLY_CONTENT=? WHERE BOARD_CODE=? AND USER_ID=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, reply.getReplyContent());
			ps.setInt(2, reply.getBoardCode());
			ps.setString(3, reply.getUserId());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		return result;
	}

	@Override
	public int deleteReply(Connection con, BoardDTO board) throws SQLException {
		int result = 0;
		PreparedStatement ps = null;
		
		String sql = "DELETE FROM reply WHERE board_code=? AND category_code=?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, board.getBoardCode());
			ps.setInt(2, board.getCategoryCode());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		return result;
	}

	@Override
	public int deleteUserReply(Connection con, BoardDTO board) throws SQLException {
		int result = 0;
		PreparedStatement ps = null;

		String sql = "DELETE FROM reply WHERE reply_CODE=? AND USER_ID=?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, board.getBoardCode());
			ps.setInt(2, board.getCategoryCode());

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}


		return result;
	}

}
