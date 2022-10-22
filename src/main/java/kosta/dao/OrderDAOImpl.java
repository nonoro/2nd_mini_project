package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.Order;
import kosta.dto.OrderLine;
import kosta.dto.Point;
import kosta.dto.Product;
import kosta.dto.User;

public class OrderDAOImpl implements OrderDAO {
	
	//ProductDAO productDao = new ProductDAOImpl();

	/**
	 * 주문하기
	 * */
	@Override
	public int orderInsert(Order order) throws SQLException {
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
				con.commit();
			}
		} finally {
			con.commit();
			DbUtil.dbClose(con, ps);
		}
		
		return result;
	}
	
	public int getTotalPay(Order order) throws SQLException {
		List<OrderLine> orderLineList = order.getOrderLineList();
		int total = 0;
		/*
		 * for(OrderLine line: orderLineList) { Product product =
		 * productDao.productSelectByCode(line.getProductCode()); if(product == null)
		 * throw new SQLException("상품 코드 오류로 주문 실패했습니다."); else
		 * if(product.getProductQty() < line.getOrderlineQty()) throw new
		 * SQLException("재고량이 부족합니다.");
		 * 
		 * total += line.getOrderlineQty() * product.getProductPrice(); }
		 */
		return total;
	}
	

	public int[] orderLineInsert(Connection con, Order order) throws SQLException {
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
	
	public int[] decrementQty(Connection con, List<OrderLine> orderLineList) throws SQLException {
		PreparedStatement ps = null;
		int result[] = null;
		try {
			ps = con.prepareStatement("update product set p_qty = p_qty-? where p_code=?");
			for(OrderLine orderLine: orderLineList) {
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

	public int savePoint(Connection con, Order order) throws SQLException {
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
	
	
	@Override
	public int orderCancel(Order order) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int orderPoint(Point point) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 주문 내역 보기
	 * */
	@Override
	public List<Order> selectOrderByUserId(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList<Order>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement("select * from orders where users_id=?");
			ps.setString(1, userId);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Order order = new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9));
				List<OrderLine> orderLineList = selectOrderLine(con, order.getOrderCode());
				order.setOrderLineList(orderLineList);
				list.add(order);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}
	
	public List<OrderLine> selectOrderLine(Connection con, int orderCode) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<OrderLine> list = new ArrayList<OrderLine>();
		
		try {
			ps = con.prepareStatement("select * from orderline where order_code = ?");
			ps.setInt(1, orderCode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderLine orderLine = new OrderLine(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7));
				list.add(orderLine);
			}
		} finally {
			DbUtil.dbClose(null, ps, rs);
		}
		return list;
	}
}
