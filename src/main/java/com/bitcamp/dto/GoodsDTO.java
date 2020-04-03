package com.bitcamp.dto;

import java.util.List;

public class GoodsDTO {

	private int p_no;
	private String p_name;
	private int p_price;
	private String p_size;
	private int p_amount;
	private int p_state;
	private String p_img;
	

	private List<BoardAttachVO> attachList;
	
	
	
	
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public int getP_amount() {
		return p_amount;
	}
	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}
	public int getP_state() {
		return p_state;
	}
	public void setP_state(int p_state) {
		this.p_state = p_state;
	}
	public List<BoardAttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<BoardAttachVO> attachList) {
		this.attachList = attachList;
	}
	
	@Override
	public String toString() {
		return "GoodsDTO [p_no=" + p_no + ", p_name=" + p_name + ", p_price=" + p_price + ", p_size=" + p_size
				+ ", p_amount=" + p_amount + ", p_state=" + p_state + ", attachList=" + attachList + "]";
	}
	
	
	
}
