package com.soloyolo.model.dto;

public class HomeTraining {
	private int htno;
	private String name;
	private String intro;
	private String htTime;
	private String htlevel;
	private String part;
	private int subCal;
	private String avi;
	private String pic;
	
	public HomeTraining() {}
	
	public HomeTraining( int htno, String name, String intro, String htTime, String htlevel, 
							String part, int subCal, String avi, String pic ) {
		this.htno = htno;
		this.name = name;
		this.intro = intro;
		this.htTime = htTime;
		this.htlevel = htlevel;
		this.part = part;
		this.subCal = subCal;
		this.avi = avi;
		this.pic = pic;
	}
	
	public int getHtno() {
		return htno;
	}
	public void setHtno(int htno) {
		this.htno = htno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getHtTime() {
		return htTime;
	}
	public void setHtTime(String htTime) {
		this.htTime = htTime;
	}
	public String gethtlevel() {
		return htlevel;
	}
	public void sethtlevel(String htlevel) {
		this.htlevel = htlevel;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public int getSubCal() {
		return subCal;
	}
	public void setSubCal(int subCal) {
		this.subCal = subCal;
	}
	public String getAvi() {
		return avi;
	}
	public void setAvi(String avi) {
		this.avi = avi;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	
	@Override
	public String toString() {
		return "HomeTraining [htno=" + htno + ", name=" + name + ", intro=" + intro + ", htTime=" + htTime + ", htlevel="
				+ htlevel + ", part=" + part + ", subCal=" + subCal + ", avi=" + avi + ", pic=" + pic + "]";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((avi == null) ? 0 : avi.hashCode());
		result = prime * result + ((htTime == null) ? 0 : htTime.hashCode());
		result = prime * result + htno;
		result = prime * result + ((intro == null) ? 0 : intro.hashCode());
		result = prime * result + ((htlevel == null) ? 0 : htlevel.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((part == null) ? 0 : part.hashCode());
		result = prime * result + ((pic == null) ? 0 : pic.hashCode());
		result = prime * result + subCal;
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
		HomeTraining other = (HomeTraining) obj;
		if (avi == null) {
			if (other.avi != null)
				return false;
		} else if (!avi.equals(other.avi))
			return false;
		if (htTime == null) {
			if (other.htTime != null)
				return false;
		} else if (!htTime.equals(other.htTime))
			return false;
		if (htno != other.htno)
			return false;
		if (intro == null) {
			if (other.intro != null)
				return false;
		} else if (!intro.equals(other.intro))
			return false;
		if (htlevel == null) {
			if (other.htlevel != null)
				return false;
		} else if (!htlevel.equals(other.htlevel))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (part == null) {
			if (other.part != null)
				return false;
		} else if (!part.equals(other.part))
			return false;
		if (pic == null) {
			if (other.pic != null)
				return false;
		} else if (!pic.equals(other.pic))
			return false;
		if (subCal != other.subCal)
			return false;
		return true;
	}
}
