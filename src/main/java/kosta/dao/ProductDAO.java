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
	 * 상품이름에 해당하는 레코드 검색
	 * */
	ProductDTO selectByProductName(String productName) throws SQLException;
	
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
	int delete(int productCode, String loginPwd) throws SQLException;
	
	/**
	 * 상품 코드별 판매통계 조회 월별
	 */
	int monthlySalesByCode(int productCode, String orderDate) throws SQLException;
	
	
	
	/**
	 * 판매통계 조회 년별
	 */
	int yearlySalesByCode(int productCode, String orderDate) throws SQLException;


	/**
	 * 상위카테고리에 따라 검색하는 기능 
	 * */
	List<ProductDTO> productSelectByCategorytop(int productCategory) throws SQLException;
	
	/**
	 * 하위카테고리에 따라 검색하는 기능 
	 * */
	List<ProductDTO> productSelectByCategorybottom(int productCategory) throws SQLException;
	
	/**
	 *  정렬하는기능 - 일단 주문많은순만 
	 * */
	List<ProductDTO> selectByarrange(String arrange) throws SQLException;

}