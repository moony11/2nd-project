package com.br.command.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.common.Command;
import com.br.model.member.memberDAO;
import com.br.model.member.memberDTO;


public class memberLoginCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		memberDAO dao = new memberDAO();
		int check = dao.loginCheck(id, password);
		
		memberDTO temp = new memberDTO();
		
		if(check == 0){ 
	   		request.setAttribute("fail", "0");
	   		//return "member/loginView.jsp";
	   		return "mainView.jsp?contentPage=member/loginView.jsp";
		}
		else if(check == -1){
			request.setAttribute("fail", "-1");
			//return "member/loginView.jsp";
			return "mainView.jsp?contentPage=member/loginView.jsp";
		}
		else{
			
	   		session.setAttribute("sessionID", id);
	   		temp = dao.getUserInfo(id);
			
			int mId = temp.getMember_id();
			String nickName = temp.getNickName();
			System.out.println(id);
			System.out.println(mId);
			session.setAttribute("mId", mId);
			
			// 닉네임
			session.setAttribute("nickName", nickName);
	   		// return "mainView.jsp";
	   		return "mainView.jsp";
		}
	}

}
