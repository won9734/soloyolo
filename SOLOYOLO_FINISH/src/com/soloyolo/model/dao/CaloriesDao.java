package com.soloyolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.soloyolo.model.dto.Calories;

public class CaloriesDao extends SqlMapConfig{
   String namespace = "soloyolo.Calories.";

   public int upinsert( int userno, Double upcal, String regdate) {
      int res=0;
      SqlSession session = null;
      
      Calories calories = new Calories();
      calories.setUserno(userno);
      calories.setSumcal(upcal);
      calories.setRegdate(regdate);
      
      try {
         session = getSqlSessionFactory().openSession( true );
         res = session.update( namespace + "upInsert",calories );
      } catch( Exception e ) {
         e.printStackTrace();
      } finally {
         session.close();
      }
      
      
      return res;
   }
   
   public int downinsert( int userno, Double upcal) {
      int res=0;
      SqlSession session = null;
      
      Calories calories = new Calories();
      calories.setUserno(userno);
      calories.setSumcal(upcal);
      
      try {
         session = getSqlSessionFactory().openSession( true );
         res = session.update( namespace + "downInsert",calories );
      } catch( Exception e ) {
         e.printStackTrace();
      } finally {
         session.close();
      }
      
      
      return res;
   }
   
   public int upcal( int userno, Double cal) {
      int res=0;
      SqlSession session = null;
      
      Calories calories = new Calories();
      calories.setUserno(userno);
      calories.setSumcal(cal);
      
      try {
         session = getSqlSessionFactory().openSession( true );
         res = session.update( namespace + "sumcal",calories );
      } catch( Exception e ) {
         e.printStackTrace();
      } finally {
         session.close();
      }
      
      
      return res;
   }
   public int downcal( int userno, Double cal) {
      int res=0;
      SqlSession session = null;
      
      Calories calories = new Calories();
      calories.setUserno(userno);
      calories.setSubcal(cal);
      
      try {
         session = getSqlSessionFactory().openSession( true );
         res = session.update( namespace + "subcal",calories );
      } catch( Exception e ) {
         e.printStackTrace();
      } finally {
         session.close();
      }
      
      
      return res;
   }


   public Calories selectOne(int userno, String regdate) {
      Calories calories = new Calories();
      Calories calories2 = null;
      SqlSession session = null;
      
      calories.setUserno(userno);
      calories.setRegdate(regdate);
      try {
         session = getSqlSessionFactory().openSession( true );
         calories2 = session.selectOne( namespace + "selectone", calories);
      } catch( Exception e ) {
         e.printStackTrace();
      } finally {
         session.close();
      }
      
      return calories2;
   }
   
   public List<Calories> selectAll(int userno) {
	      List<Calories> selectAll = null;
	      SqlSession session = null;
	      
	      try {
	         session = getSqlSessionFactory().openSession( true );
	         selectAll = session.selectList( namespace + "selectAll", userno);
	      } catch( Exception e ) {
	         e.printStackTrace();
	      } finally {
	         session.close();
	      }
	      
	      return selectAll;
	   }
}