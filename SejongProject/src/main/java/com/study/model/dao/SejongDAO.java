package com.study.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.study.common.Template;
import com.study.model.dto.Club;
import com.study.model.dto.Score;
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

	public List<Club> selectClub(Connection conn, String stdId) {

		List<Club> clubList = null;
		
		try {
			String query = """
					SELECT CLUB_ID, CLUB_NAME, STD_AMOUNT, PRESIDENT_ID, CLUB_MANAGER_ID, CLUBROOM
					FROM TB_CLUB
					WHERE CLUB_ID IN (SELECT CLUB_ID
									 FROM TB_CLUB_MEMBER
									 WHERE STD_ID = ?)
					""";
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, stdId);
			
			rs = pstmt.executeQuery();
			
			if(!rs.isBeforeFirst())
				return clubList;
			
			clubList = new ArrayList<Club>();
			
			while(rs.next()) {
				clubList.add(new Club(rs.getString(1), rs.getString(2), rs.getInt(3), 
									rs.getString(4), rs.getString(5), rs.getString(6)));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			Template.close(rs);
			Template.close(pstmt);
		}
		
		return clubList;
	}

	public List<Score> printGrade(Connection conn, String stdId) {

		List<Score> gradeList = new ArrayList<>();
		
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
				
				gradeList.add(new Score(lctName, lctSemester, grade, credit));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Template.close(rs);
			Template.close(pstmt);
			
		}
		
		return gradeList; 
	}
	
  public List<Student> selectClubMember(Connection conn, String stdId) {

	List<Student> stdList = null;
		
	try {
		String query = """
				SELECT STD_ID, STD_NAME, STD_ADDRESS, STD_PHONE, STD_EMAIL, MAJOR, MINOR, ACCOUNT_NUM
				FROM TB_STUDENT
				WHERE STD_ID IN (SELECT STD_ID
								  FROM TB_CLUB_MEMBER
									WHERE CLUB_ID = (SELECT CLUB_ID
									 				FROM TB_CLUB
									 				WHERE PRESIDENT_ID = ?))
					""";
			
			pstmt = conn.prepareStatement(query);

  if(!rs.isBeforeFirst())
			return stdList;
			
		stdList = new ArrayList<Student>();
			
		while(rs.next()) {
			stdList.add(new Student(rs.getString(1), rs.getString(2), rs.getString(3),
								rs.getString(4), rs.getString(5), rs.getString(6),
								rs.getString(7), rs.getString(8)));
		}
			
	} catch (Exception e) {
		e.printStackTrace();
			
	} finally {
		Template.close(rs);
		Template.close(pstmt);
	}
		
	return stdList;
}
  
}