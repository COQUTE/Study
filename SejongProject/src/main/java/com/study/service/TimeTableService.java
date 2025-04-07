package com.study.service;

import java.sql.Connection;
import java.util.List;

import com.study.common.Template;
import com.study.model.dao.TimeTableDAO;
import com.study.model.dto.TimeTable;

public class TimeTableService {
	
	TimeTableDAO dao = new TimeTableDAO();
	
	public List<TimeTable> selectTimeTable(String stdId) {

		// Connection 객체 생성
		Connection conn = Template.getConnection();
		
		// 데이터 가공 (불필요)
		
		// DAO 메서드 호출 결과 반환
		List<TimeTable> timeTableList = dao.selectTimeTable(conn, stdId);
		
		
		// 다 쓴 커넥션 자원 반환
		Template.close(conn);
		
		return timeTableList;
	}
}
