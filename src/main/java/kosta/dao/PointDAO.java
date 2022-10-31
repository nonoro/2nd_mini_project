package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.PointDTO;

public interface PointDAO {
	List<PointDTO> selectPointByUserId(String userId) throws SQLException; 
}
