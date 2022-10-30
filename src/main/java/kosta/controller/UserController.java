package kosta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kosta.dto.OrderDTO;
import kosta.dto.PointDTO;
import kosta.dto.ReviewDTO;
import kosta.dto.UserDTO;
import kosta.controller.ModelAndView;
import kosta.service.UserService;
import kosta.service.UserServiceImpl;

public class UserController implements Controller {
	private static final Map<String, ModelAndView> MAP = new HashMap<>();

    static {
        MAP.put("2022", new ModelAndView("Adimin_sale_2022.jsp"));
        MAP.put("2021", new ModelAndView("Adimin_sale_2021.jsp"));
        MAP.put("2020", new ModelAndView("Adimin_sale_2020.jsp"));
    }
	private UserService userService = new UserServiceImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	/////////////////////////////////////////////////////////////////////////////////////
	
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		//전송된 데이터 받기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userEmail = request.getParameter("userEmail");
		String userAddr = request.getParameter("userAddr");
		String userPhone = request.getParameter("userPhone");
		String dogName = request.getParameter("dogName");
		String dogBirthday = request.getParameter("dogBirthday");
		
		UserDTO user = new UserDTO(userId, userPwd, userEmail, userAddr, userPhone, null, dogName, dogBirthday, 0);
		
