package com.bitcamp.security;

import java.util.List;


import lombok.Data;

public class Login__MemberVO {
private String userid;
private String password;
private String username;
private String useremail;
private String phone;
private String joindate;
private String address;
private String address2;
private String address3;
private String userimg;
private String hostcomment;
public String getHostcomment() {
	return hostcomment;
}

public void setHostcomment(String hostcomment) {
	this.hostcomment = hostcomment;
}

private List<Login__AuthVO> authList;

public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getUseremail() {
	return useremail;
}

public void setUseremail(String useremail) {
	this.useremail = useremail;
}

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

public String getJoindate() {
	return joindate;
}

public void setJoindate(String joindate) {
	this.joindate = joindate;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getAddress2() {
	return address2;
}

public void setAddress2(String address2) {
	this.address2 = address2;
}

public String getAddress3() {
	return address3;
}

public void setAddress3(String address3) {
	this.address3 = address3;
}

public String getUserimg() {
	return userimg;
}

public void setUserimg(String userimg) {
	this.userimg = userimg;
}

public List<Login__AuthVO> getAuthList() {
	return authList;
}

public void setAuthList(List<Login__AuthVO> authList) {
	this.authList = authList;
}
	
	
}
