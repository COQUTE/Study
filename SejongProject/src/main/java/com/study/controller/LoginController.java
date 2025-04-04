package com.study.controller;

import java.io.IOException;

import com.study.model.dto.Student;
import com.study.service.SejongService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("test44444444444441");
		String stdId = req.getParameter("stdId");
		
		// 학번이 입력되었기 때문에
		// 1. 학번이 실제로 DB에 있는지 확인
		// 2-1. 맞다면 loginSucess.jsp 응답
		// 2-2. 아니면? 나도 몰라
		SejongService service = new SejongService();
		
		// service 메서드 호출
		Student student = service.selectStdId(stdId);
		
		StringBuilder sb = new StringBuilder();
		System.out.println("test1");
		if(student == null) {
			sb.append("loginFailed");
			System.out.println("test2");
			
		} else {
			sb.append("loginSuccess");
			System.out.println("test3");
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/" + sb.toString() + ".jsp");
		
		dispatcher.forward(req, resp);
	}
}
