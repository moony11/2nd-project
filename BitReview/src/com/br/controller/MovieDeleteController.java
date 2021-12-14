package com.br.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.BoardDAO;
import com.br.model.vo.MovieBoardVO;

@WebServlet("/mDelete")
public class MovieDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String cPage = request.getParameter("cPage");
		String board = request.getParameter("board");
		System.out.println("글삭제 type : " + type);
		System.out.println("글삭제 cPage : " + cPage);
		System.out.println("글삭제 board : " + board);
		
		int boardId = Integer.parseInt(board);
	
		int result = BoardDAO.delete(boardId);
		System.out.println("result 삭제업뎃결과 : " + result);
		
		String uri = "movieBoard?type=" + type + "&cPage=" + cPage;
		//String uri = "mainView.jsp?contentPage=movie/" + type + "&cPage=" + cPage;
		request.getRequestDispatcher(uri).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}
