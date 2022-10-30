package kosta.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.dao.ProductDAO;
import kosta.dao.ProductDAOImpl;
import kosta.dto.OrderDTO;
import kosta.dto.OrderLineDTO;
import kosta.dto.PointDTO;
import kosta.dto.ProductDTO;
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
		String pcodeArr [] = request.getParameterValues("productCode");
		String pqty [] = request.getParameterValues("productQty");
		String pname [] = request.getParameterValues("productName");
		String orderlinePrice [] = request.getParameterValues("orderlinePrice");
		String orderTotalPriceArr [] = request.getParameterValues("orderTotalPrice"); //단가 * 수량
		
		//전송된 데이터 받기
		String userId = request.getParameter("userId");
		String orderAddr = request.getParameter("orderAddr");
		String orderType = request.getParameter("orderType");
		String orderUsedPoint = request.getParameter("orderUsedPoint");
		
		//주문을 하려는 상품들의 단가 * 수량을 한 금액의 누적총 결재
		int totalPay=0;
		for(String totalPrice : orderTotalPriceArr) {
			totalPay += Integer.parseInt(totalPrice);
		}
		
		 //총결재해야할 금액 - 포인트 뺀금액
		int realPayAmonut = totalPay;
		
		if(orderUsedPoint!=null && !orderUsedPoint.equals("")) {
		   realPayAmonut = totalPay - Integer.parseInt(orderUsedPoint);
	     }else {
	    	 orderUsedPoint="0";
	     }
		
		OrderDTO order = new OrderDTO(0, userId, null, orderAddr, 0, Integer.parseInt(orderType), 
				Integer.parseInt(orderUsedPoint), totalPay, realPayAmonut);

		String code = null;
		String qty = null;
		String name = null;
		
		for(int i=0; i < pcodeArr.length; i++) {
			code = pcodeArr[i];
			qty = pqty[i];
			name = pname[i];

			order.getOrderLineList().add(new OrderLineDTO(0, 0, userId, Integer.parseInt(code), Integer.parseInt(orderlinePrice[i]), Integer.parseInt(qty), 
					Integer.parseInt(orderTotalPriceArr[i]), name));	
		}
		
		//PointDTO pointDTO= new PointDTO(0, order.getOrderCode(), userId, 0, null, null);	
			
		orderService.orderInsert(order);	
			
		return new ModelAndView("testLogin.jsp", true);
	}
	
	/**
	 * 주문 취소
	 * */
	public ModelAndView orderCancel(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		//전송된 데이터 받기		
		String userId = request.getParameter("userId");
		int orderCode = Integer.parseInt(request.getParameter("orderCode"));        
        
		OrderDTO order = new OrderDTO(orderCode, userId, null, null, 0, 0, 0, 0, 0);
		
		if(userId != null) { 
			orderService.orderCancel(order);
			
			return new ModelAndView("orderList.jsp", true);
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
			
			return new ModelAndView("mypagepart/myPageOrder.jsp");
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
			
			List<ProductDTO> products = new ArrayList<ProductDTO>();
			
			ProductDAO productDao = new ProductDAOImpl();
			
			for(OrderLineDTO orderLine: orderLineList) {
				ProductDTO product = productDao.selectByProductCode(orderLine.getProductCode());
				products.add(product);
			}
			
			request.setAttribute("productList", products);

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
