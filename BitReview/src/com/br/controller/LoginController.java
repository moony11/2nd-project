package com.br.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.model.dao.BoardDAO;

@WebServlet("/login")
public class LoginController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
	
		int result = BoardDAO.login(id, password);
		
		
		HttpSession session = request.getSession();
		
		
		if (result == 1) {
			request.setAttribute("message", "로그인성공");
			request.setAttribute("id", id);
			
			session.setAttribute("user", id);
		} else if (result == 0) {
			request.setAttribute("message", "로그인실패");
		}
		
		request.getRequestDispatcher("").forward(request, response);
		
	}
	
	
}
