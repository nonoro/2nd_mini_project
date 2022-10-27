package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.ReplyDAO;
import kosta.dao.ReplyDAOImpl;
import kosta.dto.BoardDTO;
import kosta.dto.ReplyDTO;

public class ReplyServiceImpl implements ReplyService {
	ReplyDAO replyDao = new ReplyDAOImpl();

	@Override
	public List<ReplyDTO> replyList(int boardCode) throws SQLException {
		List<ReplyDTO> list = replyDao.replyList(boardCode);
		if(list.size()==0 || list.isEmpty()) throw new SQLException("댓글이 없습니다.");
		
		return list;
	}

	@Override
	public void insertReply(ReplyDTO reply) throws SQLException {
		int result = replyDao.insertReply(reply);
		if(result == 0) throw new SQLException("댓글을 등록하지 못했습니다.");
		
	}

	@Override
	public void updateReply(ReplyDTO reply) throws SQLException {
		int result = replyDao.updateReply(reply);
		if(result == 0) throw new SQLException("댓글을 수정하지 못했습니다.");
		
	}

	@Override
	public void deleteReply(ReplyDTO reply) throws SQLException {
		if(replyDao.deleteReply(reply) == 0 ) {
			throw new SQLException("댓글이삭제되지 않았습니다.");		
		}
	}

}
