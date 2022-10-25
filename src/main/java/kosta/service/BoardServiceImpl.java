package kosta.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import kosta.dao.BoardDAO;
import kosta.dao.BoardDAOImpl;
import kosta.dto.BoardDTO;

public class BoardServiceImpl implements BoardService {
	BoardDAO boardDAO = new BoardDAOImpl();
	
	@Override
	public List<BoardDTO> categoryList(int category) throws SQLException {
		List<BoardDTO> list = boardDAO.categoryList(category);
		if(list.size()==0 || list.isEmpty()) throw new SQLException("출력할 게시물이 없습니다.");
		
		return list;
	}

	@Override
	public void insertBoard(BoardDTO board) throws SQLException {
		int result = boardDAO.insertBoard(board);
		if(result == 0) throw new SQLException("게시물을 등록하지 못했습니다.");
		
	}

	@Override
	public void updateBoard(BoardDTO board) throws SQLException {
		int result = boardDAO.updateBoard(board);
		if(result == 0) throw new SQLException("게시물을 수정하지 못했습니다.");
		
	}

	@Override
	public void deleteBoard(BoardDTO board, String saveDir) throws SQLException {
		BoardDTO boardDTO = boardDAO.selectByCode(board.getBoardCode());
		if(boardDTO == null) {
			throw new SQLException("코드번호 오류로 삭제 불가!");
		}
		if(boardDAO.deleteBoard(boardDTO) == 0 ) {
			throw new SQLException("삭제되지 않았습니다.");		
		}
		
		//삭제가 되었을때 첨부파일이 있는 경우는 save 폴더에서 파일도 삭제한다.
		if(boardDTO.getBoardFile()!=null) {
			String fileName = saveDir+"/"+boardDTO.getBoardFile();
			new File(fileName).delete();
		}
	}

}
