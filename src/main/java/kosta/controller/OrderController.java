package kosta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		//String userId = request.getParameter("userId");
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

		
		return new ModelAndView("orderList");
	}
}
