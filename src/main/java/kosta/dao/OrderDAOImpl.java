 package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.OrderDTO;

public class OrderDAOImpl implements OrderDAO {

	@Override
	public List<OrderDTO> selectMyOrder(String userId) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		OrderDTO order = null;
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		String sql = "SELECT * FROM T_ORDER WHERE USER_ID=?";
		
		try {
			con = DbUtil.getConnection();
			ps= con.prepareStatement(sql);
			
			ps.setString(1, userId);
		    rs = ps.executeQuery(); 
		    
		    while(rs.next()) {
		    	order = new OrderDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
		    			rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9));
		    	list.add(order);
		    }
		      
		    
		}finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	@Override
	public OrderDTO selectState(int orderCode) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		OrderDTO order = null;
		
		String sql = "SELECT ORDER_COMPLETE FROM T_ORDER WHERE ORDER_CODE=?";
		
		try {
			con = DbUtil.getConnection();
			ps= con.prepareStatement(sql);
			
			ps.setInt(1, orderCode);
		    rs = ps.executeQuery(); 
		    
		    if(rs.next()) {
		    	order = new OrderDTO(0, null, null, null, rs.getInt(1), 0, 0, 0, 0);
		    }
		      
		    
		}finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return order;
	}

	@Override
	public int orderCancle(int orderCode) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result = 0;
		
		String sql = "UPDATE ORDER SET ORDER_STATE=2 WHERE ORDER_CODE=?";
		
		try {
			con = DbUtil.getConnection();
			ps= con.prepareStatement(sql);
			
			ps.setInt(1, orderCode);
		    
		    result=ps.executeUpdate();
		      
		    
		}finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

}
