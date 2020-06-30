package com.soloyolo.model.dto;

public class DivTable {
	private int divno;
	private String bname;
	
	public DivTable() {}
	
	public DivTable(int divno, String bname) {
		this.divno = divno;
		this.bname = bname;
	}
	
	public int getDivno() {
		return divno;
	}
	public void setDivno(int divno) {
		this.divno = divno;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
}
