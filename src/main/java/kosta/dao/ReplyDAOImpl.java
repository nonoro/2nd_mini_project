package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.BoardDTO;
import kosta.dto.ReplyDTO;
import kosta.util.DbUtil;

public class ReplyDAOImpl implements ReplyDAO {

	@Override
	public List<ReplyDTO> replyList(int boardCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs= null;
		ReplyDTO reply = null;
		List<ReplyDTO> replyList = new ArrayList<ReplyDTO>();
		
		String sql = "SELECT * FROM reply WHERE board_CODE=?";
		try {
			con = DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, boardCode);
			
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
		
		String sql = "INSERT INTO REPLY VALUE(?,?,?,?,?,SYSDATE)";
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, reply.getReplyCode());
			ps.setInt(2, reply.getBoardCode());
			ps.setInt(3, reply.getCategoryCode());
			ps.setString(4, reply.getUserId());
			ps.setString(5, reply.getReplyContent());
			
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
	public int deleteReply(ReplyDTO reply) throws SQLException {
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = "DELETE FROM reply WHERE reply_CODE=? AND USER_ID=?;";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, reply.getReplyCode());
			ps.setString(2, reply.getUserId());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		
		return result;
	}

}
