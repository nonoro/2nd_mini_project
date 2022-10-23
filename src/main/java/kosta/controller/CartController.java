package kosta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.ProductDTO;

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
	 * */
	public ModelAndView putCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		ProductDTO product = productService.productSelectByCode(productCode);
		
		String userId = session.getAttribute("userId");
		if(userId == null) {
			return new ModelAndView("error", true);
		}
		
		//String productCode = session.getAttribute("productCode");
		int qty = session.getAttribute("qty");
		if(product.getProductQty() < qty) {
			// throw new SQLException("재고량 부족으로 장바구니에 담을 수 없습니다.");
			return new ModelAndView("error", true);
		}
			
		Map<ProductDTO, Integer> cart = (Map<ProductDTO, Integer>)session.getAttribute("cart");
			
		if(cart == null) {
			cart = new HashMap<>();
			session.setAttribute("cart", cart);
		}
			
		Integer oldQty = cart.get(product);
		if(oldQty != null) {
			qty += oldQty;
		}
			
		cart.put(product, qty);
		
		return new ModelAndView("cart");
	}
	
	/**
	 * 장바구니에 저장된 상품 조회   (String userId)
	 * */
	public ModelAndView viewCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		String userId = session.getAttribute("userId");
		
		Map<ProductDTO, Integer> cart = (Map<Goods, Integer>)session.getAttribute("cart");
		session.setAttribute("cart", cart);
		
		if(cart = null) {
			return new ModelAndView("error", true);
		} else {
			return new ModelAndView("cart");
		}
	}
	
	
	
	/**
	 * 장바구니에 저장된 상품 삭제
	 * */
	public ModelAndView deleteCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		//전체 삭제
		session.getAttribute("cart");
		session.removeAttribute("cart"); 
		
		//해당 상품 삭제???
		session.removeAttribute("productCode");
		
		return new ModelAndView("cart", true);
		
	}
	
	
	
	/**
	 * 장바구니에 저장된 상품 수량 수정
	 * */
	public ModelAndView updateCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	
}
