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
import com.br.model.vo.MovieReplyVO;

@WebServlet("/getReply")
public class ReplyInsertController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String type = request.getParameter("type");
		//String member = request.getParameter("member");
		String check = request.getParameter("check");
		String replyContent = request.getParameter("replyContent");
		
		// 로그인 객체 받기 ??
		HttpSession session = request.getSession();
		int member = (Integer) session.getAttribute("mId");
		
		System.out.println("보드아이디 : " + type);
		System.out.println("멤버 1 : " + member);
		System.out.println("댓글 내용 replyContent : " + replyContent);
		
		int boardId = Integer.parseInt(type);
		//int memberId = Integer.parseInt(member);
		// 4. 댓글등록
		MovieReplyVO rvo = new MovieReplyVO();
		
		if(check.equals("1")) {
			rvo.setBoard_id(boardId);
			rvo.setMember_id(member);
			rvo.setReply_content(replyContent);
			int re = BoardDAO.replyInsert(rvo);
			System.out.println("댓글등록 성공여부 : " + re);
			
			List<MovieReplyVO> list = BoardDAO.getCommList(boardId);
			String result = makeJson(list);
			System.out.println("응답 JSON 문자열 : " + result);
			
			PrintWriter out = response.getWriter();
			out.print(result);
			
		} else if (check.equals("2")) {
			List<MovieReplyVO> list = BoardDAO.getCommList(boardId);
			String result = makeJson(list);
			System.out.println("응답 JSON 문자열 : " + result);
			
			PrintWriter out = response.getWriter();
			out.print(result);
		}
		
		

		/*
		 * // JSON 문자열 출력 PrintWriter out = response.getWriter(); out.print(result);
		 */
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	
	private String makeJson (List<MovieReplyVO> list) {
		//JSON 형태 문자열로 바꾸기
		StringBuilder result = new StringBuilder();
		result.append(" {\"list\" : [");
		for (MovieReplyVO vo : list) {
			result.append("{");
			result.append("\"nickname\" : \"" + vo.getNickname() + "\",");
			result.append("\"reply_date\" : \"" + vo.getReply_date() + "\",");
			result.append("\"reply_content\" : \"" + vo.getReply_content() + "\",");
			result.append("\"reply_id\" : \"" + vo.getReply_id() + "\"");
			result.append("},");
		}
		result.delete(result.length() - 1, result.length()); // for문 안에 마지막 ',' 삭제하기
		result.append("]}");
		
		return result.toString();
	}
	
	
}
