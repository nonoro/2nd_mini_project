package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.OrderDTO;
import kosta.dto.OrderLineDTO;
import kosta.dto.PointDTO;
import kosta.dto.UserDTO;

public interface OrderDAO {

	/**
	 * 주문하기
	 * */
	int orderInsert(OrderDTO order) throws SQLException;
	
	/**
	 * 주문 취소
	 * */
	int orderCancel(OrderDTO order) throws SQLException;
	
	/**
	 * 주문 내역 보기
	 * */
	List<OrderDTO> selectOrderByUserId(String userId) throws SQLException; 
}
