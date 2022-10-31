package kosta.controller;

import kosta.dto.ReplyDTO;
import kosta.service.ReplyService;
import kosta.service.ReplyServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ReplyController implements Controller {
    ReplyService replyService = new ReplyServiceImpl();

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * 댓글리스트
     */
 /*   public ModelAndView replyList(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String boardCode = request.getParameter("boardCode");

        List<ReplyDTO> replyList = replyService.replyList(Integer.parseInt(boardCode));

        request.setAttribute("replyList", replyList);
        return new ModelAndView("testForKyu.jsp");
    }*/

    /**
     * 댓글작성
     */
    public ModelAndView insertReply(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();


        //글번호 , 카테고리코드 , 아이디, 내용
        String boardCode = request.getParameter("boardCode");
        String categoryCode = request.getParameter("categoryCode");
        String userId = (String) session.getAttribute("loginUser");
        String replyContent = request.getParameter("replyContent");
        String pageNo = request.getParameter("pageNo");

        System.out.println(boardCode);
        System.out.println(categoryCode);
        System.out.println(userId);
        System.out.println(replyContent);

        ReplyDTO reply = new ReplyDTO(0, Integer.parseInt(boardCode), Integer.parseInt(categoryCode), userId, replyContent, null);
        replyService.insertReply(reply);

        return new ModelAndView("front?key=board&methodName=selectByBoardCode&boardCode=" + boardCode, false);
    }

    /**
     * 댓글수정
     */
    public ModelAndView updateReply(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        //글번호 , 카테고리코드 , 아이디, 내용
        String replyContent = request.getParameter("replyContent");

        ReplyDTO updateReply = new ReplyDTO(0, 0, 0, null, replyContent, null);
        request.setAttribute("updateReply", updateReply);
        return new ModelAndView("testForKyu.jsp", true);
    }
}
