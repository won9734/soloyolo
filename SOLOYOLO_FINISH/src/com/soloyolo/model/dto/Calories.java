package com.soloyolo.model.dto;

public class Calories {
   private int calno;
   private int userno;
   private Double sumcal;
   private Double subcal;
   private String regdate;
   public Calories() {
      super();
      // TODO Auto-generated constructor stub
   }
   public Calories(int calno, int userno, Double sumcal, Double subcal, String regdate) {
      super();
      this.calno = calno;
      this.userno = userno;
      this.sumcal = sumcal;
      this.subcal = subcal;
      this.regdate = regdate;
   }
   public int getCalno() {
      return calno;
   }
   public void setCalno(int calno) {
      this.calno = calno;
   }
   public int getUserno() {
      return userno;
   }
   public void setUserno(int userno) {
      this.userno = userno;
   }
   public Double getSumcal() {
      return sumcal;
   }
   public void setSumcal(Double sumcal) {
      this.sumcal = sumcal;
   }
   public Double getSubcal() {
      return subcal;
   }
   public void setSubcal(Double subcal) {
      this.subcal = subcal;
   }
   public String getRegdate() {
      return regdate;
   }
   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }
   @Override
   public String toString() {
      return "Calories [calno=" + calno + ", userno=" + userno + ", sumcal=" + sumcal + ", subcal=" + subcal
            + ", regdate=" + regdate + "]";
   }
}