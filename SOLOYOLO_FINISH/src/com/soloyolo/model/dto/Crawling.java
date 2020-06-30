package com.soloyolo.model.dto;

public class Crawling {
	private String murl;
	private String mname;
	private int mid;
	
	public Crawling() {}
	
	public Crawling(String murl, String mname, int mid) {
		this.murl = murl;
		this.mname = mname;
		this.mid = mid;
	}
	
	public String getMurl() {
		return murl;
	}
	public void setMurl(String murl) {
		this.murl = murl;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	
	@Override
	public String toString() {
		return "Crawling [murl=" + murl + ", mname=" + mname + ", mid=" + mid + "]";
	}
}
