package com.br.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.book.dao.bookDAO;
import com.br.book.vo.bookVO;
import com.br.book.vo.bookWriterVO;

@WebServlet("/bookmain")
public class bookmainController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">>main doget 실행");
		
		//메인 순위 정보 리스트
		//전체 카테고리 평론가 평점 순위
		List<bookVO> list = bookDAO.all_cate_cr_rank();
		//전체 카테고리 평론가 평점 순위에 들어갈 작가명
		List<bookWriterVO> listwrname = bookDAO.all_cate_cr_rank_name();
		
		//전체 카테고리 일반사용자 평점 순위
		List<bookVO> list2 = bookDAO.all_cate_u_rank();
		//전체 카테고리 일반사용자 평점 순위에 들어갈 작가명
		List<bookWriterVO> list2wrname = bookDAO.all_cate_u_rank_name();
		
		System.out.println("list : " + list);
		System.out.println("list2 : " + list2);
		System.out.println("listwrname : " + listwrname);
		System.out.println("list2wrname : " + list2wrname);
		
		//응답 데이터 저장
		req.setAttribute("allcatecrrank", list);
		req.setAttribute("allcateuserrank", list2);
		req.setAttribute("allcatecrrank_wrname", listwrname);
		req.setAttribute("allcateuserrank_wrname", list2wrname);
		
		
		
		req.getRequestDispatcher("mainView.jsp?contentPage=book/bookmain.jsp").forward(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
		
	}
}
