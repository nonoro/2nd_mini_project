package kosta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.dto.OrderDTO;
import kosta.dto.OrderLineDTO;
import kosta.service.OrderService;
import kosta.service.OrderServiceImpl;

public class OrderController implements Controller {
	private OrderService orderService = new OrderServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	/**
	 * 주문하기
	 */
	public ModelAndView orderInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전송된 데이터 받기				
		String userId = request.getParameter("userId");
		String orderAddr = request.getParameter("orderAddr");
		int orderType = Integer.parseInt(request.getParameter("orderType"));
		int orderUsedPoint = Integer.parseInt(request.getParameter("orderUsedPoint"));
		int orderTotalPrice = Integer.parseInt(request.getParameter("orderTotalPrice"));		
		int orderPay = Integer.parseInt(request.getParameter("orderPay"));		
		
		OrderDTO order = new OrderDTO(0, userId, null, orderAddr, 0, orderType, orderUsedPoint, orderTotalPrice, orderPay);
		
		if(userId != null) { 
			orderService.orderInsert(order);
			return new ModelAndView("orderList.jsp", true);
		} else {
			return new ModelAndView("error", true);
		}		
	}
	
	
	
	/**
	 * 주문 취소
	 * */
	public ModelAndView orderCancel(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		//전송된 데이터 받기		
		String userId = request.getParameter("userId");
		int OrderCode = Integer.parseInt(request.getParameter("orderCode"));

		OrderDTO order = new OrderDTO(OrderCode, userId, null, null, 0, 0, 0, 0, 0);
		
		if(userId != null) { 
			orderService.orderCancel(order);
			return new ModelAndView("index", true);
		} else {
			return new ModelAndView("error", true);
		}
	}	
	
	
	
	/**
	 * 주문 내역 보기
	 * */
	public ModelAndView selectOrderByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전송된 데이터 받기
		String userId = request.getParameter("userId");
		
		if(userId != null) { 
			List<OrderDTO> orderList = orderService.selectOrderByUserId(userId); 
			request.setAttribute("orderList", orderList);
			
			return new ModelAndView("orderList.jsp");
		} else {
			return new ModelAndView("error", true);
		}
	}
	
	
	
	/**
	 * 주문 내역 상세 보기
	 * */
	public ModelAndView selectOrderLineByOrderCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		
		if(orderCode != 0) { 
			List<OrderLineDTO> orderLineList = orderService.selectOrderLineByOrderCode(orderCode); 
			request.setAttribute("orderLineList", orderLineList);
			
			return new ModelAndView("orderLineList.jsp");
		} else {
			return new ModelAndView("error");
		}
	}
}
