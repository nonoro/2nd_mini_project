package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.PointDTO;
import kosta.util.DbUtil;

public class PointDAOImpl implements PointDAO {

	@Override
	public List<PointDTO> selectPointByUserId(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<PointDTO> list = new ArrayList<PointDTO>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement("select * from point where user_id=? order by point_code desc");
			ps.setString(1, userId);
			rs = ps.executeQuery();			
			
			while(rs.next()) {				
				PointDTO point = new PointDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6));
				list.add(point);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}
}
