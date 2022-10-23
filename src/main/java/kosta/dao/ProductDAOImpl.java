package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		
		String sql= "select * from Product where productCode=?";
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
		String sql= "insert into Product values(?,?,?,?,?,?)";//insert into Electronics values(?,?,?,?,?,sysdate,0,?,?)
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, product.getProductCode());
			ps.setInt(2, product.getProductCategory());
			ps.setString(3, product.getProductName());
			ps.setInt(4, product.getProductPrice());
			ps.setInt(5, product.getProductQty());
			ps.setString(6, product.getProductExplain());
			
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
				+ "where p_code=?;";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			
			ps.setString(1, product.getProductName());
			ps.setInt(2, product.getProductPrice());
			ps.setInt(3, product.getProductQty());
			ps.setString(4, product.getProductExplain());
			
			result=ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int delete(int productCode, String password) throws SQLException {
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
	public List<ProductDTO> monthlySalesByCode() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductDTO> yearlySalesByCode() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ReviewDTO> reviewByProductCode(int productCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs= null;
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		String sql = "select *\r\n"
				+ "from review\r\n"
				+ "where p.p_code=?";
		
		try {
			con = DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, productCode);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ReviewDTO review = new ReviewDTO(rs.getInt(1), rs.getString(2),rs.getInt(3), 
						rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
				list.add(review);
			}
			
		}finally {
			DbUtil.dbClose(con, ps, rs);
		}		
		
		return list;
	}
	
}
