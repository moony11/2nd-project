package com.br.book.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.br.mybatis.DBService;
import com.br.book.vo.bookCriticVO;
import com.br.book.vo.bookReviewVO;
import com.br.book.vo.bookScoreVO;
import com.br.book.vo.bookStoreVO;
import com.br.book.vo.bookVO;
import com.br.book.vo.bookWriterVO;

public class bookDAO {
	
	//전체 카테고리 평론가 평점 순위
	public static List<bookVO> all_cate_cr_rank(){
		SqlSession ss = DBService.getFactory().openSession();
		List<bookVO> list = ss.selectList("br.allcatecrrank");
		ss.close();
		return list;
	}
	//전체 카테고리 평론가 평점 순위 - 저자명
	public static List<bookWriterVO> all_cate_cr_rank_name() {
		SqlSession ss = DBService.getFactory().openSession();
		List<bookWriterVO> listwrname = ss.selectList("br.allcatecrrank_wr_name");
		ss.close();
		return listwrname;
	}
	
	
	//전체 카테고리 일반사용자 평점 순위
	public static List<bookVO> all_cate_u_rank(){
		SqlSession ss = DBService.getFactory().openSession();
		List<bookVO> list = ss.selectList("br.allcateuserrank");
		ss.close();
		return list;
	}
	//전체 카테고리 일반사용자 평점 순위 - 저자명
	public static List<bookWriterVO> all_cate_u_rank_name() {
		SqlSession ss = DBService.getFactory().openSession();
		List<bookWriterVO> list2wrname = ss.selectList("br.allcateuserrank_wr_name");
		ss.close();
		return list2wrname;
	}


	//선택한(클릭한) 책 정보
	public static List<bookVO> selectOne_book(int bookid){
		SqlSession ss = DBService.getFactory().openSession();
		List<bookVO> list = ss.selectList("br.selectone_book", bookid);
		ss.close();
		return list;
	}
	
	//선택한 책에 관한 저자 정보
	public static List<bookWriterVO> selectOne_bookWriter(int bookwriterid){
		SqlSession ss = DBService.getFactory().openSession();
		List<bookWriterVO> list = ss.selectList("br.selectone_bookWriter", bookwriterid);
		ss.close();
		return list;
	}
	
	//선택한 책에 관한 평론가 정보
	public static List<bookCriticVO> selectOne_bookCritic(int bookid) {
		SqlSession ss = DBService.getFactory().openSession();
		List<bookCriticVO> list = ss.selectList("br.selectone_bookCritic", bookid);
		ss.close();
		return list;
	}
	
	//선택한 책에 관한 리뷰 정보
	public static List<bookReviewVO> selectOne_bookReview(int bookid) {
		SqlSession ss = DBService.getFactory().openSession();
		List<bookReviewVO> list = ss.selectList("br.selectone_bookReview", bookid);
		ss.close();
		return list;
	}
	
	//선택한 카테고리에 관한 순위 정보
	public static List<bookVO> selectcate_catecrrank(String cate) {
		SqlSession ss = DBService.getFactory().openSession();
		List<bookVO> list = ss.selectList("br.selectcate_catecrrank", cate);
		ss.close();
		return list;
	}
	public static List<bookWriterVO> selectcate_catecrrank_name(String cate) {
		SqlSession ss = DBService.getFactory().openSession();
		List<bookWriterVO> list = ss.selectList("br.selectcate_catecrrank_wr_name", cate);
		ss.close();
		return list;
	}

	public static List<bookVO> selectcate_cateuserrank(String cate) {
		SqlSession ss = DBService.getFactory().openSession();
		List<bookVO> list = ss.selectList("br.selectcate_cateuserrank", cate);
		ss.close();
		return list;
	}
	public static List<bookWriterVO> selectcate_cateuserrank_name(String cate) {
		SqlSession ss = DBService.getFactory().openSession();
		List<bookWriterVO> list = ss.selectList("br.selectcate_cateuserrank_wr_name", cate);
		ss.close();
		return list;
	}
	//선택한 책 번호에 대한 판매처
	public static List<bookStoreVO> selectOne_bookStore(int bookid) {
		SqlSession ss = DBService.getFactory().openSession();
		List<bookStoreVO> list = ss.selectList("br.selectone_bookstore", bookid);
		ss.close();
		return list;
	}
	
	//선택한 저자에 대한 책 정보
	public static List<bookVO> selectOne_writerid(int bookwriterid) {
		SqlSession ss = DBService.getFactory().openSession();
		List<bookVO> list = ss.selectList("br.selectone_writerid", bookwriterid);
		ss.close();
		return list;
	}
	
	//==================================================================
	//정보 입력
	
	//리뷰 정보 입력
	public static int insert_review(bookReviewVO bookreview) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.insert("br.bookreview_insert", bookreview);
		ss.commit();
		ss.close();
		return result;
	}
	
	//별점 정보 입력
	public static int insert_score(bookScoreVO bookscore) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.insert("br.bookscore_insert", bookscore);
		ss.commit();
		ss.close();
		return result;
	}
	
	
	//리뷰 정보 삭제
	public static int delete_review(String reviewid) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.delete("br.bookreview_delete", reviewid);
		ss.commit();
		ss.close();
		return result;
	}
	//해당 리뷰 별점 삭제
	public static int delete_score(bookScoreVO delscore) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.delete("br.bookscore_delete", delscore);
		ss.commit();
		ss.close();
		return result;
	}

	
	
	
}
