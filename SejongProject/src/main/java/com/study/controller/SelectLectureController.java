package com.study.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.study.model.dto.Lecture;
import com.study.service.selectLectureService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/selectLecture")
public class SelectLectureController extends HttpServlet{
	
	private selectLectureService service = new selectLectureService();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
        String stdId = (String) session.getAttribute("stdId");
        
		String inputYear = req.getParameter("inputYear");
		char inputSemester = req.getParameter("inputSemester").charAt(0);
		
		System.out.println(stdId);
		System.out.println(inputYear);
		System.out.println(inputSemester);
		
		List<Lecture> lectureList = new ArrayList<Lecture>();
		
		lectureList = service.viewLectureList(stdId, inputYear, inputSemester);
		
		if (lectureList != null) {
			for (Lecture lec : lectureList) {
				System.out.println(lec);

			}
		} else if (lectureList == null) {
			System.out.println("해당하는 강좌가 없습니다.");
		}
		
		req.setAttribute("lectureList", lectureList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/selectLecture.jsp");
		
		dispatcher.forward(req, resp);
	}

	
	

}
