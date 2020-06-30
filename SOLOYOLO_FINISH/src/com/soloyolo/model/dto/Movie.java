package com.soloyolo.model.dto;

public class Movie {
/*
	MNO NUMBER PRIMARY KEY, 
	MNAME VARCHAR2( 1000 ) NOT NULL, 
	GENRE VARCHAR2( 1000 ) NOT NULL, 
	NATION VARCHAR2( 1000 ) NOT NULL, 
	RELEASE VARCHAR2( 1000 ) NOT NULL, 
	MGRADE VARCHAR2( 1000 ) NOT NULL, 
	MSCORE NUMBER NOT NULL, 
	MINTRO VARCHAR2( 4000 ) NOT NULL, 
	MTIME VARCHAR2( 1000 ) NOT NULL, 
	MURL VARCHAR2( 1000 ) NOT NULL, 
	DIRECTOR VARCHAR2( 1000 ) NOT NULL, 
	ACTOR VARCHAR2( 1000 ), 
	MOVIEID NUMBER NOT NULL
 */
	private int mno;
	private String mname;
	private String genre;
	private String nation;
	private String release;
	private String mgrade;
	private double mscore;
	private String mintro;
	private String mtime;
	private String murl;
	private String director;
	private String actor;
	private int mid;
	
	public Movie() {}
	
	public Movie( int mno, String mname, String genre, String nation, String release, String mgrade, double mscore,
					String mintro, String mtime, String murl, String director, String actor, int mid ) {
		this.mno = mno;
		this.mname = mname;
		this.genre = genre;
		this.nation = nation;
		this.release = release;
		this.mgrade = mgrade;
		this.mscore = mscore;
		this.mintro = mintro;
		this.mtime = mtime;
		this.murl = murl;
		this.director = director;
		this.actor = actor;
		this.mid = mid;
	}
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getRelease() {
		return release;
	}
	public void setRelease(String release) {
		this.release = release;
	}
	public String getMgrade() {
		return mgrade;
	}
	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}
	public double getMscore() {
		return mscore;
	}
	public void setMscore(double mscore) {
		this.mscore = mscore;
	}
	public String getMintro() {
		return mintro;
	}
	public void setMintro(String mintro) {
		this.mintro = mintro;
	}
	public String getMtime() {
		return mtime;
	}
	public void setMtime(String mtime) {
		this.mtime = mtime;
	}
	public String getMurl() {
		return murl;
	}
	public void setMurl(String murl) {
		this.murl = murl;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	
	@Override
	public String toString() {
		return "Movie [mno=" + mno + ", mname=" + mname + ", genre=" + genre + ", nation=" + nation + ", release="
				+ release + ", mgrade=" + mgrade + ", mscore=" + mscore + ", mintro=" + mintro + ", mtime=" + mtime
				+ ", murl=" + murl + ", director=" + director + ", actor=" + actor + ", mid=" + mid + "]";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((actor == null) ? 0 : actor.hashCode());
		result = prime * result + ((director == null) ? 0 : director.hashCode());
		result = prime * result + ((genre == null) ? 0 : genre.hashCode());
		result = prime * result + ((mgrade == null) ? 0 : mgrade.hashCode());
		result = prime * result + mid;
		result = prime * result + ((mintro == null) ? 0 : mintro.hashCode());
		result = prime * result + ((mname == null) ? 0 : mname.hashCode());
		result = prime * result + mno;
		long temp;
		temp = Double.doubleToLongBits(mscore);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((mtime == null) ? 0 : mtime.hashCode());
		result = prime * result + ((murl == null) ? 0 : murl.hashCode());
		result = prime * result + ((nation == null) ? 0 : nation.hashCode());
		result = prime * result + ((release == null) ? 0 : release.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Movie other = (Movie) obj;
		if (actor == null) {
			if (other.actor != null)
				return false;
		} else if (!actor.equals(other.actor))
			return false;
		if (director == null) {
			if (other.director != null)
				return false;
		} else if (!director.equals(other.director))
			return false;
		if (genre == null) {
			if (other.genre != null)
				return false;
		} else if (!genre.equals(other.genre))
			return false;
		if (mgrade == null) {
			if (other.mgrade != null)
				return false;
		} else if (!mgrade.equals(other.mgrade))
			return false;
		if (mid != other.mid)
			return false;
		if (mintro == null) {
			if (other.mintro != null)
				return false;
		} else if (!mintro.equals(other.mintro))
			return false;
		if (mname == null) {
			if (other.mname != null)
				return false;
		} else if (!mname.equals(other.mname))
			return false;
		if (mno != other.mno)
			return false;
		if (Double.doubleToLongBits(mscore) != Double.doubleToLongBits(other.mscore))
			return false;
		if (mtime == null) {
			if (other.mtime != null)
				return false;
		} else if (!mtime.equals(other.mtime))
			return false;
		if (murl == null) {
			if (other.murl != null)
				return false;
		} else if (!murl.equals(other.murl))
			return false;
		if (nation == null) {
			if (other.nation != null)
				return false;
		} else if (!nation.equals(other.nation))
			return false;
		if (release == null) {
			if (other.release != null)
				return false;
		} else if (!release.equals(other.release))
			return false;
		return true;
	}
}
