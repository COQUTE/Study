package com.study.service;

import java.sql.Connection;
import java.util.List;

import com.study.common.Template;
import com.study.model.dao.selectLectureDAO;
import com.study.model.dto.Lecture;

public class selectLectureService {

	selectLectureDAO dao = new selectLectureDAO();

	public List<Lecture> viewLectureList(String stdId, String inputYear, char inputSemester) {

		Connection conn = Template.getConnection();

		List<Lecture> lectureList = dao.viewLectureList(conn, stdId, inputYear, inputSemester);

		return lectureList;

	}
}
