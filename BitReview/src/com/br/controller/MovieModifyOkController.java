package com.br.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.BoardDAO;
import com.br.model.vo.MovieBoardVO;

@WebServlet("/modifyOk")
public class MovieModifyOkController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String cPage = request.getParameter("cPage");
		String board = request.getParameter("board");
		System.out.println("글 수정 type : " + type);
		System.out.println("글 수정 cPage : " + cPage);
		System.out.println("글 수정 board : " + board);
		
		int boardId = Integer.parseInt(board);
		
		MovieBoardVO bvo = new MovieBoardVO();
		bvo.setBoard_id(boardId);
		bvo.setSubject(request.getParameter("subject"));
		bvo.setBoard_content(request.getParameter("content"));
		System.out.println("글 수정 bvo : " + bvo);
		
		int result = BoardDAO.update(bvo);
		String uri = "";
		if(result == 1) {
			request.setAttribute("message", "글 수정 성공");
			request.setAttribute("bvo", bvo);
			
			uri = "movieBoard?type=" + type + "&cPage=" + cPage;
			//uri = "mainView.jsp?contentPage=movie/" + type + "&cPage=" + cPage;
		} else if (result == 0) {
			request.setAttribute("message", "글 수정 실패");
		}
		
		request.getRequestDispatcher(uri).forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}