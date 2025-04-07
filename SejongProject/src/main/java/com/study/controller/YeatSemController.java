package com.study.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/yearsem")
public class YeatSemController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
        String stdId = (String) session.getAttribute("stdId");
        
RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/option.jsp");
		
		dispatcher.forward(req, resp);
	}

}
