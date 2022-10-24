package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.OrderDTO;


public interface OrderDAO {
   /**
    * 내 주문내역 조회 SELECT * FROM T_ORDER WHERE USER_ID=?;
    */
   List<OrderDTO> selectMyOrder(String userId) throws SQLException;

   /**
    * 주문상품 배송상태 조회 SELECT ORDER_COMPLETE FROM T_ORDER WHERE ORDER_CODE=?;
    */
   OrderDTO selectState(int orderCode) throws SQLException;

   /**
    * 주문상품 취소(환불) 요청 UPDATE ORDER SET ORDER_STATE=2 WHERE ORDER_CODE=?;
    */
   int orderCancle(int orderCode) throws SQLException;


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


}