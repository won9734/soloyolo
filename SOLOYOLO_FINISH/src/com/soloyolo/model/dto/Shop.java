package com.soloyolo.model.dto;

public class Shop {
/*
	-- 가게 번호( SHOPSEQ )
	SNO NUMBER PRIMARY KEY, 
	-- 가게 이름
	NAME VARCHAR2( 1000 ) NOT NULL, 
	-- 가게 주소
	ADDR VARCHAR2( 2000 ) NOT NULL, 
	-- 가게 주소( X좌표 )
	SHOP_X NUMBER NOT NULL, 
	-- 가게 주소( Y좌표 )
	SHOP_Y NUMBER NOT NULL, 
	-- 가게 소개
	INTRO VARCHAR2( 2000 ) NOT NULL, 
	-- 판매 음식 분류
	FTYPE VARCHAR2( 100 ) NOT NULL, 
	-- 가게 평점
	SCORE NUMBER DEFAULT 0, 
	-- 가게 전화번호
	PHONE VARCHAR2( 1000 ), 
	-- 가게 영업시간
	STIME VARCHAR2( 1000 ) NOT NULL, 
	-- 가게 사진( 1장 )
	SHOPIMG VARCHAR2( 1000 ) NOT NULL
 */
	
	private int sno;
	private String name;
	private String addr;
	private Double shop_X;
	private Double shop_Y;
	private String intro;
	private String ftype;
	private Double score;
	private String phone;
	private String stime;
	private String shopImg;
	
	public Shop() {}
	
	public Shop( int sno, String name, String addr, Double shop_X, Double shop_Y, String intro, 
					String ftype, Double score, String phone, String stime, String shopImg ) {
		this.sno = sno;
		this.name = name;
		this.addr = addr;
		this.shop_X = shop_X;
		this.shop_Y = shop_Y;
		this.intro = intro;
		this.ftype = ftype;
		this.score = score;
		this.phone = phone;
		this.stime = stime;
		this.shopImg = shopImg;
	}
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Double getShop_X() {
		return shop_X;
	}
	public void setShop_X(Double shop_X) {
		this.shop_X = shop_X;
	}
	public Double getShop_Y() {
		return shop_Y;
	}
	public void setShop_Y(Double shop_Y) {
		this.shop_Y = shop_Y;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getShopImg() {
		return shopImg;
	}
	public void setShopImg(String shopImg) {
		this.shopImg = shopImg;
	}
	
	@Override
	public String toString() {
		return "Shop [sno=" + sno + ", name=" + name + ", addr=" + addr + ", shop_X=" + shop_X + ", shop_Y=" + shop_Y
				+ ", intro=" + intro + ", ftype=" + ftype + ", score=" + score + ", phone=" + phone + ", stime=" + stime
				+ ", shopImg=" + shopImg + "]";
	}
}
