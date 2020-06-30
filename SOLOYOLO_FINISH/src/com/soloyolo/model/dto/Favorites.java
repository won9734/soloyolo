package com.soloyolo.model.dto;

import java.sql.Date;

public class Favorites {
/*
	FAVORITESNO NUMBER, 
	DIVNO NUMBER, 
	USERNO NUMBER, 
	TITLE VARCHAR( 1000 ), 
	IMG VARCHAR( 1000 ), 
	FAVOADDR VARCHAR( 2000 ), 
	REGDATE DATE DEFAULT SYSDATE
 */
	private int favono;
	private int divno;
	private int userno;
	private String title;
	private String img;
	private String favoAddr;
	private Date regdate;
	
	public Favorites() {}
	
	public Favorites( int favono, int divno, int userno, String title, String img, String favoAddr, Date regdate ) {
		this.favono = favono;
		this.divno = divno;
		this.userno = userno;
		this.title = title;
		this.img = img;
		this.favoAddr = favoAddr;
		this.regdate = regdate;
	}
	
	public int getFavono() {
		return favono;
	}
	public void setFavono(int favono) {
		this.favono = favono;
	}
	public int getDivno() {
		return divno;
	}
	public void setDivno(int divno) {
		this.divno = divno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getFavoAddr() {
		return favoAddr;
	}
	public void setFavoAddr(String favoAddr) {
		this.favoAddr = favoAddr;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "Favorites [favono=" + favono + ", divno=" + divno + ", userno=" + userno + ", title=" + title 
				+ ", img=" + img + ", favoAddr=" + favoAddr + ", regdate=" + regdate + "]";
	}
}
