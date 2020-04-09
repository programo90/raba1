package com.bitcamp.dto;

public class TourApplyDTO {
	private String userid;
	private Integer tourno;
	private String applydate;
	private String username;
	private String phone;
	
	
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Integer getTourno() {
		return tourno;
	}
	public void setTourno(Integer tourno) {
		this.tourno = tourno;
	}
	public String getApplydate() {
		return applydate;
	}
	public void setApplydate(String applydate) {
		this.applydate = applydate;
	}
	
	
}
