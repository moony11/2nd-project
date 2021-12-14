package com.br.book.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.br.mybatis.DBService;
import com.br.book.dao.bookDAO;
import com.br.book.vo.bookScoreVO;
import com.br.model.member.memberDAO;
import com.br.model.member.memberDTO;

@WebServlet("/delBookReview")
public class delBookReview extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		System.out.println("delBookReview doGet 실행");
		
		// 로그인 아이디 받는 법
		HttpSession session = req.getSession();
		String logId = session.getAttribute("sessionID").toString();
		
		memberDAO mDAO = new memberDAO();
		memberDTO temp = new memberDTO();
		
		temp = mDAO.getUserInfo(logId);
		
		
		//리뷰 아이디와 책 아이디 추출
		String reviewid = req.getParameter("reviewid");
		int bookid = Integer.parseInt(req.getParameter("bookid")); 
		
		
		int memberid = temp.getMember_id();
		
		//점수 삭제를 위한 bookScoreVO 값 생성
		bookScoreVO delscore = new bookScoreVO();
		delscore.setB_id(bookid);
		delscore.setMember_id(memberid);
		//저장된 객체값 DAO의 delete메소드 처리
		bookDAO.delete_review(reviewid);
		bookDAO.delete_score(delscore);
		
		String url = "Bcontroller?type=onclick&bookid=";
		url += bookid;
		
		//페이지 전환
		resp.sendRedirect(url);
		
	}
}
