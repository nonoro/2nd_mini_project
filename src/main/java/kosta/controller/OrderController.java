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
	
	public ModelAndView orderInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전송된 데이터 받기
		
		OrderDTO order = new OrderDTO(0, null, null, null, 0, 0, 0, 0, 0);
		
		orderService.orderInsert(order);
		
		return new ModelAndView("order", true);
	}
	
	
	
	public ModelAndView orderCancel(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		//전송된 데이터 받기
		
		
		
		OrderDTO order = new OrderDTO(0, null, null, null, 0, 0, 0, 0, 0);
		
		orderService.orderCancel(order);
		
		
		return new ModelAndView("index", true);
	}	
	
	
	
	public ModelAndView selectOrderByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전송된 데이터 받기

		List<OrderDTO> orderList = orderService.selectOrderByUserId(null); 
		
		return new ModelAndView("order", true);
	}

}
