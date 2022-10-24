package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.OrderDAO;
import kosta.dao.OrderDAOImpl;
import kosta.dto.OrderDTO;

public class OrderServiceImpl implements OrderService {
	private OrderDAO orderDao = new OrderDAOImpl();

	/**
	 * 주문하기
	 */
	@Override
	public int orderInsert(OrderDTO order) throws SQLException {
		int result = orderDao.orderInsert(order);
		if(result == 0) throw new SQLException("주문에 실패했습니다.");
		return result;
	}
	
	/**
	 * 주문 취소
	 * */
	@Override
	public int orderCancel(OrderDTO order) throws SQLException {
		int result = orderDao.orderCancel(order);
		if(result == 0) throw new SQLException("주문이 취소되지 않았습니다.");
		return result;
	}
	
	/**
	 * 주문 내역 보기
	 * */
	@Override
	public List<OrderDTO> selectOrderByUserId(String userId) throws SQLException {
		List<OrderDTO> list = orderDao.selectOrderByUserId(userId);
		if(list == null || list.size() == 0) throw new SQLException(userId + "님의 주문 내역이 없습니다.");
		return list;
	}

	@Override
	public OrderDTO selectState(int orderCode) throws SQLException {
		OrderDTO order = orderDao.selectState(orderCode);
		if(order == null) throw new SQLException("배송상태를 조회할 수 없습니다.");
		
		return order;
	}
}
