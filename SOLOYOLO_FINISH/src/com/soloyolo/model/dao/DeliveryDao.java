package com.soloyolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.soloyolo.model.dto.Menu;
import com.soloyolo.model.dto.Shop;

public class DeliveryDao extends SqlMapConfig {
	String namespace = "soloyolo.Delivery.";
	
	public List<Shop> shopList() {
		List<Shop> shopList = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			shopList = session.selectList( namespace + "shopList" );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return shopList;
	}
	
	public Shop shopOne( int sno ) {
		Shop shopOne = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			shopOne = session.selectOne( namespace + "shopOne", sno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return shopOne;
	}
	
	public List<Menu> menuList( int sno ) {
		List<Menu> menuList = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			menuList = session.selectList( namespace + "menuList", sno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return menuList;		
	}
}
