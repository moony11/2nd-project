package com.br.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.BoardDAO;
import com.br.model.vo.MovieReplyVO;

@WebServlet("/replyUp")
public class ReplyUpdateController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String type = request.getParameter("type");
		
		System.out.println("리플아이디 : " + type);
		int replyId = Integer.parseInt(type);
		
		// 4. 수정 댓글 조회
		MovieReplyVO rvo = BoardDAO.getCommOne(replyId);
		System.out.println("댓글등록 성공여부 : " + rvo);
		
		
		String result = makeJsonVO(replyId);
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
	
	private String makeJsonVO (int reply_id) {
		//JSON 형태 문자열로 바꾸기
		StringBuilder result = new StringBuilder();
		MovieReplyVO vo = BoardDAO.getCommOne(reply_id);
			result.append(" {\"vo\" : [");
			result.append("{");
			result.append("\"nickname\" : \"" + vo.getNickname() + "\",");
			result.append("\"reply_date\" : \"" + vo.getReply_date() + "\",");
			result.append("\"reply_content\" : \"" + vo.getReply_content() + "\",");
			result.append("\"reply_id\" : \"" + vo.getReply_id() + "\"");
			result.append("}");
			result.append("]}");
		
		return result.toString();
	}
	
	
}
