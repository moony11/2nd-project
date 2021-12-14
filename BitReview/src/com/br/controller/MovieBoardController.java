package com.br.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.command.Paging;
import com.br.model.dao.BoardDAO;
import com.br.model.dao.MovieDAO;
import com.br.model.vo.MovieBoardVO;
import com.br.model.vo.MovieVO;

@WebServlet("/movieBoard")
public class MovieBoardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		int movieId = Integer.parseInt(type);
		System.out.println(type);
		Paging p = new Paging();
		//1. 전체 게시물의 수량 구하기	
		p.setTotalRecord(BoardDAO.getTotalCount(movieId)); 
		p.setTotalPage();
		System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
		
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
	
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("> cPage : " + cPage);
		System.out.println("> paging nowPage : " + p.getNowPage());
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage()); //현재페이지번호 * 페이지당게시글 수
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		//(선택적) 3-1. 끝 번호가 데이터 건수보다 많아지면 데이터 건수와 동일한 번호로 설정
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		System.out.println(">> 시작번호(begin) : " + p.getBegin());
		System.out.println(">> 끝번호(end) : " + p.getEnd());
		
		//---- 블록(block) 계산하기 ----------------
		//4. 블록의 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		//시작페이지 구하기
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		//4-1. 끝페이지(endPage)가 전체페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println(">> beginPage : " + p.getBeginPage());
		System.out.println(">> endPage : " + p.getEndPage());
		//====================================
		//현재페이지 기준으로 DB데이터(게시글) 가져오기
		//시작글번호, 끝 글번호로 
	
		List<MovieBoardVO> list = BoardDAO.getList(movieId, p.getBegin(), p.getEnd());
		MovieVO mvo = MovieDAO.getMovieInfo(movieId);
		System.out.println("> 현재페이지 글목록(list) : " + list);
		
		
		
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("pvo", p);
		request.setAttribute("mvo", mvo);
		request.getRequestDispatcher("mainView.jsp?contentPage=movie/movieBoard.jsp").forward(request, response);
		// mainView.jsp?contentPage=movie/movieBoard.jsp
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	
	}
	
	
}
