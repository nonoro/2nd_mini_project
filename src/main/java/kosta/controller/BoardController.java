package kosta.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kosta.dto.BoardDTO;
import kosta.dto.ReviewDTO;
import kosta.service.BoardService;
import kosta.service.BoardServiceImpl;

public class BoardController implements Controller{
	BoardService boardService = new BoardServiceImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public ModelAndView categoryList(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String categoryCode = request.getParameter("categoryCode");
		
		List<BoardDTO> list = boardService.categoryList(Integer.parseInt(categoryCode));
		
		request.setAttribute("categoryList", list);
		
		return new ModelAndView("testForKyu.jsp");
	}
	
	public ModelAndView insertBoard(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//폼에서 enctype="multipart/form-data" 설정되어 있기 때문에 request가 아닌 MultipartRequest로
				String saveDir=request.getServletContext().getRealPath("/save"); //C:/Edu
				int maxSize=1024*1024*100;//100Mb
				String encoding="UTF-8";

				MultipartRequest m = 
						new MultipartRequest(request,saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
				
				//전송된 데이터 받기
				String boardCode = m.getParameter("boardCode");
				String categoryCode = m.getParameter("categoryCode");
				String userId = m.getParameter("userId");
				String boardTitle = m.getParameter("boardTitle");
				String boardContent = m.getParameter("boardContent");
				String boardNick = m.getParameter("boardNick");
				String boardFile = m.getParameter("boardFile");
				
				BoardDTO board = new BoardDTO
						(0, Integer.parseInt(categoryCode), userId, boardTitle, boardContent, boardNick, null , null);
				
				//만약, 파일첨부가 되었다면....
				if(m.getFilesystemName("file") != null) {
					//파일이름저장
					board.setBoardFile(m.getFilesystemName("file"));
				}
				boardService.insertBoard(board);
				
				
				return new ModelAndView("testForKyu.jsp",true);
	}
	
	public ModelAndView updateBoard(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String saveDir=request.getServletContext().getRealPath("/save"); //C:/Edu
		int maxSize=1024*1024*100;//100Mb
		String encoding="UTF-8";

		MultipartRequest m = 
				new MultipartRequest(request,saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String boardCode = m.getParameter("boardCode");
		String userId = m.getParameter("userId");
		String boardTitle = m.getParameter("boardTitle");
		String boardContent = m.getParameter("boardContent");
		
		BoardDTO board = new BoardDTO
				(Integer.parseInt(boardCode), 0, userId, boardTitle, boardContent, null, null, null);
		
		//만약, 파일첨부가 되었다면....
		if(m.getFilesystemName("file") != null) {
			//파일이름저장
			board.setBoardFile(m.getFilesystemName("file"));
		}
		boardService.updateBoard(board);
		
		
		return new ModelAndView("jongmintest.jsp", true);
	}
	
	public ModelAndView deleteBoard(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String boardCode = request.getParameter("boardCode");
		String userId = request.getParameter("userId");
		String saveDir = request.getServletContext().getRealPath("/save");
		
		BoardDTO board = new BoardDTO
				(Integer.parseInt(boardCode), 0, userId, null, null, null, null, null);
		
		boardService.deleteBoard(board, saveDir);
		
		
		return new ModelAndView("jongmintest.jsp",true);
	}
	
}
