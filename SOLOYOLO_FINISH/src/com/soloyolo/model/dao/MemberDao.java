package com.soloyolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.soloyolo.model.dto.Member;

public class MemberDao extends SqlMapConfig {
	private String namespace = "soloyolo.Member.";
	
	public List<Member> memberList() {
		List<Member> selAll_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			selAll_Res = session.selectList( namespace + "memberList" );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return selAll_Res;
	}
	
	public Member memberOne( int userno ) {
		Member selOne_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			selOne_Res = session.selectOne( namespace + "memberOne", userno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return selOne_Res;
	}
	
	public int insertMember( Member mem ) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert( namespace + "insertMember", mem );
			
			if(res > 0) {
				session.commit();
			}
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}
	
	public Member insertSNS( Member mem ) {
		int res = 0;
		SqlSession session = null;
		Member dto_res = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert( namespace + "insertSNS", mem );
			String userid = mem.getUserid();
			
			if(res > 0) {
				dto_res = session.selectOne( namespace + "login", userid );
				System.out.println("dto_res : " + dto_res);

				session.commit();
			}
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto_res;
	}
	
	public int updateMember( Member mem ) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert( namespace + "updateMember", mem );
			
			if(res > 0) {
				session.commit();
			}
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}
	
	public Member login( String userid ) {
		Member login_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			login_Res = session.selectOne( namespace + "login", userid );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return login_Res;
	}
	
	public Member idChk( String userid ) {
		Member idChk_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			idChk_Res = session.selectOne( namespace + "idChk", userid );
			System.out.println( "Dao_idChk : " + idChk_Res );
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return idChk_Res;
	}
	
	public Member idFind( Member mem ) {
		Member idFound = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			idFound = session.selectOne( namespace + "idFind", mem );
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return idFound;
	}
	
	public Member idFindSNS( String userid ) {
		Member idFound = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			idFound = session.selectOne( namespace + "idFindSNS", userid );
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return idFound;
	}
	
	public Member pwFind( Member mem ) {
		Member pwFound = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			pwFound = session.selectOne( namespace + "pwFind", mem );
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return pwFound;
	}
	
	public int deleteMember( int userno ) {
		int del_Res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			del_Res = session.insert( namespace + "deleteMember", userno );
			
			if(del_Res > 0) {
				session.commit();
			}
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return del_Res;
	}
}
