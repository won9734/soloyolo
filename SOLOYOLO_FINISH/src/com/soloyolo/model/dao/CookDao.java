package com.soloyolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.soloyolo.model.dto.Cook;

public class CookDao extends SqlMapConfig {
	String namespace = "soloyolo.Cook.";
	
	public List<Cook> cookList() {
		List<Cook> cookList = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			cookList = session.selectList( namespace + "cookList" );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return cookList;
	}
	
	public List<Cook> cookSearch( String[] values ) {
		List<Cook> cookSearch = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			cookSearch = session.selectList( namespace + "cookSearch", values );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return cookSearch;
	}
	
	public List<Cook> cookWordSearch( String search ) {
		List<Cook> cookSearch = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			cookSearch = session.selectList( namespace + "cookWordSearch", search );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return cookSearch;
	}
	
	public Cook cookSelOne( int cno ) {
		Cook cookSelOne = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			cookSelOne = session.selectOne( namespace + "cookSelOne", cno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return cookSelOne;
	}
	
	
	
	// ==================== [ SEARCH ] ==================== //
	
	
	
	// 장르 선택
	public List<Cook> cookGenre( String[] genre ) {
		List<Cook> cookGenre = null;
		
		// 체크박스에 체크된 장르 value들을 담은 배열( genre )의 길이만큼 새로운 배열 생성
		String[] genres = new String[genre.length];
		
		// 새롭게 생성된 배열에 좌우 공백을 제거하여 장르 value값 초기화
		for( int i = 0; i < genre.length; i++ ) {
			if( genre[i] != null ) {
				for( String data : genre[i].trim().split("/") ) {
					genres[i] = data;
				}
			}
		}
		
		// 선택된 장르 출력
		for( String str : genres ) {
			System.out.println( "선택된 장르 : " + str );
		}
		
		cookGenre = cookSearch( genres );
		
		return cookGenre;
	}
	
	// 선호하는 장르
	public List<Cook> cookRecommend( String recommend ) {
		List<Cook> cookRecommend = null;
		
		String[] recomValues = recommend.split( "," );
		String[] recommends = new String[recomValues.length];
		
		// 새롭게 생성된 배열에 좌우 공백을 제거하여 선호하는 장르 value값 초기화
		for( int i = 0; i < recomValues.length; i++ ) {
			if( recomValues[i] != null ) {
				for( String data : recomValues[i].trim().split("/") ) {
					recommends[i] = data;
				}
			}
		}
		
		// 선호하는 장르 출력
		for( String str : recommends ) {
			System.out.println( "선택된 장르 : " + str );
		}
		
		cookRecommend = cookSearch( recommends );
		
		return cookRecommend;
	}
}
