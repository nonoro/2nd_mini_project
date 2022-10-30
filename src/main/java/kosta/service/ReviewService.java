package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.ReviewDTO;

public interface ReviewService {
	/**
	 * 등록
	 */
	void insert(ReviewDTO reviewDTO) throws SQLException;
		
	/**
	 * 조회
	 */
	List<ReviewDTO> selectAll(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * 수정
	 */
	void update(ReviewDTO reviewDTO) throws SQLException;
	
	/**
	 * 삭제
	 */
	void delete(int reviewCode, String saveDir) throws SQLException;
	
	/**
	 * 상세페이지(코드별) 상품 평균 별점 구하기
	 * SELECT trunc(AVG(REVIEW_GRADE), 0.1) FROM REVIEW WHERE PRODUCT_CODE=?
	 */
	int selectAvrGrade(int productCode) throws SQLException;
	
	/**
	 * 리뷰코드별 리뷰의정보
	 */
	ReviewDTO selectByCode(int productCode) throws SQLException;
	
}
