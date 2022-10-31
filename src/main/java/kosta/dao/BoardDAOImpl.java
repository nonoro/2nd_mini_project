package kosta.dao;

import kosta.dto.BoardDTO;
import kosta.dto.ReplyDTO;
import kosta.paging.PageCnt;
import kosta.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAOImpl implements BoardDAO {
    ReplyDAO replyDAO = new ReplyDAOImpl();


    @Override
    public List<BoardDTO> categoryList(int categoryCode, int pageNo) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        BoardDTO board = null;
        List<BoardDTO> boards = new ArrayList<>();


//        String sql = "SELECT * FROM tboard WHERE BOARD_CATEGORY=?";
        String sql = "select * from  (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM tboard WHERE BOARD_CATEGORY=? ORDER BY BOARD_DATE desc) a) where  rnum>=? and rnum <=?";
//       select * from  (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM tboard WHERE BOARD_CATEGORY=? ORDER BY BOARD_DATE desc) a) where  rnum>=? and rnum <=?
        try {
            con = DbUtil.getConnection();
            con.setAutoCommit(false);

            // 전체레코드수를 구한다
            int totalCount = this.getTotalCount(con, categoryCode);
            // 총 페이지수를 구한다 ( 전체 레코드수를 페이지 사이즈로 나눠서 나머지 0 이면 그 나눴을때 몫을 0이 아니면 나눴을때 몫에 + 1 )
            int totalPage = totalCount % PageCnt.pagesize == 0 ? totalCount / PageCnt.pagesize : totalCount / PageCnt.pagesize + 1;

            PageCnt pageCnt = new PageCnt();
            pageCnt.setPageCnt(totalPage);
            pageCnt.setPageNo(pageNo);

            ps = con.prepareStatement(sql);
            // 2개의 ?? 설정 pageNo는 인수로 들어왓고 pagesize는 pageCnt에 static 멤버로 선언되어있음
            ps.setInt(1, categoryCode);
            ps.setInt(2, (pageNo - 1) * pageCnt.pagesize + 1); // 시작
            ps.setInt(3, pageNo * pageCnt.pagesize); // 끝

            rs = ps.executeQuery();
            while (rs.next()) {
                board = new BoardDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9));
                boards.add(board);
            }
            con.commit();
        } finally {
            DbUtil.dbClose(con, ps, rs);
        }

        return boards;
    }

    private int getTotalCount(Connection con, int categoryCode) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        // select count() from Electronics
        String sql = "select count(*) from tboard where BOARD_CATEGORY=?";
        int result = 0;
        List<BoardDTO> board = new ArrayList<>();

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, categoryCode);
            rs = ps.executeQuery();

            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 커넥션 유지해야되서 인수로 받아왔기 때문에 이때 커넥션은 닫으면 안됨
            DbUtil.dbClose(null, ps, rs);
        }
        return result;
    }

    @Override
    public int insertBoard(BoardDTO board) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;
        String sql = "";
        if (board.getCategoryCode() == 1) {
            sql = "INSERT INTO tBOARD VALUES(tboard_seq.nextval, advertise_seq.nextval,?,?,?,?,?,SYSDATE,0)";
        } else if (board.getCategoryCode() == 2) {
            sql = "INSERT INTO tBOARD VALUES(tboard_seq.nextval, disease_seq.nextval,?,?,?,?,?,SYSDATE,0)";
        } else if (board.getCategoryCode() == 3) {
            sql = "INSERT INTO tBOARD VALUES(tboard_seq.nextval, free_seq.nextval,?,?,?,?,?,SYSDATE,0)";
        }
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setInt(1, board.getCategoryCode());
            ps.setString(2, board.getUserId());
            ps.setString(3, board.getBoardTitle());
            ps.setString(4, board.getBoardContent());
            ps.setString(5, board.getBoardNick());
//            ps.setString(7, board.getBoardFile());

            result = ps.executeUpdate();

        } finally {
            DbUtil.dbClose(con, ps);
        }
        return result;
    }

    @Override
    public int updateBoard(BoardDTO board) throws SQLException {
        int result = 0;
        Connection con = null;
        PreparedStatement ps = null;

//        String sql = "UPDATE tBOARD SET BOARD_TITLE=?, BOARD_CONTENT=?, BOARD_FILE=? WHERE BOARD_CODE=? AND USER_ID=?";
        String sql = "UPDATE tBOARD SET BOARD_TITLE=?, BOARD_CONTENT=? WHERE BOARD_CODE=? AND USER_ID=?";
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, board.getBoardTitle());
            ps.setString(2, board.getBoardContent());
            ps.setInt(3, board.getBoardCode());
            ps.setString(4, board.getUserId());

            result = ps.executeUpdate();

        } finally {
            DbUtil.dbClose(con, ps);
        }


        return result;
    }

    @Override
    public int deleteBoard(BoardDTO board) throws SQLException {
        int result = 0;
        Connection con = null;
        PreparedStatement ps = null;

        String sql = "DELETE FROM tboard WHERE BOARD_CODE=? AND USER_ID=?";
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setInt(1, board.getBoardCode());
            ps.setString(2, board.getUserId());

            replyDAO.deleteReply(con, board);

            result = ps.executeUpdate();

        } finally {
            DbUtil.dbClose(con, ps);
        }


        return result;
    }

    @Override
    public BoardDTO selectByCode(int boardCode, int categoryCode) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        BoardDTO board = null;
        List<ReplyDTO> replies = null;

        System.out.println("boardCode = " + boardCode);
        System.out.println("categoryCode = " + categoryCode);

        String sql = "select * from tboard where board_code = ? and BOARD_CATEGORY = ?";
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, boardCode);
            ps.setInt(2, categoryCode);

            rs = ps.executeQuery();
            if (rs.next()) {
                board = new BoardDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9));
                replies = replyDAO.replyList(boardCode, categoryCode);
                board.setReplies(replies);
            }

        } finally {
            DbUtil.dbClose(con, ps, rs);
        }


        return board;
    }

    @Override
    public int incrementByViews(int boardCode, int categoryCode) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;
        String sql = "update tboard set board_views=board_views+1 where BOARD_CODE=? and BOARD_CATEGORY=?";
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, boardCode);
            ps.setInt(2, categoryCode);
            result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.dbClose(con, ps);
        }
        return result;
    }

}
