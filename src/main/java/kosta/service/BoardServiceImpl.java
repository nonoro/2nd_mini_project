package kosta.service;

import kosta.dao.BoardDAO;
import kosta.dao.BoardDAOImpl;
import kosta.dao.ReplyDAO;
import kosta.dao.ReplyDAOImpl;
import kosta.dto.BoardDTO;
import kosta.dto.ReplyDTO;
import kosta.exception.AuthenticationException;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

public class BoardServiceImpl implements BoardService {
    BoardDAO boardDAO = new BoardDAOImpl();

    @Override
    public List<BoardDTO> categoryList(int categoryCode, int pageNo) throws SQLException {
        List<BoardDTO> boards = boardDAO.categoryList(categoryCode, pageNo);
        if (boards.size() == 0 || boards.isEmpty()) {
//            throw new SQLException("출력할 게시물이 없습니다.");
            return null;
        }

        return boards;
    }

    @Override
    public void insertBoard(BoardDTO board) throws SQLException {
        System.out.println(2);
        int result = boardDAO.insertBoard(board);
        System.out.println(3);
        if (result == 0) throw new SQLException("게시물을 등록하지 못했습니다.");

    }

    @Override
    public void updateBoard(BoardDTO board) throws SQLException {
        int result = boardDAO.updateBoard(board);
        if (result == 0) throw new SQLException("게시물을 수정하지 못했습니다.");

    }

    @Override
    public void deleteBoard(BoardDTO board) throws Exception {
        BoardDTO boardDTO = boardDAO.selectByCode(board.getBoardCode(), board.getCategoryCode());
        if (boardDTO == null) {
            throw new SQLException("코드번호 오류로 삭제 불가!");
        }

        System.out.println(boardDTO.getBoardContent());
        System.out.println(boardDTO.getCategoryCode());
        System.out.println(boardDTO.getUserId());

        int result = boardDAO.deleteBoard(board);

        if (result == 0) {
            throw new SQLException("삭제되지 않았습니다.");
        }

        //삭제가 되었을때 첨부파일이 있는 경우는 save 폴더에서 파일도 삭제한다.
        if (boardDTO.getBoardFile() != null) {
            String fileName = board.getBoardFile() + "/" + boardDTO.getBoardFile();
            new File(fileName).delete();
        }
    }

    @Override
    public BoardDTO selectByBoardCode(int boardCode, boolean state, int categoryCode) throws SQLException {
        if (state) {
            if (boardDAO.incrementByViews(boardCode, categoryCode) == 0) {
                throw new SQLException("조회수 증가 오류로 검색할 수 없습니다.");
            }
        }

        BoardDTO boardDTO = boardDAO.selectByCode(boardCode, categoryCode);
        if (boardDTO == null) {
            throw new SQLException("상세보기에 오류가 발생하였습니다");
        }
        return boardDTO;
    }
}
