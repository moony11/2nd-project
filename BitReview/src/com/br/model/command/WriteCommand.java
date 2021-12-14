package com.br.model.command;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.model.dao.TpBoardDAO;
import com.br.model.member.memberDAO;
import com.br.model.member.memberDTO;
import com.br.model.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   		memberDTO temp = new memberDTO();
   		memberDAO dao = new memberDAO();
   		String id = request.getSession().getAttribute("sessionID").toString();
		System.out.println(id);
		
   		temp = dao.getUserInfo(id);
		//1. 파라미터 값 가져오기
		ServletContext context= request.getSession().getServletContext();
		String f_path = context.getRealPath("/resources/upload");
		System.out.println(f_path +"경로값");
		
		MultipartRequest mr = new MultipartRequest(request, f_path, 10 * 1024 * 1024, "UTF-8");
		String nickName = temp.getNickName();
		System.out.println(nickName);
		String f_name = mr.getOriginalFileName("tpfile");
		String writer = nickName;
		String title = mr.getParameter("title");
		String b_content = mr.getParameter("b_content");
		System.out.println("ddddddddddddd");
		int tp_id = Integer.parseInt(mr.getParameter("tpid"));
		System.out.println("222 dd " + tp_id);
		
		String idx = request.getParameter("idx");
		
		
		if (idx == null) {
			idx = "0";
		}
		
		
		
		
		int mId = temp.getMember_id();
		
		//2. 가져온 값 vo에 저장"
		memberDAO mDao = new memberDAO();
		
		BoardVO bvo = new BoardVO();
		bvo.setTitle(title);
		bvo.setB_content(b_content);
		bvo.setWriter(writer);
		bvo.setTp_id(tp_id);
		bvo.setF_name(f_name);
		bvo.setF_path(f_path);
		bvo.setMember_id(mId);
		TpBoardDAO.insert(bvo);
		
		System.out.println(bvo);
		
		
		//3. DB연결하고 데이터 가져오기
		List<BoardVO> list = TpBoardDAO.getList(idx);
		
		
		//4. 응답페이지(TPmain.jsp)로 데이터 전달
		request.setAttribute("list", list);
		
		//5. 응답페이지(TPmain.jsp)로 화면 이동(전환)
		//return "tvProgram/TPmain.jsp";
		return "mainView.jsp?contentPage=tvProgram/TPmain.jsp";
	}

}
