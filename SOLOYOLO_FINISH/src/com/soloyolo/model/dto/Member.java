package com.soloyolo.model.dto;

import java.sql.Date;
//import java.util.Date;

public class Member {
	/*
	USERNO NUMBER PRIMARY KEY, 
	USERID VARCHAR2( 1000 ) UNIQUE NOT NULL, 
	USERPW VARCHAR2( 1000 ) NOT NULL, 
	NAME VARCHAR2( 1000 ) NOT NULL, 
	NICKNAME VARCHAR2( 2000 ) NOT NULL, 
	EMAIL VARCHAR2( 2000 ) NOT NULL, 
	PHONE VARCHAR2( 2000 ) NOT NULL, 
	HEIGHT NUMBER NOT NULL, 
	WEIGHT NUMBER NOT NULL, 
	POSTCODE NUMBER NOT NULL, 
	ADDR VARCHAR2( 2000 ) NOT NULL, 
	ADDR_DETAIL VARCHAR2( 2000 ) NOT NULL, 
	ADDR_X NUMBER NOT NULL, 
	ADDR_Y NUMBER NOT NULL, 
	GRADE VARCHAR2( 20 ) CHECK( GRADE IN ( 'ADMIN', 'USER' ) ) NOT NULL, 
	FAVOGENRE1 VARCHAR2( 2000 ) NOT NULL, 
	FAVOGENRE2 VARCHAR2( 2000 ) DEFAULT '', 
	FAVOGENRE3 VARCHAR2( 2000 ) DEFAULT '', 
	FAVOHT1 VARCHAR2( 2000 ) NOT NULL,
	FAVOHT2 VARCHAR2( 2000 ) DEFAULT '', 
	FAVOHT3 VARCHAR2( 2000 ) DEFAULT '', 
	SUBDATE DATE DEFAULT SYSDATE
 */
	private int userno;
	private String userid;
	private String userpw;
	private String name;
	private String nickname;
	private String email;
	private String phone;
	private double height;
	private double weight;
	private int postCode;
	private String addr;
	private String addr_Detail;
	private double addr_X;
	private double addr_Y;
	private String grade;
	private String favogenre;
//	private String favogenre1;
//	private String favogenre2;
//	private String favogenre3;
	private String favoht;
//	private String favoht1;
//	private String favoht2;
//	private String favoht3;
	private Date subdate;
	
	public Member() {}
	
	public Member(int userno, String userid, String userpw, String name, String nickname, String email, String phone, 
			double height, double weight, int postCode, String addr, String addr_Detail, double addr_X, double addr_Y, String grade, String favogenre, 
			/*String favogenre1, String favogenre2, String favogenre3, */String favoht, /*String favoht1, String favoht2, String favoht3, */Date subdate) {
		this.userno = userno;
		this.userid = userid;
		this.userpw = userpw;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.height = height;
		this.weight = weight;
		this.postCode = postCode;
		this.addr = addr;
		this.addr_Detail = addr_Detail;
		this.addr_X = addr_X;
		this.addr_Y = addr_Y;
		this.grade = grade;
		this.favogenre = favogenre;
//		this.favogenre1 = favogenre1;
//		this.favogenre2 = favogenre2;
//		this.favogenre3 = favogenre3;
		this.favoht = favoht;
//		this.favoht1 = favoht1;
//		this.favoht2 = favoht2;
//		this.favoht3 = favoht3;
		this.subdate = subdate;
	}
	
	public int getUserno() { return userno; }
	public void setUserno( int userno ) { this.userno = userno; }
	public String getUserid() { return userid; }
	public void setUserid( String userid ) { this.userid = userid; }
	public String getUserpw() { return userpw; }
	public void setUserpw( String userpw ) { this.userpw = userpw; }
	public String getName() { return name; }
	public void setName( String name ) { this.name = name; }
	public String getNickname() { return nickname; }
	public void setNickname( String nickname ) { this.nickname = nickname; }
	public String getEmail() { return email; }
	public void setEmail( String email ) { this.email = email; }
	public String getPhone() { return phone; }
	public void setPhone( String phone ) { this.phone = phone; }
	public double getHeight() { return height; }
	public void setHeight( double height ) { this.height = height; }
	public double getWeight() { return weight; }
	public void setWeight( double weight ) { this.weight = weight; }
	public int getPostCode() { return postCode; }
	public void setPostCode( int postCode ) { this.postCode = postCode; }
	public String getAddr() { return addr; }
	public void setAddr(String addr) { this.addr = addr; }
	public String getAddr_Detail() { return addr_Detail; }
	public void setAddr_Detail(String addr_Detail) { this.addr_Detail = addr_Detail; }
	public double getAddr_X() { return addr_X; }
	public void setAddr_X(double addr_X) { this.addr_X = addr_X; }
	public double getAddr_Y() { return addr_Y; }
	public void setAddr_Y(double addr_Y) { this.addr_Y = addr_Y; }
	public String getGrade() { return grade; }
	public void setGrade( String grade ) { this.grade = grade; }
	public String getFavogenre() { return favogenre; }
	public void setFavogenre( String favogenre ) { this.favogenre = favogenre; }
//	public String getFavogenre1() { return favogenre1; }
//	public void setFavogenre1( String favogenre1 ) { this.favogenre1 = favogenre1; }
//	public String getFavogenre2() { return favogenre2; }
//	public void setFavogenre2( String favogenre2 ) { this.favogenre2 = favogenre2; }
//	public String getFavogenre3() { return favogenre3; }
//	public void setFavogenre3( String favogenre3 ) { this.favogenre3 = favogenre3; }
	public String getFavoht() { return favoht; }
	public void setFavoht( String favoht ) { this.favoht = favoht; }
//	public String getFavoht1() { return favoht1; }
//	public void setFavoht1( String favoht1 ) { this.favoht1 = favoht1; }
//	public String getFavoht2() { return favoht2; }
//	public void setFavoht2( String favoht2 ) { this.favoht2 = favoht2; }
//	public String getFavoht3() { return favoht3; }
//	public void setFavoht3( String favoht3 ) { this.favoht3 = favoht3; }
	public Date getSubdate() { return subdate; }
	public void setSubdate( Date subdate ) { this.subdate = subdate; }
	
	@Override
	public String toString() {
		return  "USERNO : " + userno + "   USERID : " + userid + "   USERPW : " + userpw + "   NAME : " + name + "   NICKNAME : " + nickname 
				+ "\nEMAIL : " + email + "   PHONE : " + phone + "   HEIGHT : " + height + "cm   WEIGHT : " + weight + "kg" 
				+ "\nPOSTCODE : " + postCode + "   ADDRESS : " + addr + ", " + addr_Detail + "   addr_XY : " + addr_X + ", " + addr_Y 
				+ "\nGRADE : " + grade + "   FAVORITE_GENRE : " + favogenre + "   FAVORITE_HT : " + favoht + "   SUBDATE : " + subdate;
	}
}
