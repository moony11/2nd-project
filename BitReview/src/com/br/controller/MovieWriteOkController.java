package com.br.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.model.dao.BoardDAO;
import com.br.model.vo.MovieBoardVO;

@WebServlet("/write")
public class MovieWriteOkController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String cPage = request.getParameter("cPage");
		int movieId = Integer.parseInt(type);
	
		HttpSession session = request.getSession();
		int member = (Integer) session.getAttribute("mId");
		
		MovieBoardVO bvo = new MovieBoardVO();
		bvo.setMovie_id(movieId);
		bvo.setMember_id(member);
		bvo.setSubject(request.getParameter("subject"));
		bvo.setBoard_content(request.getParameter("content"));
		
		int board = BoardDAO.insert(bvo);
		System.out.println("board 처리 : " + board);
		request.setAttribute("board", board);
		request.setAttribute("bvo", bvo);
		request.setAttribute("movieId", movieId);
		
		String url = "movieBoard?type=" + movieId + "&cPage=" + cPage;
		//String url = "mainView.jsp?contentPage=movie/" + movieId + "&cPage=" + cPage;
		request.getRequestDispatcher(url).forward(request, response);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
