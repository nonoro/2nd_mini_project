package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.OrderDAO;
import kosta.dao.OrderDAOImpl;
import kosta.dto.Order;
import kosta.dto.Point;
import kosta.dto.User;

public class OrderServiceImpl implements OrderService {
	private OrderDAO orderDao = new OrderDAOImpl();

	@Override
	public int orderInsert(Order order) throws SQLException {
		int result = orderDao.orderInsert(order);
		if(result == 0) throw new SQLException("주문에 실패했습니다.");
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

	@Override
	public int userPoint(User user) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Order> selectOrderByUserId(String userId) throws SQLException {
		List<Order> list = orderDao.selectOrderByUserId(userId);
		if(list == null || list.size() == 0) throw new SQLException(userId + "님의 주문 내역이 없습니다.");
		return list;
	}

}
