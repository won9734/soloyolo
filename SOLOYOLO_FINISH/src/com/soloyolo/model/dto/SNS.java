package com.soloyolo.model.dto;

import java.sql.Date;

public class SNS {
/*
	-- 게시글 번호( SNSSEQ )
	SNSNO NUMBER PRIMARY KEY, 
	-- 게시글 작성자
	NICKNAME VARCHAR2( 2000 ) NOT NULL,
	-- 게시글 내용
	CONTENT VARCHAR2( 4000 ) NOT NULL,
	-- 게시글 작성일
	REGDATE DATE DEFAULT SYSDATE,
	-- 게시글 첨부파일 위치
	FILEURL VARCHAR2( 2000 )
 */
	
	private int snsno;
	private String nickname;
	private String content;
	private Date regdate;
	private String fileurl;
	
	public SNS() {}
	
	public SNS( int snsno, String nickname, String content, Date regdate, String fileurl ) {
		this.snsno = snsno;
		this.nickname = nickname;
		this.content = content;
		this.regdate = regdate;
		this.fileurl = fileurl;
	}
	
	public int getSnsno() {
		return snsno;
	}
	public void setSnsno(int snsno) {
		this.snsno = snsno;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	
	@Override
	public String toString() {
		return "SNS [snsno=" + snsno + ", nickname=" + nickname + ", content=" + content + ", regdate=" + regdate
				+ ", fileurl=" + fileurl + "]";
	}
}
