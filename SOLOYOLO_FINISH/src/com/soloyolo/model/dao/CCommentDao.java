package com.soloyolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.soloyolo.model.dto.CComment;

public class CCommentDao extends SqlMapConfig {
	String namespace = "soloyolo.CComment.";
	
	public List<CComment> ccomList( CComment ccom ) {
		List<CComment> ccomList = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			ccomList = session.selectList( namespace + "ccomList", ccom );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return ccomList;
	}
	
	public int ccomInsert( CComment ccom ) {
		int ins_Res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			ins_Res = session.insert( namespace + "ccomInsert", ccom );
			if( ins_Res > 0 ) {
				session.commit();
			}
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return ins_Res;
	}
}
