package com.br.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.common.Command;
import com.br.model.member.memberDAO;
import com.br.model.member.memberDTO;

public class memberModifyCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();
		memberDAO dao = new memberDAO();
		
		memberDTO member = new memberDTO();

		
		member.setLogin_id(id);
		member.setLogin_pw(request.getParameter("password"));
		member.setEmail(request.getParameter("email"));
		member.setPhone(request.getParameter("phone"));
		
		dao.updateMember(member);
   		session.setAttribute("msg", "0");
   		
		return "mainView.jsp?contentPage=member/resultView.jsp";
	}

}
