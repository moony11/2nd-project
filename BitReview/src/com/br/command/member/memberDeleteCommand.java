package com.br.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.common.Command;
import com.br.model.member.memberDAO;

public class memberDeleteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();
		String password = request.getParameter("password");
		
		memberDAO dao = new memberDAO();
		System.out.println(id);
		System.out.println(password);
		int check = dao.deleteMember(id, password);
		System.out.println(check);
		if(check == 1){
			
			session.removeAttribute("sessionID");
			// return "member/resultView.jsp";
			return "mainView.jsp?contentPage=member/resultView.jsp";
		}
		else{
			
			return null;
		}
	}

}
