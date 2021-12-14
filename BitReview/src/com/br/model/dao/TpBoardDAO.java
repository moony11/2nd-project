package com.br.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.br.model.vo.BoardVO;
import com.br.model.vo.ReplyVO;
import com.br.mybatis.DBService;

public class TpBoardDAO {
	
	// �? ?��?��
	public static int insert(BoardVO bvo) {	
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("br.insert", bvo);
		ss.close();
		return result;
	}
	
	// 메인?��?���? �? 목록 보여주기
	public static List<BoardVO> getList(String idx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> list = ss.selectList("br.blist", idx);
		ss.close();
		
		return list;
	}
	
	// �? 보기
	public static BoardVO selectOne(int b_id) {
		SqlSession ss = DBService.getFactory().openSession();
		BoardVO one = ss.selectOne("br.one", b_id);
		ss.close();
		
		return one;
	}
	
	// �? ?��?��
	public static int updateTP(BoardVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("br.updateTp", bvo);
		ss.close();
		
		return result;
	}
	
	// 조회?�� 증�?
	public static int updateViewCnt(int tp_boardid) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("br.viewcnt", tp_boardid);
		ss.close();
		
		return result;
	}

	public static int delete(int tp_boardid) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("br.delete", tp_boardid);
		ss.close();
		
		return result;
	} 
	
	
}
