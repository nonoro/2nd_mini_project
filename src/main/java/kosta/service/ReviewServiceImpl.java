package kosta.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import kosta.dao.ReviewDAO;
import kosta.dao.ReviewDAOImpl;
import kosta.dto.ReviewDTO;

public class ReviewServiceImpl implements ReviewService {
	ReviewDAO reviewDAO = new ReviewDAOImpl();
	
	@Override
	public void insert(ReviewDTO reviewDTO) throws SQLException {
		int result = reviewDAO.insert(reviewDTO);
		if(result == 0) throw new SQLException("리뷰를 등록하지 못했습니다.");
		
	}

	@Override
	public List<ReviewDTO> selectAll(ReviewDTO reviewDTO) throws SQLException {
		List<ReviewDTO> list = reviewDAO.selectAll(reviewDTO);
		if(list.size() == 0 || list.isEmpty()) throw new SQLException("리뷰 정보가 없습니다.");
		
		return list;
	}

	@Override
	public void update(ReviewDTO reviewDTO) throws SQLException {
		int result = reviewDAO.update(reviewDTO);
		if(result == 0) throw new SQLException("리뷰를 수정하지 못했습니다.");
		
	}

	@Override
	public void delete(int reviewCode, String saveDir) throws SQLException {
		ReviewDTO reviewDTO = reviewDAO.selectByCode(reviewCode);
		
		if(reviewDTO == null) {
			throw new SQLException("코드번호 오류로 삭제 불가!");
		}
		if(reviewDAO.delete(reviewCode) == 0 ) {
			throw new SQLException("삭제되지 않았습니다.");		
		}
		
		if(reviewDTO.getReviewFile()!=null) {
			String fileName = saveDir+"/"+reviewDTO.getReviewFile();
			new File(fileName).delete();
		}
		
		
	}

	@Override
	public int selectAvrGrade(int productCode) throws SQLException {
		int avrGrade = reviewDAO.selectAvrGrade(productCode);
		
		return avrGrade;
	}

}
