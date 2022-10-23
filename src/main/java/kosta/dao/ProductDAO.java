package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.ProductDTO;
import kosta.dto.ReviewDTO;

public interface ProductDAO {
	
	/**
	 * 상품 전체검색
	 */
	List<ProductDTO> selectAll() throws SQLException;

	/**
	 * 상품이름에 해당하는 레코드 검색
	 */
	ProductDTO selectByProductCode(int productCode) throws SQLException;
	
	/**
	 * 상품등록
	 */
	int insert(ProductDTO product) throws SQLException;
		

	/**
	 * 상품수정
	 */
	int update(ProductDTO product) throws SQLException;

	/**
	 * 상품삭제
	 */
	int delete(int productCode, String password) throws SQLException;
	
	/**
	 * 상품 코드별 판매통계 조회 월별
	 */
	List<ProductDTO> monthlySalesByCode() throws SQLException;
	
	
	
	/**
	 * 판매통계 조회 년별
	 */
	List<ProductDTO> yearlySalesByCode() throws SQLException;

	
	/**
	 * 상품코드에 해당하는 후기 조회
	 * */
	List<ReviewDTO> reviewByProductCode(int productCode) throws SQLException;
	

}
