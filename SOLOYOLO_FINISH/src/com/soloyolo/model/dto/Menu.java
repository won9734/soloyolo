package com.soloyolo.model.dto;

public class Menu {
/*
	-- 가게 번호( SHOPSEQ )
	SNO NUMBER NOT NULL, 
	-- 메뉴 번호( MENUSEQ )
	MNO NUMBER, 
	-- 메뉴 이름
	NAME VARCHAR2( 1000 ) NOT NULL, 
	-- 메뉴 가격
	PRICE NUMBER DEFAULT 0 NOT NULL, 
	-- 메뉴 칼로리
	CAL NUMBER DEFAULT 0 NOT NULL, 
	-- 메뉴 사진들
	MENUIMGS VARCHAR2( 3000 ) NOT NULL
 */
	
	private int sno;
	private int mno;
	private String name;
	private int price;
	private int cal;
	private String menuImgs;
	
	public Menu() {}
	
	public Menu( int sno, int mno, String name, int price, int cal, String menuImgs ) {
		this.sno = sno;
		this.mno = mno;
		this.name = name;
		this.price = price;
		this.cal = cal;
		this.menuImgs = menuImgs;
	}
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCal() {
		return cal;
	}
	public void setCal(int cal) {
		this.cal = cal;
	}
	public String getMenuImgs() {
		return menuImgs;
	}
	public void setMenuImgs(String menuImgs) {
		this.menuImgs = menuImgs;
	}
	
	@Override
	public String toString() {
		return "Menu [sno=" + sno + ", mno=" + mno + ", name=" + name + ", price=" + price + ", cal=" + cal
				+ ", menuImgs=" + menuImgs + "]";
	}
}
