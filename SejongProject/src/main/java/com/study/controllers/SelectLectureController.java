package com.study.controllers;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/selectLecture")
public class SelectLectureController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String inputId = req.getParameter("inputId");
		String inputYear = req.getParameter("inputYear");
		String inputSemester = req.getParameter("inputSemester");
		
		System.out.println(inputId);
		System.out.println(inputYear);
		System.out.println(inputSemester);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB_INF/views/selectLecture.jsp");
		
		dispatcher.forward(req, resp);
	}
	
	

}
