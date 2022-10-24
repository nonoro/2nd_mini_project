package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jni.OS;

import kosta.dto.ProductCategoryDTO;
import kosta.dto.ProductDTO;
import kosta.dto.ReviewDTO;
import kosta.util.DbUtil;

public class ProductDAOImpl implements ProductDAO {
	public ProductDAOImpl() {
		
	}
	@Override
	public List<ProductDTO> selectAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps= null;
		ResultSet rs= null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		String sql="select* from product";
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			rs= ps.executeQuery();
			while(rs.next()) {
				ProductDTO product= new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getString(3),
						rs.getInt(4), rs.getInt(5), rs.getString(6));
			list.add(product);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	@Override
	public ProductDTO selectByProductCode(int productCode) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ProductDTO product = null;
		
		String sql= "select * from Product where p_code=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, productCode);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				product = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getString(3),
						rs.getInt(4), rs.getInt(5), rs.getString(6));
			}
		}finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return product;
	}

	@Override
	public int insert(ProductDTO product) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql= "insert into Product values(?,?,?,?,?,?,?)";//insert into Electronics values(?,?,?,?,?,sysdate,0,?,?)
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, product.getProductCode());
			ps.setInt(2, product.getProductCategory());
			ps.setString(3, product.getProductName());
			ps.setInt(4, product.getProductPrice());
			ps.setInt(5, product.getProductQty());
			ps.setString(6, product.getProductExplain());
			ps.setString(7, product.getFname());

			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int update(ProductDTO product) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql= "update product \r\n"
				+ "set p_name=?,p_price=?,p_qty=?,p_explain=?\r\n"
				+ "where p_code=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, product.getProductName());
			ps.setInt(2, product.getProductPrice());
			ps.setInt(3, product.getProductQty());
			ps.setString(4, product.getProductExplain());
			ps.setInt(5, product.getProductCode());
			
			result=ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int delete(int productCode, String loginPwd) throws SQLException {
		  PreparedStatement ps = null;
		  Connection con =null;
		  int result=0;
		  try {
		   con = DbUtil.getConnection();
		   ps = con.prepareStatement("delete from product where p_code=?");
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
	public int monthlySalesByCode(int productCode, String orderDate ) throws SQLException {
		Connection con =null;
		PreparedStatement ps= null;
		ResultSet rs= null;
		int result=0;
		
		String sql="SELECT SUM(ORDERLINE_TOTAL_PRICE) FROM ORDERLINE ol , T_ORDER o\r\n"
				+ "WHERE ol.order_code = o.order_code and to_char(o.order_date) like ? and ol.p_code=?";
		try {
			con=DbUtil.getConnection(); 
			ps=con.prepareStatement(sql);

			ps.setString(1, "%"+orderDate+"%");
			ps.setInt(2, productCode);
			
			
			rs=ps.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return result;
	}
	

	@Override
	public int yearlySalesByCode(int productCode,String orderDate) throws SQLException {
		Connection con =null;
		PreparedStatement ps= null;
		ResultSet rs= null;
		int result=0;
		
		String sql="SELECT SUM(ORDERLINE_TOTAL_PRICE) FROM ORDERLINE ol , T_ORDER o\r\n"
				+ "WHERE ol.order_code = o.order_code and to_char(o.order_date) Like ? and ol.p_code=?;";
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, orderDate+"%");
			ps.setInt(2, productCode);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		
		
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return result;
	}
	@Override
	public List<ProductDTO> productSelectByCategory(String arrange, int productCategory) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs= null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql="select p_code, p_name, p_price, p_explain\r\n"
				+ "from product p, product_category pc\r\n"
				+ "where p.p_category_code = pc.p_category_code and p.p_category_code=?";
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1,productCategory);
			rs= ps.executeQuery();
			while(rs.next()) {
				ProductDTO product= new ProductDTO(rs.getInt(1), rs.getString(2),rs.getInt(3),rs.getString(4));
			list.add(product);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}
	/**
	 * 주문많은순 정렬
	 * */
	@Override
	public List<ProductDTO> selectByarrange(String arrange) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql="select  p.p_code, p.p_name, p.p_price, p.p_explain, count(distinct ol.order_code) as ordercount from product p join orderline ol on ol.p_code=p.p_code group by p.p_code,p.p_name, p.p_price, p.p_explain "+arrange;//주문많은순, 별점, 최신수 ----
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			rs= ps.executeQuery();
			while(rs.next()) {
				ProductDTO product= new ProductDTO(rs.getInt(1), rs.getString(2),rs.getInt(3),rs.getString(4));
			list.add(product);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}
	
	
	
}
