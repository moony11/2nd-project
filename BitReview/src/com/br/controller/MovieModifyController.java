package com.br.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.BoardDAO;
import com.br.model.dao.MovieDAO;
import com.br.model.vo.MovieBoardVO;
import com.br.model.vo.MovieVO;

@WebServlet("/modify")
public class MovieModifyController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String cPage = request.getParameter("cPage");
		String board = request.getParameter("board");
		
		int movieId = Integer.parseInt(type);
		int boardId = Integer.parseInt(board);
		
		MovieVO vo = MovieDAO.getMovieInfo(movieId);
		MovieBoardVO bvo = BoardDAO.selectOne(boardId);
		
		request.setAttribute("vo", vo);
		request.setAttribute("bvo", bvo);
		request.setAttribute("cPage", cPage);
		
		String uri = "mainView.jsp?contentPage=movie/movieModify.jsp";
		
		request.getRequestDispatcher(uri).forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}
