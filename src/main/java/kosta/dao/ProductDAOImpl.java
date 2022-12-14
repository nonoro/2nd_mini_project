package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.ProductDTO;
import kosta.dto.ProductFileDTO;
import kosta.util.DbUtil;

public class ProductDAOImpl implements ProductDAO {
	public ProductDAOImpl() {

	}

	@Override
	public List<ProductDTO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();

		String sql = "select *\r\n" + "from product";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductDTO product = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4),
						rs.getInt(5), rs.getString(6), rs.getString(7), null, null);
				list.add(product);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	@Override
	public ProductDTO selectByProductCode(int productCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ProductDTO product = null;
		ProductFileDTO productFile = null;

		String sql = "select * from product where product_code=?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, productCode);

			rs = ps.executeQuery();

			if (rs.next()) {
				List<ProductFileDTO> productFileList = DetailPhotoByProductName(productCode);
				ProductFileDTO detailPhoto = DetailPhoto(productCode);
				product = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), productFileList, detailPhoto.getProductFile());
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return product;

	}

	/**
	 * 상품디테일 페이지에 대표 사진 및 ,
	 */
	List<ProductFileDTO> DetailPhotoByProductName(int productCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductFileDTO> productFileList = new ArrayList<ProductFileDTO>();
		ProductFileDTO productFileDTO = new ProductFileDTO();

		String sql = "select product_file_name from product_file where product_code=? AND PRODUCT_FILE_STATE=2";


		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, productCode);

			rs = ps.executeQuery();
			while (rs.next()) {
				productFileDTO = new ProductFileDTO(0, productCode, rs.getString(1),2);

				productFileList.add(productFileDTO);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return productFileList;

	}
	
	/**
	 * 상품디테일 페이지에 대표 사진 및 ,
	 */
	ProductFileDTO DetailPhoto(int productCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ProductFileDTO productFileDTO = new ProductFileDTO();
		String sql = "select product_file_name from product_file where product_code=? AND PRODUCT_FILE_STATE=3";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, productCode);

			rs = ps.executeQuery();
			if (rs.next()) {
				productFileDTO = new ProductFileDTO(0, productCode, rs.getString(1),3);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return productFileDTO;
	}

	/** 상품이름별 */
	@Override
	public ProductDTO selectByProductName(String productName) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ProductDTO productbyname = null;

		String sql = "select * from Product where product_name=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, productName);

			rs = ps.executeQuery();
			if (rs.next()) {
				productbyname = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), null, null);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return productbyname;
	}

	@Override
	public int insert(ProductDTO product) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "insert into Product values(PRODUCT_CODE_SEQ.nextval,?,?,?,?,?,?)";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			//ps.setInt(1, product.getProductCode());
			ps.setInt(1, product.getProductCategory());
			ps.setString(2, product.getProductName());
			ps.setInt(3, product.getProductPrice());
			ps.setInt(4, product.getProductQty());
			ps.setString(5, product.getProductExplain());
			ps.setString(6, product.getFname());

			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}
	
	public int insertDetailPhoto(ProductFileDTO productFileDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "insert into product_file values(product_file_seq.nextval,PRODUCT_CODE_SEQ.currval,?,2)";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, productFileDTO.getProductFile());
			

			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}
	public int insertInfoPhoto(ProductFileDTO productFileDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "insert into product_file values(product_file_seq.nextval,PRODUCT_CODE_SEQ.currval,?,3)";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, productFileDTO.getProductFile());
			

			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}
	
	
	

	@Override
	public int update(ProductDTO product) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "update product \r\n" + "set product_name=?,product_price=?,product_qty=?,product_explain=?\r\n"
				+ "where product_code=?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, product.getProductName());
			ps.setInt(2, product.getProductPrice());
			ps.setInt(3, product.getProductQty());
			ps.setString(4, product.getProductExplain());
			ps.setInt(5, product.getProductCode());

			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int delete(int productCode, String loginPwd) throws SQLException {
		PreparedStatement ps = null;
		Connection con = null;
		int result = 0;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement("delete from product where product_code=?");
			ps.setInt(1, productCode);
			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int monthlySalesByCode(int productCode, String orderDate) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;

		String sql = "SELECT SUM(ORDERLINE_TOTAL_PRICE) FROM ORDERLINE ol , orders o\r\n"
				+ "WHERE ol.order_code = o.order_code and to_char(o.order_date) like ? and ol.product_code=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, "%" + orderDate + "%");
			ps.setInt(2, productCode);

			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return result;
	}

	@Override
	public int yearlySalesByCode(int productCode, String orderDate) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;

		String sql = "SELECT SUM(ORDERLINE_TOTAL_PRICE) FROM ORDERLINE ol , orders o\r\n"
				+ "WHERE ol.order_code = o.order_code and to_char(o.order_date) Like ? and ol.product_code=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, orderDate + "%");
			ps.setInt(2, productCode);

			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return result;
	}

	/**
	 * 카테고리별 전체 상품 띄우기
	 */
	@Override
	public List<ProductDTO> productSelectByCategory(int productCategory) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select distinct(p.product_code), p.product_name, p.product_price, p.product_explain, p.product_file_name\r\n"
				+ "from product p, product_category pc\r\n"
				+ "where p.product_category = pc.product_category_code and p.product_category=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, productCategory);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductDTO product = new ProductDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5));
				list.add(product);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}


	/**
	 * 정렬 - 주문많은순 1 , 후기 많은순 2, 별점 높은순
	 */
	@Override
	public List<ProductDTO> selectByarrange(String arrange) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select  p.product_code, p.product_name, p.product_price, p.product_explain,p.product_file_name, count(distinct ol.order_code) as ordercount, count(distinct r.review_code) as reviewcount, NVL(AVG(R.review_GRADE),0) AS STAR_AVG\r\n"
				+ "from product p join orderline ol on p.product_code=ol.product_code\r\n"
				+ "LEFT OUTER JOIN review r ON p.product_code= r.product_code \r\n"
				+ "group by p.product_code, p.product_name, p.product_price, p.product_explain,p.product_file_name "
				+ arrange;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductDTO product = new ProductDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getString(5));
				list.add(product);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

}