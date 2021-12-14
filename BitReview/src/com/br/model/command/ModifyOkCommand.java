package com.br.model.command;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.model.dao.TpBoardDAO;
import com.br.model.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;

public class ModifyOkCommand implements Command {

   @Override
   public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int tp_boardid = Integer.parseInt(request.getParameter("tp_boardid"));
      int tp_id = Integer.parseInt(request.getParameter("tpid"));
   
      // 1. 파라미터 값 가져오기

      ServletContext context = request.getSession().getServletContext();
      String f_path = context.getRealPath("/resources/upload");
      
      MultipartRequest mr = new MultipartRequest(request, f_path, 10 * 1024 * 1024, "UTF-8");
      
      String f_name = mr.getOriginalFileName("tpfile");
      
      String title = mr.getParameter("title");
      String b_content = mr.getParameter("b_content");
      
      // 2. 가져온 값 vo에 저장"
      
      BoardVO bvo = new BoardVO();
      bvo.setTp_boardid(tp_boardid);
      bvo.setTitle(title);
      bvo.setB_content(b_content);
      bvo.setTp_id(tp_id);
      bvo.setF_name(f_name);
      bvo.setF_path(f_path);
      System.out.println("어디까지오니5555");
      System.out.println(bvo);
      TpBoardDAO.updateTP(bvo);
      System.out.println("어디까지오니66666");
      BoardVO one = TpBoardDAO.selectOne(tp_boardid);
      System.out.println("어디까지오니5555556565656565656");
      request.setAttribute("one", one);
      System.out.println("어디까지오니");
      return "mainView.jsp?contentPage=tvProgram/TPview.jsp";
   }

}