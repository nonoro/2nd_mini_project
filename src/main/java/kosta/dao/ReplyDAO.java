package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.BoardDTO;
import kosta.dto.ReplyDTO;

public interface ReplyDAO {
	/**
	 * 글별 댓글 조회
	 * SELECT * FROM reply WHERE board_CODE=?
	 */
	List<ReplyDTO> replyList (int boardCode) throws SQLException;
	
	
	/**
	 * 등록
	 * INSERT INTO REPLY VALUE(?,?,?,?,?,SYSDATE);
	 */
	int insertReply(ReplyDTO reply) throws SQLException;
	
	
	/**
	 * 수정 - 댓글은 내용만 수정할 수 있다.
	 * UPDATE reply SET REPLY_CONTENT=? WHERE BOARD_CODE=? AND USER_ID=?
	 */
	int updateReply(ReplyDTO reply) throws SQLException;
	
	
	/**
	 * 삭제
	 * DELETE FROM reply WHERE REPLY_CODE=? AND USER_ID=?;
	 */
	int deleteReply(ReplyDTO reply) throws SQLException;
}
