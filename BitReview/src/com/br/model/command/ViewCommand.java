package com.br.model.command;

import java.io.IOException;

import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.TpBoardDAO;
import com.br.model.vo.BoardVO;
import com.br.model.dao.ReplyDAO;
import com.br.model.vo.ReplyVO;


public class ViewCommand implements Command {


	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int tp_boardid = Integer.parseInt(request.getParameter("tp_boardid"));
		
		//1. ?��비연결하�? ?��?��?�� �??��?���? (�??���?, �??��?��, ?��비프�?, ?��?��?��, 조회?��, 추천?�� ,?��미�??
		BoardVO one = TpBoardDAO.selectOne(tp_boardid);
		List<ReplyVO> rlist = ReplyDAO.replyList(tp_boardid);
		
		// 조회?�� 증�?
		TpBoardDAO.updateViewCnt(tp_boardid);
		
		request.setAttribute("one", one);
		request.setAttribute("rlist", rlist);
		
		System.out.println(rlist);
	
		
		//3. ?��?��?��?���?(TPview.jsp)�? ?���? ?��?��(?��?��)
		//return "tvProgram/TPview.jsp";
		return "mainView.jsp?contentPage=tvProgram/TPview.jsp";
	}
	
	

}
