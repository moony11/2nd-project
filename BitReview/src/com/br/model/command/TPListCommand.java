package com.br.model.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.TvProgramDAO;
import com.br.model.vo.TvProgramVO;


public class TPListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<TvProgramVO> tplist = TvProgramDAO.getList();
		
		request.setAttribute("tplist", tplist);
		System.out.println(tplist + "?��거인�?");
		
		
		return "tvProgram/TPList.jsp";
	}
	

}
