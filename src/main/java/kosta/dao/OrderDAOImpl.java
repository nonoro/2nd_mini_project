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
import kosta.util.DbUtil;

public class OrderDAOImpl implements OrderDAO {
	ProductDAO productDao = new ProductDAOImpl();
	
	/**
	 * 주문하기
	 * */
	public int orderInsert(OrderDTO order) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			
			ps = con.prepareStatement("insert into orders values(order_seq.nextval , ?, sysdate, ?, 0, ?, ?, ?, ?)");
			ps.setString(1, order.getUserId());
			ps.setString(2, order.getOrderAddr());
			ps.setInt(3, order.getOrderType());
			ps.setInt(4, order.getUsedPoint());
			ps.setInt(5, order.getOrderTotalPrice());
			ps.setInt(6, order.getOrderPay());
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
				savePoint(con, order); //point테이블에 포인트 적립
				saveUserPoint(con, order);
				
				con.commit();
			}
		} finally {
			con.commit();
			DbUtil.dbClose(con, ps);
		}
		
		return result;
	}

	public int[] orderLineInsert(Connection con, OrderDTO order) throws SQLException {
		PreparedStatement ps = null;
		int result[] = null;
		try {

			ps = con.prepareStatement("insert into orderline values(orderline_code_seq.nextval, order_seq.currval, ?, ?, ?, ?, ?, ?)");

			for(OrderLineDTO orderLine: order.getOrderLineList()) { 
				ProductDTO product = productDao.selectByProductCode(orderLine.getProductCode());
				ps.setString(1, order.getUserId()); 
				ps.setInt(2, product.getProductCode());
				ps.setInt(3, orderLine.getOrderlinePrice()); 
				ps.setInt(4, orderLine.getOrderlineQty()); 
				ps.setInt(5, product.getProductPrice() * orderLine.getOrderlineQty()); 
				ps.setString(6, product.getProductName()); 
				
				System.out.println("orderLine.getOrderlinePrice(): " + orderLine.getOrderlinePrice());
				System.out.println("product.getProductPrice(): " + product.getProductPrice());
				
				ps.addBatch(); 
				ps.clearParameters(); 
			}
			
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
			ps = con.prepareStatement("update product set product_qty = product_qty-? where product_code=?");
			for(OrderLineDTO orderLine: orderLineList) {
				ps.setInt(1, orderLine.getOrderlineQty());
				ps.setInt(2, orderLine.getProductCode());
				
				ps.addBatch();
				ps.clearParameters(); // 변수 지움
			}
			
			result = ps.executeBatch();
		} finally {
			DbUtil.dbClose(null, ps, null);
		}
		return result;
	}

	/**
	 * --1) 포인트 사용 없이 결재 (sysdate, null) : insert into point values(point_seq.nextval,?,? , ? ,sysdate,null )
       --2_ 포인트 + 돈낸금액(sysdate, sysdate): insert into point values(point_seq.nextval,?,? , ? ,sysdate,sysdate )
       --3) 전액 포인트 결재 - null sysdate : insert into point values(point_seq.nextval,?,? , ? ,null,sysdate )
	 * 
	 * */
	public int savePoint(Connection con, OrderDTO order) throws SQLException {
		
		PreparedStatement ps = null;
		int result =0;
		String sql="insert into point values(point_seq.nextval,order_seq.currval,? , ? ,";
		try {
			if(order.getUsedPoint()==0) {
				sql+="sysdate,null)";
			}else if(order.getUsedPoint()==order.getOrderPay()) {
				sql+="null,sysdate )";
			}else {
				sql+="sysdate,sysdate )";
			}
			
			ps = con.prepareStatement(sql);
			ps.setString(1, order.getUserId());
			ps.setInt(2, (int) (order.getOrderPay() * 0.03));
			
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(null, ps);
		}

		return result;

	}
	  
	  public int saveUserPoint(Connection con, OrderDTO order) throws SQLException{//유저 테이블 
		  PreparedStatement ps = null;
		  int result = 0;
	     String sql="update users set user_point=user_point+? where user_id=?";
	     try {
		    ps = con.prepareStatement(sql);
	  
			ps.setInt(1, (int) (order.getOrderPay() * 0.03));
			ps.setString(2, order.getUserId());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(null, ps);
		}
	  
	  return result; }
	
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
				
				incrementQty(con, order.getOrderLineList()); //재고량 늘리기 
				losePoint(con, order);//
				loseUserPoint(con, order);
				
				//상세삭제
				int re = orderLineDelete(con, order);
				 if(re==0) {
						con.rollback();
						throw new SQLException("주문할 수 없습니다.");
					}
				
				con.commit();
			}
		} finally {
			DbUtil.dbClose(con, ps);
		}
		
		return result;
	}
	
	/**
	 * 주문상세 삭제
	 * */
	public int orderLineDelete(Connection con, OrderDTO order) throws SQLException  {
		PreparedStatement ps = null;
		int result = 0;
		try {
			ps = con.prepareStatement("delete from orderline where order_code=?");
			ps.setInt(1, order.getOrderCode());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(null, ps);
		}
		return result;
	}
	/**
	 * 재고 증가
	 * */
	public int[] incrementQty(Connection con, List<OrderLineDTO> orderLineList) throws SQLException {
		PreparedStatement ps = null;
		int result[] = null;
		try {
			ps = con.prepareStatement("update product set PRODUCT_QTY = PRODUCT_QTY+? where PRODUCT_CODE=?");
			for(OrderLineDTO orderLine : orderLineList) {
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
	
	public int losePoint(Connection con, OrderDTO order) throws SQLException {
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			ps = con.prepareStatement("delete from point where order_code=?");
			ps.setInt(1, order.getOrderCode());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(null, ps);
		}
		
		return result;
	}

	public int loseUserPoint(Connection con, OrderDTO order) throws SQLException {
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			ps = con.prepareStatement("update users set user_point=user_point-? where user_id=?"); 
			ps.setInt(1, (int)(order.getOrderPay() * 0.03));
			ps.setString(2, order.getUserId());
			result = ps.executeUpdate();
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
			ps = con.prepareStatement("select * from orders where user_id=? order by order_code desc");
			ps.setString(1, userId);
			rs = ps.executeQuery();
			
			while(rs.next()) {				
				OrderDTO order = new OrderDTO(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9));
				
				List<OrderLineDTO> orderLines = selectOrderLineByOrderCode(order.getOrderCode());
				order.setOrderLineList(orderLines);
				
				list.add(order);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}
	
	/**
	 * 주문 내역 상세 보기
	 * */
	public List<OrderLineDTO> selectOrderLineByOrderCode(int orderCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<OrderLineDTO> list = new ArrayList<OrderLineDTO>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement("select * from orderline where order_code = ?");
			ps.setInt(1, orderCode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderLineDTO orderLine = new OrderLineDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
				list.add(orderLine);
			}
		} finally {
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
		
		String sql = "SELECT ORDER_COMPLETE FROM ORDERS WHERE ORDER_CODE=?";
		
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
		
		String sql = "UPDATE ORDERS SET ORDER_STATE=2 WHERE ORDER_CODE=?";
		
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

	@Override
	public List<OrderDTO> selectMyOrder(String userId) throws SQLException {
		 Connection con=null;
	      PreparedStatement ps=null;
	      ResultSet rs=null;
	      OrderDTO order = null;
	      List<OrderDTO> list = new ArrayList<OrderDTO>();
	      
	      String sql = "SELECT * FROM ORDERS WHERE USER_ID=?";
	      
	      try {
	         con = DbUtil.getConnection();
	         ps= con.prepareStatement(sql);
	         
	         ps.setString(1, userId);
	          rs = ps.executeQuery(); 
	          
	          while(rs.next()) {
	             order = new OrderDTO(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), 
	                   rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9));
	             list.add(order);
	          }
	            
	      }finally {
	         DbUtil.dbClose(con, ps, rs);
	      }
	      return list;
	}
}