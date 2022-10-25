package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.OrderDTO;
import kosta.dto.OrderLineDTO;

public interface OrderService {
	/**
	 * 주문하기
	 */
	int orderInsert(OrderDTO order) throws SQLException;

	/**
	 * 주문 취소
	 * */
	int orderCancel(OrderDTO order) throws SQLException;
	
	/**
	 * 주문 내역 보기
	 * */
	List<OrderDTO> selectOrderByUserId(String userId) throws SQLException; 
	
	/**
	 * 주문 내역 상세 보기
	 * */
	List<OrderLineDTO> selectOrderLineByOrderCode(int orderCode) throws SQLException; 

	
	/**
	 * 주문상품 배송상태 조회
	 */
	OrderDTO selectState(int orderCode)throws SQLException;

}
