package com.soloyolo.model.dto;

import java.sql.Date;

public class Community {
/*
	COMNO NUMBER PRIMARY KEY, 
	DIVNO NUMBER CHECK( DIVNO IN ( 1, 2, 3, 4 ) ) NOT NULL, 
	TITLE VARCHAR2( 2000 ) NOT NULL, 
	NICKNAME VARCHAR2( 2000 ) NOT NULL, 
	CONTENT VARCHAR2( 4000 ) NOT NULL, 
	REGDATE DATE DEFAULT SYSDATE, 
	VIEWNUM NUMBER DEFAULT 0, 
	RECOMNUM NUMBER DEFAULT 0, 
	FILEURL VARCHAR2( 2000 )
 */
	private int comno;
	private int divno;
	private String title;
	private String nickName;
	private String content;
	private Date regdate;
	private int viewNum;
	private int recomNum;
	private String fileUrl;
	
	public Community() {}
	
	public Community(int comno, int divno, String title, String nickName, String content, Date regdate, int viewNum,
			int recomNum, String fileUrl) {
		this.comno = comno;
		this.divno = divno;
		this.title = title;
		this.nickName = nickName;
		this.content = content;
		this.regdate = regdate;
		this.viewNum = viewNum;
		this.recomNum = recomNum;
		this.fileUrl = fileUrl;
	}
	
	public int getComno() {
		return comno;
	}
	public void setComno(int comno) {
		this.comno = comno;
	}
	public int getDivno() {
		return divno;
	}
	public void setDivno(int divno) {
		this.divno = divno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getViewNum() {
		return viewNum;
	}
	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}
	public int getRecomNum() {
		return recomNum;
	}
	public void setRecomNum(int recomNum) {
		this.recomNum = recomNum;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	
	@Override
	public String toString() {
		return "Community [comno=" + comno + ", divno=" + divno + ", title=" + title + ", nickName=" + nickName
				+ ", content=" + content + ", regdate=" + regdate + ", viewNum=" + viewNum + ", recomNum=" + recomNum
				+ ", fileUrl=" + fileUrl + "]";
	}
}
