package com.bitcamp.security;

public class Login__AuthVO {
private String userid;
private String auth;



public Login__AuthVO(String userid, String auth) {
	super();
	this.userid = userid;
	this.auth = auth;
}
public Login__AuthVO() {
	super();
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public String getAuth() {
	return auth;
}
public void setAuth(String auth) {
	this.auth = auth;
}


}
