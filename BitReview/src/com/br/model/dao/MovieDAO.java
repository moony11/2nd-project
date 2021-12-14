package com.br.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.br.model.vo.MovieScoreVO;
import com.br.model.vo.MovieVO;
import com.br.mybatis.DBService;


public class MovieDAO {
	
	// 영화 평점순 리스트 호출
	public static List<MovieVO> getGradeList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<MovieVO> list = ss.selectList("br.gradeList");
		ss.close();
		return list;
	}
	
	// 위시순 리스트
	public static List<MovieVO> getWishList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<MovieVO> list = ss.selectList("br.wishList");
		ss.close();
		return list;
	}
	
	// 장르별 리스트
	public static List<MovieVO> getGenreList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<MovieVO> list = ss.selectList("br.genreList");
		ss.close();
		return list;
	}
	
	// 영화 전체 정보 보기
	public static List<MovieVO> getSelectList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<MovieVO> list = ss.selectList("br.selectList");
		ss.close();
		return list;
	}
	
	// 영화정보보기 
	public static MovieVO getMovieInfo(int movie_id){
		SqlSession ss = DBService.getFactory().openSession();
		MovieVO vo = ss.selectOne("br.movieInfo", movie_id);
		ss.close();
		return vo;
	}
	
	// 보고싶어요 증가 
	public static int getWish(int member_id,int movie_id){
		Map<String, Integer> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("movie_id", movie_id);
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("br.wish", map);
		ss.close();
		return result;
	}	
	
	// 위시, 평점 조회
	public static int getScoreOne(int movie_id){
		SqlSession ss = DBService.getFactory().openSession();
		int wish = ss.selectOne("br.scoreOne", movie_id);
		ss.close();
		return wish;
	}
}
