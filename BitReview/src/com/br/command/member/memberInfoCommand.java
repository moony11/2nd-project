package com.br.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.common.Command;
import com.br.model.member.memberDAO;
import com.br.model.member.memberDTO;


public class memberInfoCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();
		
		String mId = session.getAttribute("mId").toString() + "*****************************";
		System.out.println(mId);
		
		memberDAO dao = new memberDAO();
		memberDTO member = dao.getUserInfo(id);
		
		request.setAttribute("memberInfo", member);
		
		//return "member/memberInfoView.jsp";
		return "mainView.jsp?contentPage=member/memberInfoView.jsp";
	}

}
