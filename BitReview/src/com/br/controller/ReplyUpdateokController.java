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

@WebServlet("/replyUpOk")
public class ReplyUpdateokController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String type = request.getParameter("type");
		String replyId = request.getParameter("replyId");
		String check = request.getParameter("check");
		String replyContent = request.getParameter("replyContent");
		
		System.out.println("보드아이디 : " + type);
		System.out.println("check 1 수정 2 삭제 : " + check);
		System.out.println("댓글 내용 reply_id : " + replyId);
		System.out.println("댓글 내용 replyContent : " + replyContent);
		
		int boardId = Integer.parseInt(type);
		int reply_id = Integer.parseInt(replyId);
		
		
		// 해당 댓글 조회 
		MovieReplyVO rvo = BoardDAO.getCommOne(reply_id);
		
		if (check.equals("1")) {
			rvo.setReply_id(reply_id);
			rvo.setReply_content(replyContent);
			int re = BoardDAO.replyUpdate(rvo);
			System.out.println("댓글등록 성공여부 : " + re);
			
		} else if (check.equals("2")) {
			int re = BoardDAO.replyDelete(reply_id);
			System.out.println("댓글등록 삭제여부 : " + re);
			
		} else if (check.equals("3")) {
			List<MovieReplyVO> list = BoardDAO.getCommList(boardId);
			String result = makeJson(list);
		}
		
		
		// 댓글 리스트 
		List<MovieReplyVO> list = BoardDAO.getCommList(boardId);
		System.out.println("list : " + list);
		
		System.out.println("rvo : " + rvo);
		

		String result = makeJson(list);
		System.out.println("응답 JSON 문자열 : " + result);
		
		// JSON 문자열 출력 
		PrintWriter out = response.getWriter();
		out.print(result);
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
		
		if (list.size() == 0) {
			result.append("]}");
		} else {
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
		}
		
		
		return result.toString();
	}
}
