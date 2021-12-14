package com.br.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.model.dao.MovieDAO;
import com.br.model.dao.BoardDAO;
import com.br.model.vo.MovieBoardVO;
import com.br.model.vo.MovieScoreVO;
import com.br.model.vo.MovieVO;

@WebServlet("/controller")
public class MovieInfoController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doGet() 실행~~" );
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		
		int movieId = Integer.parseInt(type);
		
		MovieVO vo = MovieDAO.getMovieInfo(movieId);
		int wish = MovieDAO.getScoreOne(movieId);
		
		List<MovieBoardVO> list = BoardDAO.getReview(movieId);
		System.out.println("vo : " + vo);
		System.out.println("list : " + list);
		
		request.setAttribute("vo", vo);
		request.setAttribute("wish", wish);
		request.setAttribute("list", list);
		request.getRequestDispatcher("mainView.jsp?contentPage=movie/movieInfo.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}
