package com.bitcamp.dto;

import java.util.List;

public class CartListDTO {

	
	private List<Integer> cnolist;
	private int totalprice;
	
	
	public List<Integer> getCnolist() {
		return cnolist;
	}
	public void setCnolist(List<Integer> cnolist) {
		this.cnolist = cnolist;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	
	@Override
	public String toString() {
		return "CartListDTO [cnolist=" + cnolist + ", totalprice=" + totalprice + "]";
	}
	
	
}
