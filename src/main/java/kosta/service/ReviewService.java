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
	
}
