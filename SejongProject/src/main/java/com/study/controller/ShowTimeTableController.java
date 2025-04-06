package com.study.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.study.model.dto.TimeTable;
import com.study.service.TimeTableService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/timeTable")
public class ShowTimeTableController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 학생 정보와 학기 정보를 화면에서 받아옴
		HttpSession session = req.getSession();

		List<TimeTable> timeTableList = new ArrayList<TimeTable>();
		
		String stdId = (String) session.getAttribute("stdId");
		
		TimeTableService service = new TimeTableService();
		
		// 서비스 객체 생성하여 받아온 데이터를 매개변수로 하여 Service 호출함
		timeTableList = service.selectTimeTable(stdId);
		
		/*
		 * for (TimeTable timeTable : timeTableList) { String stdName =
		 * timeTable.getStdName(); String lctName = timeTable.getLctName(); String
		 * classId = timeTable.getClassId(); char day = timeTable.getDay(); int period =
		 * timeTable.getPeriod(); int hour = timeTable.getHour(); String classroom =
		 * timeTable.getClassroom(); }
		 */
		
		req.setAttribute("timeTableList", timeTableList);
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/showTimeTable.jsp");
		
		dispatcher.forward(req, resp);
	}
	

}
