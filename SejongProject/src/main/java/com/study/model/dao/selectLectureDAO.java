package com.study.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.study.common.Template;
import com.study.model.dto.Lecture;

public class selectLectureDAO {
	
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public List<Lecture> viewLectureList(Connection conn, String stdId, String inputYear, char inputSemester) {

		List<Lecture> lectureList = new ArrayList<Lecture>();

		try {
			String sql = """
						SELECT ROW_NUMBER() OVER (ORDER BY L.LCT_ID) AS row_num, L.*
						FROM TB_LECTURE L
						JOIN TB_COURSE_HISTORY C
						  ON L.LCT_ID = C.LCT_ID
						 AND L.CLASS_ID = C.CLASS_ID
						WHERE C.STD_ID = ?
						  AND L.LCT_YEAR = ?
						  AND L.LCT_SEMESTER = ?
					""";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stdId);
			pstmt.setString(2, inputYear);
			pstmt.setString(3, String.valueOf(inputSemester));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				lectureList.add(new Lecture(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6).charAt(0),
						rs.getString(7),
						rs.getString(8).charAt(0),
						rs.getInt(9),
						rs.getInt(10),
						rs.getInt(11),
						rs.getString(12),
						rs.getString(13)));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Template.close(rs);
			Template.close(pstmt);
		}
		return lectureList;
	}

}
