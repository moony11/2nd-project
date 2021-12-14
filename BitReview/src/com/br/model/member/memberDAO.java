package com.br.model.member;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.br.model.member.memberDTO;
import com.br.mybatis.DBService;

public class memberDAO {
	public static List<memberDTO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<memberDTO> list = ss.selectList("br.mList");
		ss.close();
		return list;
	}
	
	public void insertMember(memberDTO member) {
		SqlSession ss = DBService.getFactory().openSession();
		ss.insert("br.insertMember", member);
		ss.commit();
		ss.close();
	}
	

	
	public int loginCheck(String id, String pw) {
		int result = -1;
		String dbPw = "";
		SqlSession ss = DBService.getFactory().openSession();
		dbPw  = ss.selectOne("br.loginCheck", id);
		if(dbPw == null) {
			result = -1;
		}else {
			if(dbPw.equals(pw)) {
				ss.close();
				result = 1;
			}else {
				ss.close();
				result = 0;
			}
		}
		ss.close();
		return result;
	}
	
	public boolean idCheck(String id) {
		boolean value = false;
		SqlSession ss = DBService.getFactory().openSession();
		String checkId = ss.selectOne("br.idCheck", id);
		
		if(checkId != null) value = true;
		ss.close();
		return value;
	}
	
	public memberDTO getUserInfo(String id) {
		memberDTO member = null;
		SqlSession ss = DBService.getFactory().openSession();
		
		member = new memberDTO();
		member = ss.selectOne("br.getUserInfo", id);
		int a = member.getMember_id();
		ss.close();
		return member;
	}
	
	public int deleteMember(String id, String pw) {
		int result = -1;
		SqlSession ss = DBService.getFactory().openSession();
		String dbPw = ss.selectOne("br.loginCheck", id);
		if(dbPw.equals(pw)) {
			ss.delete("br.deleteMember", id);
			ss.commit();
			result = 1;
			ss.close();
			return result;
		}else {
			ss.close();
			result = 0;
			return result;
		}
		
		
	}
	
	public void updateMember(memberDTO member){
		SqlSession ss = DBService.getFactory().openSession();
		ss.update("br.updateMember", member);
		ss.commit();
		ss.close();
	}
	
	public void updateMember(String id){
		SqlSession ss = DBService.getFactory().openSession();
		ss.update("br.updateMember", id);
		ss.commit();
		ss.close();
	}
	
	
}
