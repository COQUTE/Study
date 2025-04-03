package com.study.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/timeTable")
public class ShowTimeTableController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 학생 정보와 학기 정보를 화면에서 받아옴
		String stdId = req.getParameter("stdId");
		String semester = req.getParameter("semester");
		
		// 필요한 정보 : 교시 | 요일 | 과목명
		// 서비스 객체 생성하여 받아온 데이터를 매개변수로 하여 Service 호출함
		
		System.out.println("stdId : " + stdId);
		System.out.println("semester : " + semester);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB_INF/views/showTimeTable.jsp");
		
		dispatcher.forward(req, resp);
		
		
	}

}
