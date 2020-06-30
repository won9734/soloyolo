package com.soloyolo.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.soloyolo.model.dto.DivTable;


public class DivTBDao extends SqlMapConfig {
	String namespace = "soloyolo.DivTB.";
	
	public DivTable searchDivTB( int divno ) {
		DivTable search_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			search_Res = session.selectOne( namespace + "searchDivTB", divno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return search_Res;
	}
}
