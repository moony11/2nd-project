package com.br.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.book.dao.bookDAO;
import com.br.book.vo.bookCriticVO;
import com.br.book.vo.bookReviewVO;
import com.br.book.vo.bookScoreVO;
import com.br.book.vo.bookStoreVO;
import com.br.book.vo.bookVO;
import com.br.book.vo.bookWriterVO;

@WebServlet("/Bcontroller")
public class bookController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//한글 파라미터 값 받기 위한 인코딩 타입 변경
		req.setCharacterEncoding("UTF-8");
		
		resp.setContentType("text/html;charset=UTF-8");
		
		int bookid;
		
		//파라미터 값으로 타입, 아이디 값 구분
		String type = req.getParameter("type");
		if(req.getParameter("bookid") != null) {
			bookid = Integer.parseInt(req.getParameter("bookid"));
		} else {
			bookid = 0;
		}
		String category = req.getParameter("category");
		//System.out.println(">>controller bookid : " + bookid);
		
		//타입별 처리 구분
		//1. 썸네일 이미지 클릭시
		if ("onclick".equals(type)) {
			//book.jsp에 들어갈 bookVO
			List<bookVO> list = bookDAO.selectOne_book(bookid);
			int bookwriterid = Integer.parseInt(list.get(0).getB_wr_id());
			
			//book.jsp에 들어갈 bookVO(저자의 다른 도서)
			List<bookVO> list8 = bookDAO.selectOne_writerid(bookwriterid);
			
			//book.jsp에 들어갈 bookWriterVO
			List<bookWriterVO> list2 = bookDAO.selectOne_bookWriter(bookwriterid);
			
			//book.jsp에 들어갈 bookCriticVO
			List<bookCriticVO> list3 = bookDAO.selectOne_bookCritic(bookid);
			
			//book.jsp에 들어갈 bookReviewVO
			List<bookReviewVO> list4 = bookDAO.selectOne_bookReview(bookid);
			
			//book.jsp에 들어갈 bookStoreVO(판매처 정보)
			List<bookStoreVO> list7 = bookDAO.selectOne_bookStore(bookid);
			
			//System.out.println("selectone list2 : " + list2);
			//System.out.println("selectone list: " + list);
			System.out.println("selectone list3: " + list3);
			//System.out.println("selectone list4: " + list4);
			//System.out.println("selectone list7: " + list7);
			//System.out.println("selectone list8: " + list8);
			
			req.setAttribute("selectone_book", list);
			req.setAttribute("selectone_bookwriter", list2);
			req.setAttribute("selectone_bookcritic", list3);
			req.setAttribute("selectone_bookreview", list4);
			req.setAttribute("selectone_bookstore", list7);
			req.setAttribute("selectone_writerid", list8);
			//System.out.println("selectone_book : " + req.getAttribute("selectone_book"));
			
			req.getRequestDispatcher("mainView.jsp?contentPage=book/book.jsp").forward(req,resp);
		}
		
		//2. 카테고리 선택시
		if ("cate".equals(type)) {
			if ("1".equals(category)) {
				category = "소설";
			}
			if ("2".equals(category)) {
				category = "인문학";
			}
			if ("3".equals(category)) {
				category = "에세이";
			}
			if ("4".equals(category)) {
				category = "경제/경영";
			}
			if ("5".equals(category)) {
				category = "역사";
			}
			if ("6".equals(category)) {
				category = "사회과학";
			}
			if ("7".equals(category)) {
				category = "만화";
			}
			
			System.out.println("category 변경값 : " + category);
			
			//bookcategory.jsp에 들어갈 bookVO(평론가 평점 순위)
			List<bookVO> list5 = bookDAO.selectcate_catecrrank(category);
			//bookcategory.jsp에 들어갈 bookWriterVO(평론가 평점 순위 - 저자명)
			List<bookWriterVO> list5wrname = bookDAO.selectcate_catecrrank_name(category);
			
			//bookcategory.jsp에 들어갈 bookVO(일반사용자 평점 순위)
			List<bookVO> list6 = bookDAO.selectcate_cateuserrank(category);
			//bookcategory.jsp에 들어갈 bookVO(일반사용자 평점 순위 - 저자명)
			List<bookWriterVO> list6wrname = bookDAO.selectcate_cateuserrank_name(category);
			
			System.out.println("selectcate list5 : " + list5);
			System.out.println("selectcate list5wrname : " + list5wrname);
			System.out.println("selectcate list6 : " + list6);
			//System.out.println("selectcate list6wrname : " + list6wrname);
			
			
			req.setAttribute("selectcate_crrank", list5);
			req.setAttribute("selectcate_crrank_wrname", list5wrname);
			req.setAttribute("selectcate_userrank", list6);
			req.setAttribute("selectcate_userrank_wrname", list6wrname);
			
			req.getRequestDispatcher("mainView.jsp?contentPage=book/bookcategory.jsp").forward(req,resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");	
		doGet(req,resp);
	}
}
