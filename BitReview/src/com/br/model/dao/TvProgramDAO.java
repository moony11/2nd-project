package com.br.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.br.model.vo.TvProgramVO;
import com.br.mybatis.DBService;

public class TvProgramDAO {

	public static List<TvProgramVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<TvProgramVO> list = ss.selectList("br.tplist");
		
		ss.close();
		
		return list;
			
	}
	

	
	public static TvProgramVO getOneList(int tp_id) {
		System.out.println("어디까지왔니55");
		SqlSession ss = DBService.getFactory().openSession();
		System.out.println("어디까지왔니666");
		TvProgramVO tpone = ss.selectOne("br.tpone", tp_id);
		System.out.println("어디까지왔니77");
		ss.close();
		
		return tpone;
	}	
}
