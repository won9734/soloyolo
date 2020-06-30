package com.soloyolo.model.dto;

public class Cook {
/*
	-- 게시글 번호( COOKSEQ )
	CNO NUMBER PRIMARY KEY, 
	-- COOK 이름
	NAME VARCHAR2( 1000 ) NOT NULL, 
	-- COOK 소개
	INTRO VARCHAR2( 4000 ) NOT NULL, 
	-- COOK 레시피
	RECIPE VARCHAR2( 4000 ) NOT NULL, 
	-- COOK 종류
	CTYPE VARCHAR2( 2000 ) CHECK( CTYPE IN ( '일상', '초스피드', '술안주', '다이어트', '간식', '야식' ) ), 
	-- 섭취 칼로리
	CCAL NUMBER NOT NULL, 
	-- COOK 사진 태그들
	CURL VARCHAR2( 1000 ) NOT NULL, 
	-- 재료
	MATERIAL VARCHAR2( 1000 ) NOT NULL, 
	-- 양념
	SEASONING VARCHAR2( 1000 ) NOT NULL
 */
	private int cno;
	private String name;
	private String intro;
	private String recipe;
	private String ctype;
	private double cCal;
	private String cUrl;
	private String material;
	private String seasoning;
	public Cook() {}
	
	public Cook(int cno, String name, String intro, String recipe, String ctype, double cCal, String cUrl,
			String material, String seasoning) {
		this.cno = cno;
		this.name = name;
		this.intro = intro;
		this.recipe = recipe;
		this.ctype = ctype;
		this.cCal = cCal;
		this.cUrl = cUrl;
		this.material = material;
		this.seasoning = seasoning;
	}
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
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
	public String getRecipe() {
		return recipe;
	}
	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public double getcCal() {
		return cCal;
	}
	public void setcCal(double cCal) {
		this.cCal = cCal;
	}
	public String getcUrl() {
		return cUrl;
	}
	public void setcUrl(String cUrl) {
		this.cUrl = cUrl;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getSeasoning() {
		return seasoning;
	}
	public void setSeasoning(String seasoning) {
		this.seasoning = seasoning;
	}
	
	@Override
	public String toString() {
		return "Cook [cno=" + cno + ", name=" + name + ", intro=" + intro + ", recipe=" + recipe + ", ctype=" + ctype
				+ ", cCal=" + cCal + ", cUrl=" + cUrl + ", material=" + material + ", seasoning=" + seasoning + "]";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(cCal);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((cUrl == null) ? 0 : cUrl.hashCode());
		result = prime * result + cno;
		result = prime * result + ((ctype == null) ? 0 : ctype.hashCode());
		result = prime * result + ((intro == null) ? 0 : intro.hashCode());
		result = prime * result + ((material == null) ? 0 : material.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((recipe == null) ? 0 : recipe.hashCode());
		result = prime * result + ((seasoning == null) ? 0 : seasoning.hashCode());
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
		Cook other = (Cook) obj;
		if (Double.doubleToLongBits(cCal) != Double.doubleToLongBits(other.cCal))
			return false;
		if (cUrl == null) {
			if (other.cUrl != null)
				return false;
		} else if (!cUrl.equals(other.cUrl))
			return false;
		if (cno != other.cno)
			return false;
		if (ctype == null) {
			if (other.ctype != null)
				return false;
		} else if (!ctype.equals(other.ctype))
			return false;
		if (intro == null) {
			if (other.intro != null)
				return false;
		} else if (!intro.equals(other.intro))
			return false;
		if (material == null) {
			if (other.material != null)
				return false;
		} else if (!material.equals(other.material))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (recipe == null) {
			if (other.recipe != null)
				return false;
		} else if (!recipe.equals(other.recipe))
			return false;
		if (seasoning == null) {
			if (other.seasoning != null)
				return false;
		} else if (!seasoning.equals(other.seasoning))
			return false;
		return true;
	}
}
