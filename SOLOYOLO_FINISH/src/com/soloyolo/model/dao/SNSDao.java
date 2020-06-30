package com.soloyolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.soloyolo.model.dto.SNS;

public class SNSDao extends SqlMapConfig {
	String namespace = "soloyolo.SNS.";
	
	public List<SNS> SNSSearch( String nickname ) {
		List<SNS> sns_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			sns_Res = session.selectList( namespace + "SNSSearch", nickname );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return sns_Res;
	}
	
	public int insertSNS( SNS sns ) {
		SqlSession session = null;
		int ins_Res = 0;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			ins_Res = session.update( namespace + "insertSNS", sns );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return ins_Res;
	}
}
