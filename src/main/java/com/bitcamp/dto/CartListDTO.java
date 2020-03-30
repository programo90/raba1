package com.bitcamp.dto;

import java.util.List;

public class CartListDTO {

	
	private List<Integer> cnolist;
	private Integer[] cnolist2;
	private String totalprice;
	private String usercode;
	
	
	public Integer[] getCnolist2() {
		return cnolist2;
	}
	public void setCnolist2(Integer[] cnolist2) {
		this.cnolist2 = cnolist2;
	}
	public List<Integer> getCnolist() {
		return cnolist;
	}
	public void setCnolist(List<Integer> cnolist) {
		this.cnolist = cnolist;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}
	@Override
	public String toString() {
		return "CartListDTO [cnolist=" + cnolist + ", totalprice=" + totalprice + ", usercode=" + usercode + "]";
	}
	
	
	
	
	
}
