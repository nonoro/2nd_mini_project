package kosta.dao;

import kosta.dto.BoardDTO;

import java.sql.SQLException;
import java.util.List;

public interface BoardDAO {
	/**
	 * 카테고리별 리스트 출력(조회)
	 * SELECT * FROM T_BOARD WHERE CATEGORY_CODE=?
	 */
	List<BoardDTO> categoryList(int category, int pageNo) throws SQLException;
	
	
	/**
	 * 등록
	 * INSERT INTO T_BOARD VALUE(?,?,?,?,?,?,SYSDATE,?);
	 */
	int insertBoard(BoardDTO board) throws SQLException;
	
	
	/**
	 * 수정
	 * UPDATE T_BOARD SET BOARD_TITLE=?, BOARD_CONTENT=?, BOARD_FILE=? WHERE BOARD_CODE=? AND USER_ID=?
	 */
	int updateBoard(BoardDTO board) throws SQLException;
	
	
	/**
	 * 삭제
	 * DELETE FROM T_BOARD WHERE BOARD_CODE=? AND USER_ID=?;
	 */
	int deleteBoard(BoardDTO board) throws SQLException;


	BoardDTO selectByCode(int reviewCode, int categoryCode) throws SQLException;


    int incrementByViews(int boardCode, int categoryCode) throws SQLException;
}
