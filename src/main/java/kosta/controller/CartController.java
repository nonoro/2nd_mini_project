package kosta.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dao.ProductDAO;
import kosta.dao.ProductDAOImpl;
import kosta.dto.ProductDTO;
import kosta.service.ProductService;
import kosta.service.ProductServiceImpl;

public class CartController implements Controller {
	private ProductService productService = new ProductServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 장바구니에 추가   (String userId, int productCode, int qty)
	 * @throws SQLException 
	 * */
	public ModelAndView putCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		//1)
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		if(userId == null) {
			return new ModelAndView("error", true);
		} else {
			
			String key = request.getParameter("productCode");
			String productName = request.getParameter("productName");
			String productPrice = request.getParameter("productPrice");
			//String qty = request.getParameter("qty");

			int productCode = (int)session.getAttribute("productCode");
			ProductDTO product = productService.selectByProductCode(productCode);
			
			int qty = (int)session.getAttribute("qty");
			if(product.getProductQty() < qty) {
				// throw new SQLException("재고량 부족으로 장바구니에 담을 수 없습니다.");
				return new ModelAndView("error", true);
			}
				
			Map< ProductDTO, Integer> cart = (Map<  ProductDTO, Integer>)session.getAttribute("cart");
				
			if(cart == null) {
				cart = new HashMap<>();
				session.setAttribute("cart", cart);
			}
				
			Integer oldQty = cart.get(product);
			if(oldQty != null) {
				qty += oldQty;
			}
				
			cart.put(product, qty);
			
			return new ModelAndView("cartList.jsp"); 
		}
		
		//2)
		/* Object obj = (Object)session.getAttribute("cart");
		
		if(userId == null) {
			return new ModelAndView("error", true);
		} else {
			if(obj == null) {
				ArrayList<Integer> cart = new ArrayList<Integer>();
			
				session.setAttribute("cart", cart);
				obj = session.getAttribute("cart");
			}
			
			ArrayList<Integer> cart = (ArrayList<Integer>)obj;
			int productCode = Integer.parseInt(request.getParameter("productCode"));
			cart.add(productCode);
			
			return new ModelAndView("product");
		} */
	}
	
	/**
	 * 장바구니에 저장된 상품 조회   (String userId)
	 * */
	public ModelAndView viewCart(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	
		//1)
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		
		//Map<Integer, ProductDTO> cart = (Map<Integer, ProductDTO>)session.getAttribute("cart");
		
		
//		if(userId == null) {
//			return new ModelAndView("error", true);
//		} else {
				System.out.println("!!!!!!!!!!!!!");
				String productCode = request.getParameter("productCode");
				System.out.println(productCode);
				ProductDTO product = productService.selectByProductCode(Integer.parseInt(productCode));
				System.out.println("????????????????");
				
				
				List<ProductDTO> list = new ArrayList<ProductDTO>();
				list.add(product);
				
				session.setAttribute("selectList", list);
				
				return new ModelAndView("cartList.html");
			
//		} 
		
		//2)
		/* response.setContentType("text/html; charset='UTF-8'");
		
		ArrayList<String> cartList = (ArrayList<String>)session.getAttribute("cartList");
		PrintWriter out = response.getWriter();
		
		if(userId == null) {
			return new ModelAndView("error", true);
		} else {
			if(cartList == null) {
				return new ModelAndView("error", true);
			} else {
				for(String list: cartList) {
					out.println(list);
				}
				return new ModelAndView("cart");
			}
		} */
	}
	
	
	
	/**
	 * 장바구니에 저장된 상품 삭제
	 * @throws SQLException 
	 * */
	public ModelAndView deleteCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		int productCode = (int)session.getAttribute("productCode");
		
		if(session != null && userId != null) {
			//전체 삭제
			session.removeAttribute("cart"); 
			
			//해당 상품 삭제
			ProductDAO productDao = new ProductDAOImpl();
			ProductDTO product = productDao.selectByProductCode(productCode);
			
			/* if(product.getProductCode() == productCode) {
				session.removeAttribute("productCode");
			} */
			
			ArrayList<ProductDTO> cartList = (ArrayList<ProductDTO>)session.getAttribute("cartList");
			ProductDTO productQty = new ProductDTO();
			for(int i=0; i < cartList.size(); i++) {
				productQty = cartList.get(i);
				if(productQty.getProductCode() == productCode) {
					cartList.remove(productQty);
				}
			}
			
			return new ModelAndView("cart", true);
		} else {
			return new ModelAndView("error");
		}
	}
	
	
	
	/**
	 * 장바구니에 저장된 상품 수량 수정
	 * */
	public ModelAndView updateCart(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		return new ModelAndView("cart", true);
	}

}
