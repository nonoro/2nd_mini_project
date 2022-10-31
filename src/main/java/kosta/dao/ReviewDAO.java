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
	int update(ReviewDTO reviewDTO) throws SQLException;

	/**
	 * 삭제
	 * DELETE FROM REVIEW WHERE REVIEW_CODE=?
	 */
	int delete(int reviewCode) throws SQLException;
	
	
	/**
	 * 코드로 조회
	 */
	ReviewDTO selectByCode(int reviewCode) throws SQLException;
	
	/**
	 * 상세페이지(코드별) 상품 평균 별점 구하기
	 * SELECT trunc(AVG(REVIEW_GRADE), 0.1) FROM REVIEW WHERE PRODUCT_CODE=?
	 */
	int selectAvrGrade(int productCode) throws SQLException;

	/**
	 * 내가 작성한 후기
	 */
	List<ReviewDTO> selectByUserId(String userId) throws SQLException;
	
	
}
