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
		
		String stdId = req.getParameter("stdId");
		
		// 학번이 입력되었기 때문에
		// 1. 학번이 실제로 DB에 있는지 확인
		// 2-1. 맞다면 loginSucess.jsp 응답
		// 2-2. 아니면? 나도 몰라
		SejongService service = new SejongService();
		
		// service 메서드 호출
		Student student = service.selectStdId(stdId);
		
		StringBuilder sb = new StringBuilder();
		
		if(student == null) {
			sb.append("loginFailed");
			
			
			// 로그인 실패시 session 객체에 {login : false} 세팅
			req.getSession().setAttribute("login", false);
		} else {
			sb.append("loginSuccess");
			
			// 로그인 성공시 session 객체에 {login : true}, {stdId : 현재 로그인한 학생 학번} 세팅
			req.getSession().setAttribute("login", true);
			req.getSession().setAttribute("stdId", stdId);
		}
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/" + sb.toString() + ".jsp");
		
		dispatcher.forward(req, resp);
	}
}
