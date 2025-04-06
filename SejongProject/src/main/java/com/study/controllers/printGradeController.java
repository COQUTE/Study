package com.study.controllers;

import java.io.IOException;
import java.util.List;

import com.study.model.dto.Score;
import com.study.model.dto.Student;
import com.study.service.SejongService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/printGrade")
public class printGradeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String stdId = req.getParameter("stdId");
		
		SejongService service = new SejongService();
		
		List<Score> printGrade = service.printGrade(stdId);
	
		int sum = 0;
		int sumCredit = 0;
		
		for (Score s : printGrade) {
		    String grade = s.getGrade();
		    int credit = s.getCredit();
		    int gradePoint = 0;

		    switch (grade) {
		        case "A": gradePoint = 4; break;
		        case "B": gradePoint = 3; break;
		        case "C": gradePoint = 2; break;
		        case "D": gradePoint = 1; break;
		        default: gradePoint = 0;
		    }

		    sum += gradePoint * credit;
		    sumCredit += credit;
		}

		double gpa = (double)sum / sumCredit;
		
		req.setAttribute("printGrade", printGrade);
		req.setAttribute("gpa", gpa);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/printGrade.jsp");
		dispatcher.forward(req, resp);
		
	
	}
	
	
	
	
}
