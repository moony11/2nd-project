package com.br.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.book.dao.bookDAO;
import com.br.book.vo.bookReviewVO;
import com.br.book.vo.bookScoreVO;
import com.br.model.member.memberDAO;
import com.br.model.member.memberDTO;

@WebServlet("/getBookReview")
public class getBookReview extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		System.out.println("getbookreview 실행");
		
		//리뷰 작성 내용과 별점 추출
		String review = req.getParameter("review");
		int score = Integer.parseInt(req.getParameter("score"));
		int bookid = Integer.parseInt(req.getParameter("bookid"));
		
		System.out.println(review);
		System.out.println(score);
		System.out.println(bookid);
		
		//VO 타입 객체에 저장
		HttpSession session = req.getSession();
		String id = session.getAttribute("sessionID").toString();
		memberDAO dao = new memberDAO();
		memberDTO member = dao.getUserInfo(id);
		
		
		bookReviewVO bookreview = new bookReviewVO();
		
		bookreview.setB_id(bookid);
		bookreview.setSp_comm(review);
		bookreview.setNickname(member.getNickName());
		
		bookreview.setMember_id(member.getMember_id());
		bookScoreVO bookscore = new bookScoreVO();
		
		bookscore.setB_id(bookid);
		bookscore.setBook_score(score);
		
		System.out.println("review vo 객체 값 : " + bookreview.toString());
		System.out.println("score vo 객체 값 : " + bookscore.toString());
		
		//저장된 객체값 DAO의 insert메소드 처리
		bookDAO.insert_review(bookreview);
		bookDAO.insert_score(bookscore);
		
		String url = "Bcontroller?type=onclick&bookid=";
		url += bookid;
		//페이지 전환
		resp.sendRedirect(url);
	}
}
