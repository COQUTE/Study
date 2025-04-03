package com.study.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	
}
