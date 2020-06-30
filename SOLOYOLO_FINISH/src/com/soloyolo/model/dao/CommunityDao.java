package com.soloyolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.soloyolo.model.dto.Community;


public class CommunityDao extends SqlMapConfig {
	String namespace = "soloyolo.Community.";
	
	// Community게시판 List 출력
	public List<Community> communityList() {
		List<Community> selAll_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			selAll_Res = session.selectList( namespace + "communityList");
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return selAll_Res;
	}
	
	// Community게시판 comno로 selectOne해서 Detail 출력
	public Community selectOne( int comno ) {
		SqlSession session = null;
		Community sel_Res = new Community();
		
		try {
			session = getSqlSessionFactory().openSession( true );
			sel_Res = session.selectOne( namespace + "selectOne", comno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return sel_Res;
	}
	
	// Community게시판 comno로 viewNum 업데이트
	public int viewUpdate( int comno ) {
		SqlSession session = null;
		int viewup_Res = 0;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			viewup_Res = session.update( namespace + "viewUpdate", comno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return viewup_Res;
	}
	
	// Community게시판 게시글 등록
	public int insertBoard( Community com ) {
		SqlSession session = null;
		int ins_Res = 0;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			ins_Res = session.update( namespace + "insertBoard", com );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return ins_Res;
	}
	
	// 첨부파일 없이 게시글 등록
	public int insertBoard2( Community com ) {
		SqlSession session = null;
		int ins_Res = 0;

		try {
			session = getSqlSessionFactory().openSession( true );
			ins_Res = session.update( namespace + "insertBoard2", com );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return ins_Res;
	}
	
	// Community게시판 게시글 수정
	public int updateBoard( Community com ) {
		SqlSession session = null;
		int up_Res = 0;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			up_Res = session.update( namespace + "updateBoard", com );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return up_Res;
	}
	
	// Community게시판 comno로 recomNum 업데이트
	public int recomUpdate( int comno ) {
		SqlSession session = null;
		int recomup_Res = 0;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			recomup_Res = session.update( namespace + "recomUpdate", comno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return recomup_Res;
	}
	
	// Community게시판 게시글 삭제
	public int deleteBoard( int comno ) {
		SqlSession session = null;
		int del_Res = 0;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			del_Res = session.update( namespace + "deleteBoard", comno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return del_Res;
	}
}
