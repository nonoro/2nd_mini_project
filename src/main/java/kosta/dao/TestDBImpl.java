package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kosta.util.DbUtil;

public class TestDBImpl implements TestDB {

	@Override
	public int test() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		ResultSet rs= null;


		String sql= "select p_code from product where p_qty=3"; 
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs= ps.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

}
