package kosta.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kosta.dto.ReviewDTO;
import kosta.dto.UserDTO;
import kosta.service.UserService;
import kosta.service.UserServiceImpl;

public class UserController implements Controller {
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
		String saveDir=request.getServletContext().getRealPath("/save"); //C:/Edu
		int maxSize=1024*1024*100;//100Mb
		String encoding="UTF-8";

		MultipartRequest m = 
				new MultipartRequest(request,saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		//전송된 데이터 받기
		String userId = m.getParameter("userId");
		String userPwd = m.getParameter("userPwd");
		String userEmail = m.getParameter("userEmail");
		String userAddr = m.getParameter("userAddr");
		String userPhone = m.getParameter("userPhone");
		String userProfile = m.getParameter("userProfile");
		String dogName = m.getParameter("dogName");
		String dogBirthday = m.getParameter("dogBirthday");
		
		UserDTO user = new UserDTO(userId, userPwd, userEmail, userAddr, userPhone, userProfile, dogName, dogBirthday, 0);
		
		//만약, 파일첨부가 되었다면....
		if(m.getFilesystemName("file") != null) {
			//파일이름저장
			user.setUserProfile(m.getFilesystemName("file"));
		}
		userService.join(user);
		
		
		return new ModelAndView("front",true);
	}
	
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//두개의 전송되는 값을 받는다.
		String id = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
	
		//서비스 호출
		UserDTO user = userService.login(new UserDTO(id, pwd));
		
		//로그인 성공하면 세션에 정보를 저장  - ${loginUser} / ${loginName}
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", user.getUserId());
		session.setAttribute("loginDogName", user.getDogName());
		
		
		//index.jsp 이동 - redirect방식
		ModelAndView mv = new ModelAndView("index.jsp", true);
		
		return mv;
	}
	
	public ModelAndView updatePwd(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		
		UserDTO user = new UserDTO(userId, userPwd);
		
		userService.updatePwd(newPwd, user);
		
		
		return new ModelAndView("front", true);
	}
	
	public ModelAndView updateAddr(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newAddr = request.getParameter("newAddr");
		
		UserDTO user = new UserDTO(userId, userPwd);
		
		userService.updatePwd(newAddr, user);
		
		
		return new ModelAndView("front", true);
	}
	
	public ModelAndView updateEmail(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newEmail = request.getParameter("newEmail");
		
		UserDTO user = new UserDTO(userId, userPwd);
		
		userService.updatePwd(newEmail, user);
		
		
		return new ModelAndView("front", true);
	}
	
	public ModelAndView updatePhone(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newPhone = request.getParameter("newPhone");
		
		UserDTO user = new UserDTO(userId, userPwd);
		
		userService.updatePwd(newPhone, user);
		
		
		return new ModelAndView("front", true);
	}
	
	public ModelAndView updateDogName(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newDogName = request.getParameter("newDogName");
		
		UserDTO user = new UserDTO(userId, userPwd);
		
		userService.updatePwd(newDogName, user);
		
		
		return new ModelAndView("front", true);
	}
	
	public ModelAndView updateDogBirthday(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newDogBirthday = request.getParameter("newDogBirthday");
		
		UserDTO user = new UserDTO(userId, userPwd);
		
		userService.updatePwd(newDogBirthday, user);
		
		
		return new ModelAndView("front", true);
	}
	
	public ModelAndView selectPoint(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loginUser");
		
		UserDTO user = userService.selectPoint(userId);
		
		request.setAttribute("userPonint", user.getUserPoint());
		
		return new ModelAndView("front");
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
		
		
		return new ModelAndView("front");
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
		
		
		return new ModelAndView("front");
	}

	
	

}
