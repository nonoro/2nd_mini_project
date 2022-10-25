package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.OrderDAO;
import kosta.dao.OrderDAOImpl;
import kosta.dto.OrderDTO;
import kosta.dto.OrderLineDTO;

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
	public List<OrderLineDTO> selectOrderLineByOrderCode(int orderCode) throws SQLException {
		List<OrderLineDTO> lineList = orderDao.selectOrderLineByOrderCode(orderCode);
		if(lineList == null || lineList.size() == 0) throw new SQLException(orderCode + "에 해당하는 주문 내역이 없습니다.");
		return lineList;
	}
	

}
