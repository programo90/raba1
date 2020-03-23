package com.bitcamp.dto;

public class HostDTO {

	private Integer hostno;
	private Integer leadcount;
	private String hostcomment;
	private String userid;
	
	private String userimg;
	private String username;
	private int distance;
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Integer getHostno() {
		return hostno;
	}
	public void setHostno(Integer hostno) {
		this.hostno = hostno;
	}
	public Integer getLeadcount() {
		return leadcount;
	}
	public void setLeadcount(Integer leadcount) {
		this.leadcount = leadcount;
	}
	public String getHostcomment() {
		return hostcomment;
	}
	public void setHostcomment(String hostcomment) {
		this.hostcomment = hostcomment;
	}
	public String getUserimg() {
		return userimg;
	}
	public void setUserimg(String userimg) {
		this.userimg = userimg;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getDistance() {
		return distance;
	}
	public void setDistance(Integer distance) {
		this.distance = distance;
	}
	
	
	
	
}
