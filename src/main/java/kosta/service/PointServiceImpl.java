package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.PointDAO;
import kosta.dao.PointDAOImpl;
import kosta.dto.PointDTO;

public class PointServiceImpl implements PointService {
	private PointDAO pointDao = new PointDAOImpl();

	@Override
	public List<PointDTO> selectPointByUserId(String userId) throws SQLException {
		List<PointDTO> list = pointDao.selectPointByUserId(userId);
		if(list.isEmpty() || list.size() == 0) throw new SQLException(userId + "님의 포인트 내역이 없습니다.");
		return list;
	}
}
