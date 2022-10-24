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
		if (listAll==null || listAll.size()==0){
			throw new SQLException(" 등록된 상품이 없습니다.");
		}
				
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
		}
		if(prodDAO.update(product)==0) {
			throw new SQLException("수정되지않았습니다. ");
		}
		
	}

	@Override //id
	public void delete(int productCode, String loginPwd, String saveDir) throws SQLException {
		ProductDTO dbPro=prodDAO.selectByProductCode(productCode);
		if(dbPro==null) {
			throw new SQLException("상품코드를 다시 입력해주세요 ");
		} //수정할때 비밀번호나 사전에 요구사항 없는지 확인 -->id
		//user꺼 필요한가..?
		if(prodDAO.delete(productCode,loginPwd)==0) {
			throw new SQLException("삭제되지않았습니다. ");
		}
	}

	@Override
	public int monthlySalesByCode(int productCode, String orderDate) throws SQLException {
		int result=prodDAO.monthlySalesByCode(productCode,orderDate);
		if(result==0) {
			throw new SQLException("상품코드를 다시 입력해주세요 ");
		}
		if (prodDAO.monthlySalesByCode(productCode, orderDate)==0) {
			throw new SQLException("결과에 해당하는 값이 없습니다.");
		}
		return result;
	}

	@Override
	public int yearlySalesByCode(int productCode, String orderDate) throws SQLException {
		int result=prodDAO.yearlySalesByCode(productCode,orderDate);
		if(result==0) {
			throw new SQLException("상품코드를 다시 입력해주세요 ");
		}
		if (prodDAO.monthlySalesByCode(productCode, orderDate)==0) {
			throw new SQLException("결과에 해당하는 값이 없습니다.");
		}
		return result;
	}

	@Override
	public List<ProductDTO> productSelectByCategory(String arrange, int productCategory) throws SQLException {
		List<ProductDTO> cateList = new ArrayList<ProductDTO>();
		cateList=prodDAO.productSelectByCategory(arrange, productCategory);
		if (cateList==null || cateList.size()==0){
			throw new SQLException(" 등록된 상품이 없습니다.");
		}
		return cateList;
	}

	@Override
	public List<ProductDTO> selectByarrange(String arrange) throws SQLException {
		List<ProductDTO> orderBestList = new ArrayList<ProductDTO>();
		orderBestList=prodDAO.selectByarrange(arrange);
		if (orderBestList==null || orderBestList.size()==0){
			throw new SQLException(" 등록된 상품이 없습니다.");
		}
		return orderBestList;
	}
	

}
