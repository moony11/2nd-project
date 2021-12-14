package com.br.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.TvProgramDAO;
import com.br.model.vo.TvProgramVO;

public class TPOneviewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		int tp_id = Integer.parseInt(request.getParameter("tp_id"));		

		TvProgramVO tpone = TvProgramDAO.getOneList(tp_id);
		System.out.println("어디까지왔니444");
		request.setAttribute("tpone", tpone);
		
		System.out.println(tpone);
		
		
		return "tvProgram/TPoneview.jsp";
	}

}
