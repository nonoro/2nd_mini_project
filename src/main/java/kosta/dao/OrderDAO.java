package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.Order;
import kosta.dto.OrderLine;
import kosta.dto.Point;
import kosta.dto.User;

public interface OrderDAO {

	/**
	 * 주문하기
	 * */
	int orderInsert(Order order) throws SQLException;
	
	int orderCancel(Order order) throws SQLException;
	
	int orderPoint(Point point) throws SQLException;
	
	/**
	 * 주문 내역 보기
	 * */
	List<Order> selectOrderByUserId(String userId) throws SQLException; 
}
