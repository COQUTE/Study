package com.study.controller;

import java.io.IOException;
import java.util.List;

import com.study.model.dto.Club;
import com.study.model.dto.Student;
import com.study.service.SejongService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/function/selectClub")
public class SelectClubController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 서비스 객체 생성
		SejongService service = new SejongService();

		// 현재 로그인 한 학생 학번 session으로부터 가져오기
		String stdId = (String)req.getSession().getAttribute("stdId");
		
		// DB로부터 소속된 동아리 리스트 가져오기
		List<Club> clubList = service.selectClub(stdId);
		
		// request 객체에 동아리 리스트 세팅
		req.setAttribute("clubList", clubList);
		
		// 회장 여부 확인
		boolean isPresident = false;

		for(Club club : clubList) {
			if(stdId.equals(club.getPresidentId()))
				isPresident = true;
		}
		
		// request 객체에 회장 여부 세팅
		req.setAttribute("isPresident", isPresident);
		
		// 회장이면, DB로부터 학생 정보 가져오기
		if(isPresident) {
			List<Student> stdList = service.selectClubMember(stdId);
			req.setAttribute("clubMember", stdList);
		}
		
		// view로 보내기
		req.getRequestDispatcher("/WEB-INF/views/function/selectClub.jsp").forward(req, resp);
	}
}
