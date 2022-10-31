package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.PointDTO;

public interface PointService {
	List<PointDTO> selectPointByUserId(String userId) throws SQLException; 
}
