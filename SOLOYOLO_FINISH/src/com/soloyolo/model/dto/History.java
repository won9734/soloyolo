package com.soloyolo.model.dto;

public class History {
/*
	HISNO NUMBER PRIMARY KEY, 
	DIVNO NUMBER, 
	USERNO NUMBER, 
	TITLE VARCHAR( 1000 ), 
	IMG VARCHAR( 1000 ), 
	HISADDR VARCHAR( 2000 ), 
	REGDATE VARCHAR2( 20 )
 */
	private int hisno;
	private int divno;
	private int userno;
	private String title;
	private String img;
	private String hisAddr;
	private String regdate;
	
	public History() {}
	
	public History( int hisno, int divno, int userno, String title, String img, String hisAddr, String regdate ) {
		this.hisno = hisno;
		this.divno = divno;
		this.userno = userno;
		this.title = title;
		this.img = img;
		this.hisAddr = hisAddr;
		this.regdate = regdate;
	}
	
	public int getHisno() {
		return hisno;
	}
	public void setHisno(int hisno) {
		this.hisno = hisno;
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
	public String getHisAddr() {
		return hisAddr;
	}
	public void setHisAddr(String hisAddr) {
		this.hisAddr = hisAddr;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "History [hisno=" + hisno + ", divno=" + divno + ", userno=" + userno + ", title=" + title + ", img="
				+ img + ", hisAddr=" + hisAddr + ", regdate=" + regdate + "]";
	}
}