		userService.join(user);
		
		
		return new ModelAndView("jongmintest.jsp",true);
	}
	
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//두개의 전송되는 값을 받는다.
		String id = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String message = "ㅅㅊ";
		//서비스 호출
		UserDTO user = userService.login(new UserDTO(id, pwd));
		String loginId = user.getUserId();
		PointDTO pointCheck = userService.birthdayCheck(loginId);
	
		if(pointCheck == null) {
			message = userService.birthdayPoint(user);
			userService.insertBirthday(loginId);
		}
		
		//로그인 성공하면 세션에 정보를 저장  - ${loginUser} / ${loginName}
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", user.getUserId());
		session.setAttribute("loginDogName", user.getDogName());
		session.setAttribute("loginPwd", user.getUserPwd());
		session.setAttribute("loginPoint", user.getUserPoint());
		session.setAttribute("loginDogBirthday", user.getDogBirthday());
		
		ModelAndView mv = new ModelAndView("index.jsp" , true);
		
		System.out.println("message ="+ message);
		request.setAttribute("message", message);
			
		mv.setRedirect(false);
		
		return mv;
	}
	
	public ModelAndView updatePwd(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		
		UserDTO user = new UserDTO(userId, userPwd);
		
		userService.updatePwd(newPwd, user);
		
		
		return new ModelAndView("jongmintest.jsp", true);
	}
	
	public ModelAndView updateAddr(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newAddr = request.getParameter("newAddr");
		
		UserDTO user = new UserDTO(userId, userPwd);
		
		userService.updatePwd(newAddr, user);
		
		
		return new ModelAndView("jongmintest.jsp", true);
	}
	
	public ModelAndView updateEmail(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newEmail = request.getParameter("newEmail");
		
		UserDTO user = new UserDTO(userId, userPwd);
		
		userService.updatePwd(newEmail, user);
		
		
		return new ModelAndView("jongmintest.jsp", true);
	}
	
	public ModelAndView updatePhone(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newPhone = request.getParameter("newPhone");
		
		UserDTO user = new UserDTO(userId, userPwd);
		
		userService.updatePwd(newPhone, user);
		
		
		return new ModelAndView("jongmintest.jsp", true);
	}
	
	public ModelAndView updateDogName(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newDogName = request.getParameter("newDogName");
		
		UserDTO user = new UserDTO(userId, userPwd);
		
		userService.updatePwd(newDogName, user);
		
		
		return new ModelAndView("jongmintest.jsp", true);
	}
	
	public ModelAndView updateDogBirthday(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newDogBirthday = request.getParameter("newDogBirthday");
		
		UserDTO user = new UserDTO(userId, userPwd);
		
		userService.updatePwd(newDogBirthday, user);
		
		
		return new ModelAndView("jongmintest.jsp", true);
	}
	
	public ModelAndView selectPoint(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loginUser");
		
		UserDTO user = userService.selectPoint(userId); 
		
		request.setAttribute("userPonint", user.getUserPoint());
		
		return new ModelAndView("jongmintest.jsp");
	}
	
	public ModelAndView searchId(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");
		
		UserDTO user = new UserDTO();
		user.setUserPhone(userPhone);
		user.setUserEmail(userEmail);
		
		String searchId = userService.searchId(user);
		request.setAttribute("searchId", searchId);
		
		
		return new ModelAndView("jongmintest.jsp");
	}
	
	public ModelAndView searchPwd(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");
		
		UserDTO user = new UserDTO();
		user.setUserId(userId);
		user.setUserPhone(userPhone);
		user.setUserEmail(userEmail);
		
		String searchPwd = userService.searchPwd(user);
		request.setAttribute("searchPwd", searchPwd);
		
		
		return new ModelAndView("jongmintest.jsp");
	}
	
	/**
	 * 로그아웃
	 */
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		//모든세션의 정보를 삭제
		request.getSession().invalidate();
		
		return new ModelAndView("index.jsp", true);
	}


	/////////////////////////////////////////////////////////////////////////////////////
	/*
	 * MANAGEMENT
	 */
	/**
	 * 가입 회원수조회(-1은 관리자 아이디 제외)
	 * SELECT COUNT(USER_ID)-1 FROM T_USER;
	 */
	public ModelAndView userCount(HttpServletRequest request, HttpServletResponse response)
	         throws Exception {
	      int userCount = userService.userCount();
	      List<UserDTO> userList = userService.selectAll();
	      
	      request.setAttribute("userCount", userCount);
	      request.setAttribute("userList", userList);
	      
	      
	      return new ModelAndView("Admin_userCount.jsp");
	   }
	
	/**
	 * 매출액조회(당월 매출)
	 * SELECT SUM(ORDER_TOTALPRICE) FROM T_ORDER WHERE ORDER_DATE LIKE '?/?/%';
	 
	public ModelAndView monthSalse(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		
		int monthSalse = userService.monthSalse(Integer.parseInt(year), Integer.parseInt(month));
		
		request.setAttribute("monthSalse", monthSalse);
		
		
		return new ModelAndView("jongmintest.jsp");
	}
	*/
	
	/**
	 * 매출액조회(당해 매출)
	 * SELECT SUM(ORDER_TOTALPRICE) FROM T_ORDER WHERE ORDER_DATE LIKE '?/%';
	 */
	public ModelAndView yearSalse(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String year = request.getParameter("year");

        List<OrderDTO> yearSalse = userService.yearSalse(Integer.parseInt(year));
        System.out.println(yearSalse);
        request.setAttribute("yearSalse", yearSalse);


        return MAP.get(year);
    }
	
	
	/**
	 * 매출액조회(전체 매출)
	 *	SELECT SUM(ORDER_TOTALPRICE) FROM T_ORDER;	
	 */
	public ModelAndView allSalse(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		int allSalse = userService.allSalse();
		
		request.setAttribute("allSalse", allSalse);
		
		
		return new ModelAndView("jongmintest.jsp");
	}
	
	
	/**
	 * 상태가 준비중인 상품 리스트업
	 * SELECT * FROM T_ORDER WHERE ORDER_COMPLETE = 0;
	 */
	public ModelAndView readyProduct(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<OrderDTO> list = userService.readyProduct();
		
		request.setAttribute("readyProductList", list);
		
		return new ModelAndView("jongmintest.jsp");
	}
	
	
	/**
	 * 상태가 준비중인 상품의 ORDER_COMPLETE를 배송중으로 변경
	 * UPDATE T_ORDRE SET ORDRE_COMPLETE=1 WHERE ORDER_CODE=?
	 */
	public ModelAndView updateReady(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String orderCode = request.getParameter("orderCode");
		
		userService.updateReady(Integer.parseInt(orderCode));
		
		return new ModelAndView("jongmintest.jsp",true);
	}
	
	
	

}
