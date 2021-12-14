package com.br.command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.common.Command;
import com.br.model.member.memberDAO;

public class memberIdCheckCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		memberDAO dao = new memberDAO();
		
		boolean result = dao.idCheck(id);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		if(result) {
			out.println("0");
		}else {
			out.println("1");
		}
		out.close();
		
		return null;
	}

}
