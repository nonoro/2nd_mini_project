package kosta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.OrderDTO;
import kosta.dto.OrderLineDTO;
import kosta.dto.PointDTO;
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
		System.out.println("오니...?");
		String pcodeArr [] = request.getParameterValues("productCode");
		String pqty [] = request.getParameterValues("productQty");
		
		OrderDTO orderDTO = new OrderDTO();
		for(int i=0; i < pcodeArr.length; i++) {
			String code = pcodeArr[i];
			String qty = pqty[i];
			System.out.println(code +" | " + qty);
			
			//orderDTO.getOrderLineList().add(/new OrderLineDTO());
			
		}
		
		
		
		
		//전송된 데이터 받기	
		/*HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		String userId = request.getParameter("userId");
		String orderAddr = request.getParameter("orderAddr");
		String orderType = request.getParameter("orderType");
		String orderUsedPoint = request.getParameter("orderUsedPoint");
		//String orderTotalPrice = request.getParameter("orderTotalPrice");		
		//String orderPay = request.getParameter("orderPay");		
		
		OrderDTO order = new OrderDTO(7, userId, null, orderAddr, 0, Integer.parseInt(orderType), Integer.parseInt(orderUsedPoint), 500, 480);
		String savedate = null;
		String useddate = null;
		
		if(orderUsedPoint != null) {
			useddate = new Date().toString();
		}
		if(orderPay != null	) {
			savedate = new Date().toString();
		}
		PointDTO pointDTO= new PointDTO(order.getOrderCode(), userId, 0, savedate, useddate);
		
		
		
		if(userId != null) { 			
			
			orderService.orderInsert(order);			
			orderService.savePoint(pointDTO, 480);
			orderService.saveUserPoint(userId, 480);
			return new ModelAndView("testForKyu.jsp", true);
		} else {
			return new ModelAndView("error", true);
		}	*/
		
		return null;
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
