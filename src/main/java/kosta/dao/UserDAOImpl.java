package kosta.dao;

import kosta.dto.OrderDTO;
import kosta.dto.PointDTO;
import kosta.dto.UserDTO;
import kosta.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {

    @Override
    public int join(UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        System.out.println("아이디 : " + userDTO.getUserId());
        System.out.println("비밀번호 : " + userDTO.getUserPwd());
        System.out.println("이메일 : " + userDTO.getUserEmail());
        System.out.println("주소 : " + userDTO.getUserAddr());
        System.out.println("핸드폰번호 : " + userDTO.getUserPhone());
        System.out.println("프로필사진 : " + userDTO.getUserProfile());
        System.out.println("강아지이름 : " + userDTO.getDogName());
        System.out.println("강아지생일 : " + userDTO.getDogBirthday());


        String sql = "INSERT INTO USERS VALUES (?, ?, ?, ?, ?, ?, ?, ?, 5000)";
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, userDTO.getUserId());
            ps.setString(2, userDTO.getUserPwd());
            ps.setString(3, userDTO.getUserEmail());
            ps.setString(4, userDTO.getUserAddr());
            ps.setString(5, userDTO.getUserPhone());
            ps.setString(6, userDTO.getUserProfile());
            ps.setString(7, userDTO.getDogName());
            ps.setString(8, userDTO.getDogBirthday());

            result = ps.executeUpdate();

        } finally {
            DbUtil.dbClose(con, ps);
        }
        return result;
    }

    @Override
    public UserDTO login(UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserDTO user = null;

        String sql = "SELECT * FROM USERS WHERE USER_ID=? AND USER_PWD=?";
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, userDTO.getUserId());
            ps.setString(2, userDTO.getUserPwd());

            rs = ps.executeQuery();
            if (rs.next()) {
                user = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9));
            }


        } finally {
            DbUtil.dbClose(con, ps, rs);
        }

        return user;
    }


    @Override
    public int updatePwd(String newPwd, UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String sql = "UPDATE USERS SET USER_PWD =? WHERE USER_ID =? AND USER_PWD=?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, newPwd);
            ps.setString(2, userDTO.getUserId());
            ps.setString(3, userDTO.getUserPwd());

            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }


        return result;
    }

    @Override
    public int updateAddr(String newAddr, UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String sql = "UPDATE USERS SET USER_ADDR =? WHERE USER_ID =? AND USER_PWD=?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, newAddr);
            ps.setString(2, userDTO.getUserId());
            ps.setString(3, userDTO.getUserPwd());

            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }


        return result;
    }

    @Override
    public int updateEmail(String newEmail, UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String sql = "UPDATE USERS SET USER_EMAIL =? WHERE USER_ID =? AND USER_PWD=?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, newEmail);
            ps.setString(2, userDTO.getUserId());
            ps.setString(3, userDTO.getUserPwd());

            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }


        return result;
    }

    @Override
    public int updatePhone(String newPhone, UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String sql = "UPDATE USERS SET USER_PHONE =? WHERE USER_ID =? AND USER_PWD=?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, newPhone);
            ps.setString(2, userDTO.getUserId());
            ps.setString(3, userDTO.getUserPwd());

            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }


        return result;
    }

    @Override
    public int updateProfile(String newProfile, UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String sql = "UPDATE USERS SET USER_PROFILE =? WHERE USER_ID =? AND USER_PWD=?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, newProfile);
            ps.setString(2, userDTO.getUserId());
            ps.setString(3, userDTO.getUserPwd());

            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }


        return result;
    }

    @Override
    public int updateDogName(String newDogName, UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String sql = "UPDATE USERS SET USER_DOGNAME =? WHERE USER_ID =? AND USER_PWD=?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, newDogName);
            ps.setString(2, userDTO.getUserId());
            ps.setString(3, userDTO.getUserPwd());

            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }


        return result;
    }

    @Override
    public int updateDogBirthday(String newDogBirthday, UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String sql = "UPDATE USERS SET USER_DOGBIRTHDAY =? WHERE USER_ID =? AND USER_PWD=?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, newDogBirthday);
            ps.setString(2, userDTO.getUserId());
            ps.setString(3, userDTO.getUserPwd());

            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }


        return result;
    }

    @Override
    public UserDTO selectPoint(String userId) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserDTO user = null;

        String sql = "SELECT USER_POINT FROM USERS WHERE USER_ID=?";
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                user = new UserDTO(null, null, null, null, null, null, null, null, rs.getInt(1));
            }


        } finally {
            DbUtil.dbClose(con, ps, rs);
        }
        return user;
    }

    @Override
    public String searchId(UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String id = null;

        String sql = "SELECT USER_ID FROM USERS WHERE USER_PHONE=? AND USER_EMAIL=?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userDTO.getUserPhone());
            ps.setString(2, userDTO.getUserEmail());

            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getString(1);
            }

        } finally {
            DbUtil.dbClose(con, ps, rs);
        }
        return id;
    }

    @Override
    public String searchPwd(UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String pwd = null;

        String sql = "SELECT USER_PWD FROM USERS WHERE USER_ID=? AND USER_PHONE=? AND USER_EMAIL=?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userDTO.getUserId());
            ps.setString(2, userDTO.getUserPhone());
            ps.setString(3, userDTO.getUserEmail());

            rs = ps.executeQuery();
            if (rs.next()) {
                pwd = rs.getString(1);
            }

        } finally {
            DbUtil.dbClose(con, ps, rs);
        }
        return pwd;
    }

    @Override
    public int userCount() throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userCount = 0;

        String sql = "SELECT COUNT(USER_ID)-1 FROM USERS";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                userCount = rs.getInt(1);
            }

        } finally {
            DbUtil.dbClose(con, ps, rs);
        }
        return userCount;
    }

    @Override
    public int monthSalse(int year, int month) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int monthSalse = 0;

        String sql = "SELECT SUM(ORDER_TOTALPRICE) FROM ORDERS WHERE ORDER_DATE LIKE '?/?/%'";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            rs = ps.executeQuery();
            if (rs.next()) {
                monthSalse = rs.getInt(1);
            }

        } finally {
            DbUtil.dbClose(con, ps, rs);
        }
        return monthSalse;
    }

    @Override
    public List<OrderDTO> yearSalse(int year) throws SQLException {
         Connection con = null;
         PreparedStatement ps = null;
         ResultSet rs = null;
         List<OrderDTO> orderlist = new ArrayList<OrderDTO>();
         //int yearSalse = 0;

//       String sql = "SELECT SUM(ORDER_TOTALPRICE) FROM ORDERS WHERE ORDER_DATE LIKE '?/%'";
         String sql = "SELECT to_char(order_date,'yyyy-MM-dd'),SUM(ORDER_TOTALPRICE)\r\n"
         		+ "FROM ORDERS\r\n"
         		+ "group by order_date\r\n"
         		+ "order by order_date desc";

         try {
             con = DbUtil.getConnection();
             ps = con.prepareStatement(sql);
//           ps.setInt(1, year);  ?표시가 있을 때만
             rs=ps.executeQuery();
            while (rs.next()) {
               OrderDTO order = new OrderDTO(rs.getDate(1),rs.getInt(2));
               orderlist.add(order);
               }

         } finally {
             DbUtil.dbClose(con, ps, rs);
         }
         return orderlist;
     }

    @Override
    public int allSalse() throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int allSalse = 0;

        String sql = "SELECT SUM(ORDER_TOTALPRICE) FROM ORDERS";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                allSalse = rs.getInt(1);
            }

        } finally {
            DbUtil.dbClose(con, ps, rs);
        }
        return allSalse;
    }

	/*
	 * @Override public List<OrderDTO> readyProduct() throws SQLException {
	 * Connection con = null; PreparedStatement ps = null; ResultSet rs = null;
	 * List<OrderDTO> list = new ArrayList<OrderDTO>(); OrderDTO order = null;
	 * 
	 * String sql = "SELECT * FROM ORDERS WHERE ORDER_COMPLETE = 0";
	 * 
	 * try { con = DbUtil.getConnection(); ps = con.prepareStatement(sql); rs =
	 * ps.executeQuery(); while (rs.next()) { order = new OrderDTO(rs.getInt(1),
	 * rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
	 * rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9)); list.add(order); }
	 * 
	 * } finally { DbUtil.dbClose(con, ps, rs); } return list; }
	 */

    @Override
    public int updateReady(int orderCode) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String sql = "UPDATE ORDERS SET ORDER_COMPLETE=1 WHERE ORDER_CODE=?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setInt(1, orderCode);

            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }


        return result;
    }

    @Override
    public int birthdayPoint(UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

        String sql = "UPDATE USERS SET USER_POINT = USER_POINT+5000 \r\n"
                + "WHERE TO_CHAR(DOG_BIRTHDAY,'MM-DD')=\r\n"
                + "TO_CHAR(SYSDATE,'MM-DD') AND USER_ID = ?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, userDTO.getUserId());

            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }


        return result;
    }

    @Override
    public PointDTO birthdayCheck(String userId) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        PointDTO point = null;

        String sql = "SELECT * FROM POINT WHERE USER_ID = ? AND POINT_SAVE = 5000 AND POINT_SAVEDATE = TO_CHAR(SYSDATE,'YY-MM-DD')";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                point = new PointDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6));

            }

        } finally {
            DbUtil.dbClose(con, ps, rs);
        }
        return point;
    }

    @Override
    public int insertBirthday(UserDTO userDTO) throws SQLException {

        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;

//        String sql = "INSERT INTO POINT VALUES(POINT_CODE_SEQ.NEXTVAL, 0, ?, 5000, SYSDATE, NULL)";
        String sql = "INSERT INTO POINT VALUES(POINT_CODE_SEQ.NEXTVAL, 9999998,?, 5000, TO_CHAR(SYSDATE,'YY-MM-DD'), NULL)";
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, userDTO.getUserId());

            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }


        return result;
    }

    @Override
    public int update(UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;


        String sql = "UPDATE USERS SET USER_PWD =?, USER_EMAIL = ?, USER_ADDR = ?, USER_PHONE = ?, USER_PROFILE = ?, DOG_NAME = ?, DOG_BIRTHDAY = ?  WHERE USER_ID =?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, userDTO.getUserPwd());
            ps.setString(2, userDTO.getUserEmail());
            ps.setString(3, userDTO.getUserAddr());
            ps.setString(4, userDTO.getUserPhone());
            ps.setString(5, userDTO.getUserProfile());
            ps.setString(6, userDTO.getDogName());
            ps.setString(7, userDTO.getDogBirthday());
            ps.setString(8, userDTO.getUserId());


            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }
        return result;
    }

    @Override
    public int updateOfNoneProfile(UserDTO userDTO) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        int result = 0;


        String sql = "UPDATE USERS SET USER_PWD =?, USER_EMAIL = ?, USER_ADDR = ?, USER_PHONE = ?, DOG_NAME = ?, DOG_BIRTHDAY = ?  WHERE USER_ID =?";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, userDTO.getUserPwd());
            ps.setString(2, userDTO.getUserEmail());
            ps.setString(3, userDTO.getUserAddr());
            ps.setString(4, userDTO.getUserPhone());
            ps.setString(5, userDTO.getDogName());
            ps.setString(6, userDTO.getDogBirthday());
            ps.setString(7, userDTO.getUserId());


            result = ps.executeUpdate();
        } finally {
            DbUtil.dbClose(con, ps);
        }
        return result;
    }

    @Override
    public boolean idCheck(String id) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = null;
        boolean result = false;
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement("select USER_ID from users where USER_ID=?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtil.dbClose(con, ps, rs);
        }
        return result;
    }
    @Override
    public List<UserDTO> selectAll() throws SQLException {
       Connection con = null;
       PreparedStatement ps = null;
       ResultSet rs = null;
       List<UserDTO> list = new ArrayList<UserDTO>();
       UserDTO user = null;
       
       String sql = "SELECT * FROM USERS";
       
       try {
          con=DbUtil.getConnection();
          ps=con.prepareStatement(sql);
          rs=ps.executeQuery();
          while(rs.next()) {
             user = new  UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8),rs.getInt(9));
             list.add(user);
          }
          
       } finally {
          DbUtil.dbClose(con, ps, rs);
       }
       return list;
    }

}
