package kosta.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.dto.PointDTO;
import kosta.service.PointService;
import kosta.service.PointServiceImpl;

public class PointController implements Controller {
	private PointService pointService = new PointServiceImpl();
	

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView selectPointByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전송된 데이터 받기
		String userId = request.getParameter("userId");
		
		if(userId != null) { 
			List<PointDTO> pointList = pointService.selectPointByUserId(userId); 
			request.setAttribute("pointList", pointList);
			
			return new ModelAndView("mypagepart/pointOk.jsp");
		} else {
			return new ModelAndView("error", true);
		}
	}

}
