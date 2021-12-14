package com.br.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.model.dao.BoardDAO;
import com.br.model.vo.MovieBoardVO;
import com.br.model.vo.MovieReplyVO;

@WebServlet("/movieReview")
public class MovieReviewController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String cPage = request.getParameter("cPage");
		int boardId = Integer.parseInt(type);
		
		// 로그인 객체 받기 ??
		HttpSession session = request.getSession();
		
		// 1. 게시글 조회수 1증가

		int hit = BoardDAO.updateHit(boardId);
		System.out.println("> 조회수 : " + hit);
		
		// 2. 게시글 데이터 
		MovieBoardVO vo =  BoardDAO.selectOne(boardId);
		System.out.println("> vo : " + vo);
		
		// 3. 댓글 데이터
		List<MovieReplyVO> list = BoardDAO.getCommList(boardId);
		
		
		
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("vo", vo);
		request.setAttribute("hit", hit);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("mainView.jsp?contentPage=movie/movieReview.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}
