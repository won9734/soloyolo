package com.soloyolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.soloyolo.model.dto.Favorites;


public class FavoritesDao extends SqlMapConfig {
	String namespace = "soloyolo.Favorites.";
	
	public List<Favorites> favoSearch( int userno ) {
		List<Favorites> search_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			search_Res = session.selectList( namespace + "FavoSearch", userno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return search_Res;
	}
	
	public Favorites FavoDuplicate( Favorites favo ) {
		Favorites search_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			search_Res = session.selectOne( namespace + "FavoDuplicate", favo );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return search_Res;
	}
	
	public int insertFavo( Favorites favo ) {
		int ins_Res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			ins_Res = session.insert( namespace + "insertFavo", favo );
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
	
	public int deleteFavo( Favorites favo ) {
		int ins_Res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			ins_Res = session.insert( namespace + "deleteFavo", favo );
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
