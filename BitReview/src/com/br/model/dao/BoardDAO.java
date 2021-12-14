package com.br.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.br.model.vo.MovieBoardVO;
import com.br.model.vo.MovieReplyVO;
import com.br.mybatis.DBService;

public class BoardDAO {
	
	// 리뷰리스트 전체 조회
	public static List<MovieBoardVO> getReviewList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<MovieBoardVO> list = ss.selectList("br.review");
		ss.close();
		return list;
	}
	// 리뷰 2건 조회
	public static List<MovieBoardVO> getReview(int movie_id){
		SqlSession ss = DBService.getFactory().openSession();
		List<MovieBoardVO> list = ss.selectList("br.review", movie_id);
		ss.close();
		return list;
	}
	
	//게시글(BBS_T)의 전체 건수 조회
	public static int getTotalCount(int movie_id) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("br.totalCount", movie_id);
		ss.close();
		return totalCount;
	}
	
	//현재 페이지에 해당하는 글목록(게시글) 가져오기
	public static List<MovieBoardVO> getList(int movie_id, int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("movie_id", movie_id);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<MovieBoardVO> list = ss.selectList("br.list", map);
		ss.close();
		return list;
	}
	
	//게시글 하나 조회
	public static MovieBoardVO selectOne(int board_id) {
		SqlSession ss = DBService.getFactory().openSession();
		MovieBoardVO vo = ss.selectOne("br.mOne", board_id);
		ss.close();
		return vo;
	}	
	//게시글 조회수 증가
	public static int updateHit(int board_id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("br.hit", board_id);
		ss.close();
		return result;
	}		
	
	// 댓글 조회 
	public static List<MovieReplyVO> getCommList(int board_id) {
		SqlSession ss = DBService.getFactory().openSession();
		List<MovieReplyVO> list = ss.selectList("br.commList", board_id);
		ss.close();
		return list;
	}
	
	// 댓글 1개 조회 
	public static MovieReplyVO getCommOne(int reply_id) {
		SqlSession ss = DBService.getFactory().openSession();
		MovieReplyVO vo = ss.selectOne("br.commOne", reply_id);
		ss.close();
		return vo;
	}
	
	// 로그인
	public static int login (String login_id, String login_pw) {
		Map<String, String> map = new HashMap<>();
		map.put("login_id", login_id);
		map.put("login_pw", login_pw);
		
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("br.login", map);
		ss.close();
		
		return result;
	}
	
	// 글등록 
	public static int insert (MovieBoardVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("br.mInsert", vo);
		ss.close();
		return result;
	}
	
	// 글수정
	public static int update (MovieBoardVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("br.update", vo);
		ss.close();
		return result;
	}
	
	// 글삭제 
	public static int delete (int board_id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("br.delete", board_id);
		ss.close();
		return result;
	}
	
	// 댓글등록 
	public static int replyInsert (MovieReplyVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("br.mReplyInsert", vo);
		ss.close();
		return result;
	}
	
	// 댓글수정
	public static int replyUpdate (MovieReplyVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("br.replyUpdate", vo);
		ss.close();
		return result;
	}
	
	// 댓글삭제 
	public static int replyDelete (int reply_id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("br.replyDelete", reply_id);
		ss.close();
		return result;
	}
	
	
	
}
