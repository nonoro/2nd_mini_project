package kosta.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import kosta.dao.ProductDAO;
import kosta.dao.ProductDAOImpl;
import kosta.dto.ProductDTO;
import kosta.dto.ReviewDTO;

public class ProductServiceImpl implements ProductService {
	private ProductDAO prodDAO= new ProductDAOImpl();

	@Override
	public List<ProductDTO> selectAll() throws SQLException {
		List<ProductDTO> listAll = new ArrayList<ProductDTO>();
		listAll=prodDAO.selectAll();
		return listAll;
	}

	@Override
	public ProductDTO selectByProductCode(int productCode) throws SQLException {
		ProductDTO product=prodDAO.selectByProductCode(productCode) ;
		if(product==null) {
			throw new SQLException(productCode+"에 해당하는 상품이 없습니다");
		}		
		return product;
	}

	@Override
	public void insert(ProductDTO product) throws SQLException {
		int result=prodDAO.insert(product);
		if(result==0) throw new SQLException("등록 실패하였습니다.");
	}

	@Override
	public void update(ProductDTO product) throws SQLException {
		ProductDTO dbPro=prodDAO.selectByProductCode(product.getProductCode());
		if(dbPro==null) {
			throw new SQLException("상품코드를 다시 입력해주세요 ");
		} //수정할때 비밀번호나 사전에 요구사항 없는지 확인 -->id
		//user꺼 필요한가..?
		if(prodDAO.update(product)==0) {
			throw new SQLException("수정되지않았습니다. ");
		}
		
	}

	@Override
	public void delete(int productCode, String password) throws SQLException {
		ProductDTO dbPro=prodDAO.selectByProductCode(productCode);
		if(dbPro==null) {
			throw new SQLException("상품코드를 다시 입력해주세요 ");
		} //수정할때 비밀번호나 사전에 요구사항 없는지 확인 -->id
		//user꺼 필요한가..?
		if(prodDAO.delete(productCode,password)==0) {
			throw new SQLException("수정되지않았습니다. ");
		}
	}

	@Override
	public List<ProductDTO> monthlySalesByCode() throws SQLException {

		return null;
	}

	@Override
	public List<ProductDTO> yearlySalesByCode() throws SQLException {

		return null;
	}

	@Override
	public List<ReviewDTO> reviewByProductCode(int productCode) throws SQLException {
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		reviewList=prodDAO.reviewByProductCode(productCode);
		return reviewList;
	}

}
