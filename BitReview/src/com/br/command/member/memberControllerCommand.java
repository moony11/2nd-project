package com.br.command.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.common.Command;


/**
 * Servlet implementation class memberControllerCommand
 */
@WebServlet("/memberController")
public class memberControllerCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doGet()");
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		
		Command command = null;
		if ("main".equals(type)) {
			command = new memberMainCommand();
		}else if ("login".equals(type)) {
			command = new memberLoginCommand();
		}else if ("join".equals(type)) {
			command = new memberJoinCommand();
		}else if ("logout".equals(type)) {
			command = new memberLogoutCommand();
		}else if ("idCheck".equals(type)) {
			System.out.println("전체 컨트롤러에서 아이디체크 발동");
			command = new memberIdCheckCommand();
		}else if("memberInfo".equals(type)){
			command = new memberInfoCommand();
		}else if("memberDelete".equals(type)){
			command = new memberDeleteCommand();
		}else if("memberMoveDelete".equals(type)){
			command = new memberMoveDeleteCommand();
		}else if("memberMoveModify".equals(type)){
			command = new memberMoveModifyCommand();
		}else if("memberModify".equals(type)){
			command = new memberModifyCommand();
		}
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doPost()----------------");
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
