package com.br.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.common.Command;

public class memberMoveDeleteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		return "mainView.jsp?contentPage=member/deleteView.jsp";
	}

}
