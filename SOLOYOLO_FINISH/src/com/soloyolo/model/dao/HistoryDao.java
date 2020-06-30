package com.soloyolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.soloyolo.model.dto.History;

public class HistoryDao extends SqlMapConfig {
	String namespace = "soloyolo.History.";
	
	public List<History> hisSearch( int userno ) {
		List<History> search_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			search_Res = session.selectList( namespace + "hisSearch", userno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return search_Res;
	}
	
	public int insertHis( History his ) {
		int ins_Res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			ins_Res = session.insert( namespace + "insertHis", his );
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
	
	public History hisDuplicate( History his ) {
		History search_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			search_Res = session.selectOne( namespace + "hisDuplicate", his );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return search_Res;
	}
	
	
//	public int hisDelete( History his ) {
//		int del_Res = 0;
//		SqlSession session = null;
//		
//		try {
//			session = getSqlSessionFactory().openSession( true );
//			del_Res = session.selectOne( namespace + "hisDelete", his );
//		} catch( Exception e ) {
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//		
//		return del_Res;
//	}
	
	
	public int hisUpdate( History his ) {
		int del_Res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			del_Res = session.update( namespace + "hisUpdate", his );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return del_Res;
	}
}
