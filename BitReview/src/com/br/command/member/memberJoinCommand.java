package com.br.command.member;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.common.Command;
import com.br.model.member.memberDAO;
import com.br.model.member.memberDTO;

public class memberJoinCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		memberDAO dao = new memberDAO();
		memberDTO member = new memberDTO();
		//int id = Integer.parseInt(request.getParameter("id"));
		member.setLogin_id(request.getParameter("id"));
		member.setLogin_pw(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setNickName(request.getParameter("nickName"));
		
		String id = member.getLogin_id();
		String birth = "";
		Date date = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");
		birth = request.getParameter("birthyy") + "/" +	request.getParameter("birthmm") + "/" + request.getParameter("birthdd");
		member.setBirth(birth);
		String email = "";
		email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
		member.setEail(email);
		member.setPhone(request.getParameter("phone"));
		dao.insertMember(member);
		
		
		
		request.getSession().setAttribute("msg", "1");
		request.getSession().setAttribute("sessionID", id);
		
		memberDTO temp = new memberDTO();
		temp = dao.getUserInfo(id);
		int mId = temp.getMember_id();
		String nickName = temp.getNickName();
		request.getSession().setAttribute("mId", mId );
		request.getSession().setAttribute("nickName", nickName );		
		return "mainView.jsp?contentPage=member/resultView.jsp";
	}

}
