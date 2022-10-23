package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.ReviewDTO;

public interface ReviewDAO {
	/**
	 * 등록
	 * INSERT INTO REVIEW VALUES(?,?,?,?,?,?,?);
	 */
	int insert(ReviewDTO reivewDTO) throws SQLException;
	
	/**
	 * 조회
	 * SELECT P_CODE, GRADE, REVIEW_DETAIL, REVIEW_POSTDATE, REVIEW_FILE FROM T_REVIEW WHERE USER_ID =? AND P_CODE=?;
	 */
	List<ReviewDTO> selectAll(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * 수정
	 * UPDATE REVIEW SET GRADE=?, REVIEW_DETAIL=? WHERE REVIEW_CODE=? AND USER_ID=?;
	 */
	int update(int grade, String contetn, ReviewDTO reviewDTO) throws SQLException;

	/**
	 * 삭제
	 * DELETE FROM REVIEW WHERE REVIEW_CODE=?
	 */
	int delete(int reviewCode) throws SQLException;
	
	
}
