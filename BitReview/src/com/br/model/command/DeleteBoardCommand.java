package com.br.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.TpBoardDAO;
import com.br.model.vo.BoardVO;

public class DeleteBoardCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tp_boardid = Integer.parseInt(request.getParameter("tp_boardid"));
		
		System.out.println(tp_boardid);
		
		TpBoardDAO.delete(tp_boardid);
		
		String idx = request.getParameter("idx");
		System.out.println(idx + " �?");
		
		if (idx == null) {
			idx = "0";
		}
		System.out.println(idx + " 값�?주세?��");
		//1. ?��비연결하�? ?��?��?�� �??��?���? 
		List<BoardVO> list = TpBoardDAO.getList(idx);
		System.out.println("list" + list);
		//2. ?��?��?��?���?(TPview.jsp)?�� ?��?��?�� ?��?��
		request.setAttribute("list", list);
		//return "tvProgram/TPmain.jsp";
		return "mainView.jsp?contentPage=tvProgram/TPmain.jsp";
	}

}
