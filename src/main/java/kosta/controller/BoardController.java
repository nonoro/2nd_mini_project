package kosta.controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import kosta.dto.BoardDTO;
import kosta.service.BoardService;
import kosta.service.BoardServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardController implements Controller {
    private static final Map<String, ModelAndView> MAP = new HashMap<>();

    static {
        MAP.put("1", new ModelAndView("board/advertiseBoard.jsp"));
        MAP.put("2", new ModelAndView("board/diseaseBoard.jsp"));
        MAP.put("3", new ModelAndView("board/freeBoard.jsp"));

    }

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
        String pageNo = request.getParameter("pageNo");
        if (pageNo == null || pageNo.equals("")) {
            pageNo = "1";
        }

        System.out.println("categoryList의 카테고리 = " + categoryCode);

        List<BoardDTO> boards = boardService.categoryList(Integer.parseInt(categoryCode), Integer.parseInt(pageNo));

        request.setAttribute("boards", boards);
        request.setAttribute("pageNo", pageNo);
        // 게시판에 아무것도 없을 수도 있기 때문에 카테고리코드를 따로보내줌
        request.setAttribute("categoryCode", categoryCode);

        return MAP.get(categoryCode);

    }

    public ModelAndView selectByBoardCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String loginUser = (String) session.getAttribute("loginUser");

        int result = 0;
        String boardCode = request.getParameter("boardCode");
        String categoryCode = request.getParameter("categoryCode");
        // update문에서 올때 조회수 증가하지 않게 하기위한 제어 flag가 null이아니면 false로 조회수 안들어남
        boolean state = request.getParameter("flag") == null ? true : false;

        String pageNo = request.getParameter("pageNo");


        // 두번째 인수 boolean 조회수 증가여부를 판단할 인수 (true이면 증가, false이면 증가안함)
        // 무조건 true를 주면 안됨
        BoardDTO boardDTO = boardService.selectByBoardCode(Integer.parseInt(boardCode), state, Integer.parseInt(categoryCode));


        if (boardDTO.getUserId().equals(loginUser)) {
            result = 1;
        }

        request.setAttribute("board", boardDTO);
        request.setAttribute("pageNo", pageNo);
        request.setAttribute("result", result);


        return new ModelAndView("board/read.jsp", false);
    }


    public ModelAndView insertBoard(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //폼에서 enctype="multipart/form-data" 설정되어 있기 때문에 request가 아닌 MultipartRequest로
    	String saveDir = request.getServletContext().getRealPath("/save");
        int maxSize = 1024 * 1024 * 100;//100Mb
        String encoding = "UTF-8";


        HttpSession session = request.getSession();

        MultipartRequest m = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());

        //전송된 데이터 받기
//        String boardCode = m.getParameter("boardCode");
        String categoryCode = request.getParameter("categoryCode");
        String userId = (String) session.getAttribute("loginUser");
        String boardTitle = m.getParameter("boardTitle");
        String boardContent = m.getParameter("boardContent");
        String boardNick = (String) session.getAttribute("loginDogName");
        String reviewFile = m.getParameter("reviewFile");

        System.out.println("categoryCode = " + categoryCode);

        BoardDTO board = new BoardDTO(Integer.parseInt(categoryCode), userId, boardTitle, boardContent, boardNick, reviewFile);

        //만약, 파일첨부가 되었다면....
        if (m.getFilesystemName("reviewFile") != null) {
            //파일이름저장
            board.setBoardFile(m.getFilesystemName("reviewFile"));
        }
        System.out.println(1);
        boardService.insertBoard(board);


        return new ModelAndView("front?key=board&methodName=categoryList&categoryCode=" + categoryCode, true);
    }

    public ModelAndView updateForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        String boardCode = request.getParameter("boardCode");
        String categoryCode = request.getParameter("categoryCode");
        String pageNo = request.getParameter("pageNo");

        BoardDTO board = boardService.selectByBoardCode(Integer.parseInt(boardCode), false, Integer.parseInt(categoryCode));

        request.setAttribute("board", board);
        request.setAttribute("pageNo", pageNo);


        return new ModelAndView("board/update.jsp", false);
    }

    public ModelAndView updateBoard(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession session = request.getSession();
//		String saveDir=request.getServletContext().getRealPath("/save"); //C:/Edu
        String saveDir = "/Users/nonoro/Servlet/test_2nd/src/main/webapp/save";

/*
        int maxSize = 1024 * 1024 * 100;//100Mb
        String encoding = "UTF-8";

        MultipartRequest m =
                new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
        String boardCode = m.getParameter("boardCode");
        String userId = m.getParameter("userId");
        String boardTitle = m.getParameter("boardTitle");
        String boardContent = m.getParameter("boardContent");
*/
        String categoryCode = request.getParameter("categoryCode");
        String boardCode = request.getParameter("boardCode");
        String userId = (String) session.getAttribute("loginUser");
        String boardTitle = request.getParameter("boardTitle");
        String boardContent = request.getParameter("boardContent");
        String pageNo = request.getParameter("pageNo");

        BoardDTO board = new BoardDTO
                (Integer.parseInt(boardCode), 0, userId, boardTitle, boardContent, null, null, saveDir);

  /*      //만약, 파일첨부가 되었다면....
        if (m.getFilesystemName("file") != null) {
            //파일이름저장
            board.setBoardFile(m.getFilesystemName("file"));
        }*/
        boardService.updateBoard(board);


        return new ModelAndView("front?key=board&methodName=selectByBoardCode&boardCode=" + boardCode + "&flag=1&pageNo=" + pageNo + "&categoryCode=" + categoryCode, true);
    }

    public ModelAndView deleteBoard(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();

        String saveDir = "/Users/nonoro/Servlet/test_2nd/src/main/webapp/save";
        //		String saveDir = request.getServletContext().getRealPath("/save");
        String categoryCode = request.getParameter("categoryCode");
        String boardCode = request.getParameter("boardCode");
//        String inputPassword = request.getParameter("password");
        String userId = (String) session.getAttribute("loginUser");
//        String userPassword = (String) session.getAttribute("loginPwd");
 /*       int maxSize = 1024 * 1024 * 100;//100Mb
        String encoding = "UTF-8";*/

/*
        MultipartRequest mr =
                new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
        String categoryCode = mr.getParameter("categoryCode");
        String boardCode = mr.getParameter("boardCode");
        String inputPassword = mr.getParameter("password");
*/

        System.out.println(categoryCode);
        System.out.println(boardCode);
        System.out.println(userId);

        // saveDir은 원래 경로임 근데 나중에 폴더 추가 할 경우 저자리에 boardFile을 넣어야해서 임시로 저렇게 넣어놈
        BoardDTO board = new BoardDTO(Integer.parseInt(boardCode), Integer.parseInt(categoryCode) ,userId, saveDir);

        boardService.deleteBoard(board);


        return new ModelAndView("front?key=board&methodName=categoryList&categoryCode=" + categoryCode, true);
    }

}
