package com.soloyolo.model.dto;

import java.sql.Date;

public class CComment {
/*
	COMNO NUMBER PRIMARY KEY,
	USERNO NUMBER NOT NULL, 
	DIVNO NUMBER NOT NULL, 
	BOARDNO NUMBER NOT NULL, 
	NICKNAME VARCHAR2( 2000 ), 
	CONTENT VARCHAR2( 4000 ), 
	REGDATE DATE DEFAULT SYSDATE
 */
	
	private int comno;
	private int userno;
	private int divno;
	private int boardno;
	private String nickName;
	private String content;
	private Date regdate;
	
	public CComment() {}
	
	public CComment( int comno, int userno, int divno, int boardno, String nickName, String content, Date regdate ) {
		this.comno = comno;
		this.userno = userno;
		this.divno = divno;
		this.boardno = boardno;
		this.nickName = nickName;
		this.content = content;
		this.regdate = regdate;
	}
	
	public int getComno() {
		return comno;
	}
	public void setComno(int comno) {
		this.comno = comno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getDivno() {
		return divno;
	}
	public void setDivno(int divno) {
		this.divno = divno;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "CComment [comno=" + comno + ", userno=" + userno + ", divno=" + divno + ", boardno=" + boardno
				+ ", nickName=" + nickName + ", content=" + content + ", regdate=" + regdate + "]";
	}
}
