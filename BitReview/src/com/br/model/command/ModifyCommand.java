package com.br.model.command;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.TpBoardDAO;
import com.br.model.vo.BoardVO;



public class ModifyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("일단 글수정은 여기");
		
		int tp_boardid = Integer.parseInt(request.getParameter("tp_boardid"));
		
		//1. 디비연결하고 데이터 가져오기 (글제목, 글내용, 티비프로, 작성자, 조회수, 추천수 ,이미지?
		BoardVO one = TpBoardDAO.selectOne(tp_boardid);
		request.setAttribute("one", one);
		
		System.out.println(one.getTp_name());

		return "mainView.jsp?contentPage=tvProgram/TPmodify.jsp";
		
	}

}
