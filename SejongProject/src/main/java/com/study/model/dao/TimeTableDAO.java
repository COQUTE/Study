package com.study.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.study.common.Template;
import com.study.model.dto.TimeTable;

public class TimeTableDAO {


	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public List<TimeTable> selectTimeTable(Connection conn, String stdId) {
	
		List<TimeTable> timeTableList = new ArrayList<TimeTable>();
		
		try {
			// SQL 작성
			String sql = """
					SELECT STD_ID, STD_NAME, LCT_NAME, L.CLASS_ID AS CLASS_ID, DAY, PERIOD, HOUR, CLASSROOM
					FROM TB_COURSE_HISTORY H 
					JOIN TB_STUDENT S USING(STD_ID)
					JOIN TB_LECTURE L ON (L.LCT_ID = H.LCT_ID)
					WHERE STD_ID = ?
					-- AND L.LCT_SEMESTER = 2
					AND L.LCT_YEAR = EXTRACT(YEAR FROM SYSDATE)""";
			
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ? (위치홀더)에 알맞은 값 세팅
			pstmt.setString(1, stdId);
			//pstmt.setInt(2, 2);
			
			// SQL 수행 후 결과 반환 받기
			rs = pstmt.executeQuery();
			
			int rowCount = 0;
			while(rs.next()) {
				String std_Id = rs.getString("STD_ID");
				String stdName = rs.getString("STD_NAME");
				String lctName = rs.getString("LCT_NAME");
				String classId = rs.getString("CLASS_ID");
				char day = rs.getString("DAY").charAt(0);
				int period = rs.getInt("PERIOD");
				int hour = rs.getInt("HOUR");
				String classroom = rs.getString("CLASSROOM");
				System.out.printf("%s, %s, %s, %s, %d, %d, %s\n", stdName, lctName, classId, day, period, hour, classroom );
				timeTableList.add(new TimeTable(std_Id, stdName, lctName, classId, day, period, hour, classroom));
				
			}
		} catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			
			Template.close(rs);
			Template.close(pstmt);
		}
		
		return timeTableList;
	}

}
