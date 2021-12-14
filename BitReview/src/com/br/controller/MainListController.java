package com.br.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.MovieDAO;
import com.br.model.vo.MovieScoreVO;
import com.br.model.vo.MovieVO;

@WebServlet("/mainList")
public class MainListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 실행");
		List<MovieVO> list = MovieDAO.getGradeList();
		List<MovieVO> list2 = MovieDAO.getWishList();
		List<MovieVO> list3 = MovieDAO.getGenreList();
		System.out.println("list : " + list);
		System.out.println("list2 : " + list2);
		System.out.println("list3 : " + list3); 
		
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.getRequestDispatcher("mainView.jsp?contentPage=movie/mainList.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
		
	}
	
}
