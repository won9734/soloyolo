package com.soloyolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.soloyolo.model.dto.MDComment;

public class MDCommentDao extends SqlMapConfig {
	String namespace = "soloyolo.MDComment.";
	
	public List<MDComment> mdcomList( MDComment mdcom ) {
		List<MDComment> mdcomList = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			mdcomList = session.selectList( namespace + "mdcomList", mdcom );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return mdcomList;
	}
	
	public int mdcomInsert( MDComment mdcom ) {
		int ins_Res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			ins_Res = session.insert( namespace + "mdcomInsert", mdcom );
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
