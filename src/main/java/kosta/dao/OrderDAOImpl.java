package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.OrderDTO;
import kosta.dto.OrderLineDTO;
import kosta.dto.PointDTO;
import kosta.dto.ProductDTO;
import kosta.dto.UserDTO;

public class OrderDAOImpl implements OrderDAO {
	
	ProductDAO productDao = new ProductDAOImpl();

	/**
	 * 주문하기
	 * */
	@Override
	public int orderInsert(OrderDTO order) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			
			ps = con.prepareStatement("insert into orders values(order_code_seq.nextval, ?, sysdate, ?, 0, ?, 0, ?, 0)");
			ps.setString(1, order.getUserId());
			ps.setString(2, order.getOrderAddr());
			ps.setInt(3, order.getOrderType());
			ps.setInt(4, getTotalPay(order));
			
			result = ps.executeUpdate();
			
			if(result == 0) {
				con.rollback();
				throw new SQLException("주문 실패했습니다.");
			} else {
				int res [] = orderLineInsert(con, order);
				for(int i: res) {
					if(i != 1) {
						con.rollback();
						throw new SQLException("주문할 수 없습니다.");
					}
				}
				
				decrementQty(con, order.getOrderLineList());
				savePoint(con, order);
				saveUserPoint(con, order);
				con.commit();
			}
		} finally {
			con.commit();
			DbUtil.dbClose(con, ps);
		}
		
		return result;
	}
	
	public int getTotalPay(OrderDTO order) throws SQLException {
		List<OrderLineDTO> orderLineList = order.getOrderLineList();
		int total = 0;
		
		for(OrderLineDTO line: orderLineList) { 
			ProductDTO product = productDao.productSelectByCode(line.getProductCode()); 
				if(product == null)
					throw new SQLException("상품 코드 오류로 주문 실패했습니다."); 
				else if(product.getProductQty() < line.getOrderlineQty()) 
					throw new SQLException("재고량이 부족합니다.");
		 
			total += line.getOrderlineQty() * product.getProductPrice(); 
		}
		 
		return total;
	}
	

	public int[] orderLineInsert(Connection con, OrderDTO order) throws SQLException {
		PreparedStatement ps = null;
		int result[] = null;
		try {
			ps = con.prepareStatement("insert into orderline values(orderline_code_seq.nextval, order_code_seq.currval, ?, ?, ?, ?, ?)");
			/*
			 * for(OrderLine orderLine: order.getOrderLineList()) { Product product =
			 * productDao.productSelectByCode(orderLine.getProductCode());
			 * 
			 * ps.setString(1, order.getUserId()); ps.setInt(2, product.getProductCode());
			 * ps.setInt(3, orderLine.getOrderlinePrice()); ps.setInt(4,
			 * orderLine.getOrderlineQty()); ps.setInt(5, product.getProductPrice() *
			 * orderLine.getOrderlineQty()); ps.addBatch(); ps.clearParameters(); }
			 */
			result = ps.executeBatch();
			
		} finally {
			DbUtil.dbClose(null, ps);
		}
		return result;
	}
	
	public int[] decrementQty(Connection con, List<OrderLineDTO> orderLineList) throws SQLException {
		PreparedStatement ps = null;
		int result[] = null;
		try {
			ps = con.prepareStatement("update product set p_qty = p_qty-? where p_code=?");
			for(OrderLineDTO orderLine: orderLineList) {
				ps.setInt(1, orderLine.getOrderlineQty());
				ps.setInt(2, orderLine.getProductCode());
				
				ps.addBatch();
				ps.clearParameters();
			}
			
			result = ps.executeBatch();
		} finally {
			DbUtil.dbClose(null, ps, null);
		}
		return result;
	}

	public int savePoint(Connection con, OrderDTO order) throws SQLException {
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			ps = con.prepareStatement("update point set point_save=? where orders_code=? and users_id=?");
			ps.setInt(1, (int)(order.getOrderPay() * 0.03));
			ps.setInt(2, order.getOrderCode());
			ps.setString(3, order.getUserId());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(null, ps);
		}
		
		return result;
	}
	
	public int saveUserPoint(Connection con, OrderDTO order) throws SQLException {
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			ps = con.prepareStatement("update users set user_point=user_point+? where users_id=?"); 
			ps.setInt(1, (int)(order.getOrderPay() * 0.03));
			ps.setString(2, order.getUserId());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(null, ps);
		}
		
		return result;
	}
	
	
	
	/**
	 * 주문 취소
	 * */
	@Override
	public int orderCancel(OrderDTO order) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			
			ps = con.prepareStatement("update orders set order_complete=3 where order_code=?");
			ps.setInt(1, order.getOrderCode());
			result = ps.executeUpdate();
			
			if(result == 0) {
				con.rollback();
				throw new SQLException("주문이 취소되지 않았습니다.");
			} else {
				int res [] = orderLineDelete(con, order);
				for(int i: res) {
					if(i != 1) {
						con.rollback();
						throw new SQLException("주문할 수 없습니다.");
					}
				}
				
				decrementQty(con, order.getOrderLineList());
				savePoint(con, order);
				con.commit();
			}
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		return result;
	}
	
	public int[] orderLineDelete(Connection con, OrderDTO order) throws SQLException  {
		PreparedStatement ps = null;
		int result[] = null;
		try {
			ps = con.prepareStatement("delete from orderline where order_code=? and user_id=? and p_code=?");
			
			 for(OrderLineDTO orderLine: order.getOrderLineList()) { 
				 ProductDTO product = productDao.productSelectByCode(orderLine.getProductCode());
			 
				 ps.setInt(1, order.getOrderCode()); 
				 ps.setString(2, order.getUserId()); 
				 ps.setInt(3, product.getProductCode());
				 
				 ps.addBatch(); 
				 ps.clearParameters(); 
			}
			 
			result = ps.executeBatch();
			
		} finally {
			DbUtil.dbClose(null, ps);
		}
		return result;
	}

	
	
	/**
	 * 주문 내역 보기
	 * */
	@Override
	public List<OrderDTO> selectOrderByUserId(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement("select * from orders where users_id=?");
			ps.setString(1, userId);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderDTO order = new OrderDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9));
				List<OrderLineDTO> orderLineList = selectOrderLine(con, order.getOrderCode());
				order.setOrderLineList(orderLineList);
				list.add(order);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}
	
	public List<OrderLineDTO> selectOrderLine(Connection con, int orderCode) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<OrderLineDTO> list = new ArrayList<OrderLineDTO>();
		
		try {
			ps = con.prepareStatement("select * from orderline where order_code = ?");
			ps.setInt(1, orderCode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderLineDTO orderLine = new OrderLineDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7));
				list.add(orderLine);
			}
		} finally {
			DbUtil.dbClose(null, ps, rs);
		}
		return list;
	}
}
