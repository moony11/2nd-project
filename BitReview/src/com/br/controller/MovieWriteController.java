package com.br.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.model.dao.BoardDAO;
import com.br.model.dao.MovieDAO;
import com.br.model.vo.MovieBoardVO;
import com.br.model.vo.MovieReplyVO;
import com.br.model.vo.MovieVO;

@WebServlet("/movieWrite")
public class MovieWriteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String cPage = request.getParameter("cPage");
		int movieId = Integer.parseInt(type);

		System.out.println("cPage : " + cPage);
		MovieVO vo = MovieDAO.getMovieInfo(movieId);
		
		request.setAttribute("vo", vo);
		request.setAttribute("cPage", cPage);
		
		request.getRequestDispatcher("mainView.jsp?contentPage=movie/movieWrite.jsp").forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	
}
