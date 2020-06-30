package com.soloyolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.soloyolo.model.dto.HomeTraining;

public class HomeTrainingDao extends SqlMapConfig {
	String namespace = "soloyolo.HT.";
	
	public List<HomeTraining> HTList() {
		List<HomeTraining> htList = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			htList = session.selectList( namespace + "HTList" );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return htList;
	}
	
	public List<HomeTraining> htSearch( String[] values ) {
		List<HomeTraining> htSearch = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			htSearch = session.selectList( namespace + "htSearch", values );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return htSearch;
	}
	
	public List<HomeTraining> htWordSearch( String search ) {
		List<HomeTraining> htSearch = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			htSearch = session.selectList( namespace + "htWordSearch", search );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return htSearch;
	}
	
	public HomeTraining htSelOne( int htno ) {
		HomeTraining htSelOne = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			htSelOne = session.selectOne( namespace + "htSelOne", htno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return htSelOne;
	}
	
	
	
	// ==================== [ SEARCH ] ==================== //
	
	
	
	// 장르 선택
	public List<HomeTraining> htGenre( String[] genre ) {
		List<HomeTraining> htGenre = null;
		
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
		
		htGenre = htSearch( genres );
		
		return htGenre;
	}
	
	// 선호하는 장르
	public List<HomeTraining> htRecommend( String recommend ) {
		List<HomeTraining> htRecommend = null;
		
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
		
		htRecommend = htSearch( recommends );
		
		return htRecommend;
	}
}
