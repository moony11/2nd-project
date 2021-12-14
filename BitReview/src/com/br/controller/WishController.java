package com.br.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.model.dao.BoardDAO;
import com.br.model.dao.MovieDAO;
import com.br.model.member.memberDAO;
import com.br.model.member.memberDTO;
import com.br.model.vo.MovieBoardVO;
import com.br.model.vo.MovieReplyVO;
import com.br.model.vo.MovieScoreVO;
import com.br.model.vo.MovieVO;

@WebServlet("/getWish")
public class WishController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		System.out.println("> type : " + type);

		int movieId = Integer.parseInt(type);
		int wish = MovieDAO.getScoreOne(movieId); 
		System.out.println("> 위시 증가 전 : " + wish);
		HttpSession session = request.getSession();
		String logId = session.getAttribute("sessionID").toString();
		memberDAO mDao = new memberDAO();
		memberDTO temp = new memberDTO();
		temp = mDao.getUserInfo(logId);
		int mId = temp.getMember_id();
		String nickName = temp.getNickName();	
				
		
		
		int re = MovieDAO.getWish(mId, movieId);
		System.out.println("인서트 결과: " + re);
		wish = MovieDAO.getScoreOne(movieId); 
		System.out.println("Nvo 후 : " + wish);
		System.out.println("위시증가 결과: " + re);
		
		StringBuilder result = new StringBuilder();
		//wish = MovieDAO.getScoreOne(movieId); 
		
		result.append(" {\"svo\" : [");
		result.append("{");
		result.append("\"wish\" : \"" + wish + "\"");
		result.append("}");
		result.append("]}");
		
		
	
	    String resultOne = result.toString();
		// JSON 문자열 출력 
	    System.out.println("응답 JSON 문자열 : " + resultOne);
	    
		PrintWriter out = response.getWriter();
		out.print(resultOne);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	
	

}
