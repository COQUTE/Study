package com.study.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.study.common.Template;
import com.study.model.dto.Student;

public class SejongDAO {

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public Student selectStdId(Connection conn, String stdId) {
	
		// 결과 저장용 변수 선언
		Student std = null;
		
		try {
			// SQL 작성
			String query = "SELECT STD_ID FROM TB_STUDENT WHERE STD_ID = ?";
			
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(query);
			
			// ? (위치홀더)에 알맞은 값 세팅
			pstmt.setString(1, stdId);
			
			// SQL 수행 후 결과 반환 받기
			rs = pstmt.executeQuery();
			
			// 1행만 조회되기 때문에 if문 사용
			if(rs.next()) {
				std = new Student(rs.getString("STD_ID"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			
			Template.close(rs);
			Template.close(pstmt);
		}
		
		return std;
	}


	public List<Student> printGrade(Connection conn, String stdId) {

		List<Student> gradeList = new ArrayList<Student>();
		
		String SQL = """
				SELECT LCT_NAME, LCT_SEMESTER, GRADE, CREDIT
				FROM TB_COURSE_HISTORY
				JOIN TB_LECTURE USING(LCT_ID)
				WHERE STD_ID = ?	
				""";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, stdId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String lctName = rs.getString("LCT_NAME");
				String lctSemester = rs.getString("LCT_SEMESTER");
				String grade = rs.getString("GRADE");
				int credit = rs.getInt("CREDIT");
				
				gradeList.add(new Student(lctName, lctSemester, grade, credit));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Template.close(rs);
			Template.close(pstmt);
			
		}
		
		
		return gradeList; 
	}
	
}
