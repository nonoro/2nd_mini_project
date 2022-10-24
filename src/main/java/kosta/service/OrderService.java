package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.OrderDTO;
import kosta.dto.PointDTO;
import kosta.dto.UserDTO;

public interface OrderService {
	int orderInsert(OrderDTO order) throws SQLException;

	int orderCancel(OrderDTO order) throws SQLException;
	
	int orderPoint(PointDTO point) throws SQLException;
	
	int userPoint(UserDTO user) throws SQLException;
	
	/**
	 * 주문 내역 보기
	 * */
	List<OrderDTO> selectOrderByUserId(String userId) throws SQLException; 
	
	
	/**
	 * 주문상품 배송상태 조회
	 */
	OrderDTO selectState(int orderCode)throws SQLException;
	
	
	
	
}
