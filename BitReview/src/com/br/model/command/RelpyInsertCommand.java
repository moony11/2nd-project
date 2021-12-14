package com.br.model.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.ReplyDAO;
import com.br.model.member.memberDAO;
import com.br.model.member.memberDTO;
import com.br.model.vo.ReplyVO;

@WebServlet("/reply")
public class RelpyInsertCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html:charset=UTP-8");
		response.setCharacterEncoding("UTF-8");

		int tp_boardid = Integer.parseInt(request.getParameter("tp_boardid"));
		String r_content = request.getParameter("r_content");

		System.out.println(tp_boardid);

		// 2. 가져온 값 vo에 저장"
		ReplyVO rvo = new ReplyVO();

		rvo.setTp_boardid(tp_boardid);
		rvo.setR_content(r_content);
		// 로그인되어 있는 멤버 rvo.setWriter();
		String id = request.getSession().getAttribute("sessionID").toString();
		
   		memberDTO temp = new memberDTO();
   		memberDAO dao = new memberDAO();
   		temp = dao.getUserInfo(id);
		
		String writer = temp.getNickName();
		
		rvo.setR_writer(writer);
		ReplyDAO.replyInsert(rvo);

		List<ReplyVO> rlist = ReplyDAO.replyList(tp_boardid);
		
		String result = makeJson(rlist);
		System.out.println("응답 JSON 문자열: " + result);
		
		//JOSN 문자열 출력
		PrintWriter out = response.getWriter();
		out.print(result);	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private String makeJson(List<ReplyVO> rlist) {
		
		//JSON 형태 문자열로 바꾸기
		StringBuilder result = new StringBuilder();
		result.append("{\"rlist\":[");
		
		for (ReplyVO rvo : rlist) {
			result.append("{");
			result.append("\"tp_replyid\" : " + rvo.getTp_replyid() + ",");
			result.append("\"r_writer\" : \"" + rvo.getR_writer() + "\",");
			result.append("\"r_content\" : \"" + rvo.getR_content() + "\",");
			result.append("\"r_regdate\" : \"" + rvo.getR_regdate() + "\"");
			result.append("},");
		}
		result.delete(result.length() - 1, result.length());
		result.append("]}");
		
		return result.toString();
	}

	
}
