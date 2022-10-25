package kosta.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.dto.OrderDTO;
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
			return new ModelAndView("order", true);
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
			
			return new ModelAndView("orderList");
		} else {
			return new ModelAndView("error", true);
		}
	}
	
	
	public ModelAndView selectState(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String orderCode = request.getParameter("orderCode");
		
		OrderDTO order = orderService.selectState(Integer.parseInt(orderCode));
		
		int state = order.getOrderComplete();
		System.out.println("controller = " + state);
		
		if(state==0) {
			request.setAttribute("orderState", "준비중");
		}else if(state==1) {
			request.setAttribute("orderState", "배송중");
		}else if(state==2) {
			request.setAttribute("orderState", "배송완료");
		}else if(state==3) {
			request.setAttribute("orderState", "취소");
		}else {
			request.setAttribute("orderState", "배송상태를 조회할 수 없습니다.");
		}

		
		return new ModelAndView("jongmintest.jsp");
	}
	
	
	
	
	
}
