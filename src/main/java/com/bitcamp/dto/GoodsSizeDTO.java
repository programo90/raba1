package com.bitcamp.dto;

public class GoodsSizeDTO {
	
	private String free;
	private String small;
	private String medium;
	private String large;
	private String xlarge;
	
	private int f_no;
	private int s_no;
	private int m_no;
	private int l_no;
	private int xl_no;
	
	
	
	
	public int getF_no() {
		return f_no;
	}
	public void setF_no(int f_no) {
		this.f_no = f_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getL_no() {
		return l_no;
	}
	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	public int getXl_no() {
		return xl_no;
	}
	public void setXl_no(int xl_no) {
		this.xl_no = xl_no;
	}
	public String getFree() {
		return free;
	}
	public void setFree(String free) {
		this.free = free;
	}
	public String getSmall() {
		return small;
	}
	public void setSmall(String small) {
		this.small = small;
	}
	public String getMedium() {
		return medium;
	}
	public void setMedium(String medium) {
		this.medium = medium;
	}
	public String getLarge() {
		return large;
	}
	public void setLarge(String large) {
		this.large = large;
	}
	public String getXlarge() {
		return xlarge;
	}
	public void setXlarge(String xlarge) {
		this.xlarge = xlarge;
	}
	
	@Override
	public String toString() {
		return "GoodsSizeDTO [free=" + free + ", small=" + small + ", medium=" + medium + ", large=" + large
				+ ", xlarge=" + xlarge + ", f_no=" + f_no + ", s_no=" + s_no + ", m_no=" + m_no + ", l_no=" + l_no
				+ ", xl_no=" + xl_no + "]";
	}
	
	
}
