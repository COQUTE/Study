package com.study.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.study.common.Template;
import com.study.model.dao.SejongDAO;
import com.study.model.dto.Score;
import com.study.model.dto.Student;

public class SejongService {

	SejongDAO dao = new SejongDAO();
	
	public Student selectStdId(String stdId) {

		// Connection 객체 생성
		Connection conn = Template.getConnection();
		
		// 데이터 가공 (불필요)
		
		// DAO 메서드 호출 결과 반환
		Student targetStd = dao.selectStdId(conn, stdId);
		
		// DML(commit/rollback) (select기 때문에 불필요)
		
		// 다 쓴 커넥션 자원 반환
		Template.close(conn);
		
		return targetStd;
	}
	
	public List<Score> printGrade(String stdId) {
		
		Connection conn = Template.getConnection();
		
		List<Score> gradeList = new ArrayList<>();
		
		gradeList = dao.printGrade(conn, stdId);
		
		Template.close(conn);
		
		return gradeList;
		
		
	}

}
