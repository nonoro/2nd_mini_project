package kosta.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.dto.ReplyDTO;
import kosta.service.ReplyService;
import kosta.service.ReplyServiceImpl;

public class ReplyController implements Controller {
	ReplyService replyService = new ReplyServiceImpl();
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 댓글리스트
	 * */
	public ModelAndView replyList(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		String boardCode=request.getParameter("boardCode");
		
		List<ReplyDTO> replyList=replyService.replyList(Integer.parseInt(boardCode));
		
		request.setAttribute("replyList", replyList);
		return new ModelAndView("testForKyu.jsp");
	}
	
	/**
	 * 댓글작성
	 * */
	public ModelAndView inserReply(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		//글번호 , 카테고리코드 , 아이디, 내용
		String boardCode=request.getParameter("boardCode");
		String categoryCode=request.getParameter("categoryCode");
		String userId=request.getParameter("userId");
		String replyContent=request.getParameter("replyContent");
		
		ReplyDTO reply= new  ReplyDTO(1, Integer.parseInt(boardCode),Integer.parseInt(categoryCode),userId, replyContent, null );				
		request.setAttribute("reply", reply);
		return new ModelAndView("testForKyu.jsp",true);
	}
	
	/**
	 * 댓글수정
	 * */
	public ModelAndView updateReply(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		//글번호 , 카테고리코드 , 아이디, 내용
		String replyContent=request.getParameter("replyContent");
		
		ReplyDTO updateReply= new  ReplyDTO(0,0,0,null, replyContent, null );				
		request.setAttribute("updateReply", updateReply);
		return new ModelAndView("testForKyu.jsp",true);
	}
}
