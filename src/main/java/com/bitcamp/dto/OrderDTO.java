package com.bitcamp.dto;

import java.util.Arrays;

public class OrderDTO {
	
	private int oderno;
	private Integer[] ordercpno;
	private String salesdate;
	private int waybillno;
	private String ordermg;
	private int totalprice;
	private String userid;
	private String deltype;
	private Integer[] ordercprice;
	private Integer[] ordercamount;
	private String orderuname;
	private int orderuaddr1;
	private String orderuaddr2;
	private String orderuaddr3;
	private String orderuphone;
	private String orderuemail;
	private String orderstatus;
	private String payuname;
	
	public String getDeltype() {
		return deltype;
	}
	public void setDeltype(String deltype) {
		this.deltype = deltype;
	}
	public int getOderno() {
		return oderno;
	}
	public void setOderno(int oderno) {
		this.oderno = oderno;
	}
	public String getSalesdate() {
		return salesdate;
	}
	public void setSalesdate(String salesdate) {
		this.salesdate = salesdate;
	}
	public int getWaybillno() {
		return waybillno;
	}
	public void setWaybillno(int waybillno) {
		this.waybillno = waybillno;
	}
	public String getOrdermg() {
		return ordermg;
	}
	public void setOrdermg(String ordermg) {
		this.ordermg = ordermg;
	}
	public int getPrice() {
		return totalprice;
	}
	public void setPrice(int price) {
		this.totalprice = price;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOrderuname() {
		return orderuname;
	}
	public void setOrderuname(String orderuname) {
		this.orderuname = orderuname;
	}
	public int getOrderuaddr1() {
		return orderuaddr1;
	}
	public void setOrderuaddr1(int orderuaddr1) {
		this.orderuaddr1 = orderuaddr1;
	}
	public String getOrderuaddr2() {
		return orderuaddr2;
	}
	public void setOrderuaddr2(String orderuaddr2) {
		this.orderuaddr2 = orderuaddr2;
	}
	public String getOrderuaddr3() {
		return orderuaddr3;
	}
	public void setOrderuaddr3(String orderuaddr3) {
		this.orderuaddr3 = orderuaddr3;
	}
	public String getOrderuphone() {
		return orderuphone;
	}
	public void setOrderuphone(String orderuphone) {
		this.orderuphone = orderuphone;
	}

	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getOrderuemail() {
		return orderuemail;
	}
	public void setOrderuemail(String orderuemail) {
		this.orderuemail = orderuemail;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public String getPayuname() {
		return payuname;
	}
	public void setPayuname(String payuname) {
		this.payuname = payuname;
	}

	public Integer[] getOrdercprice() {
		return ordercprice;
	}
	public void setOrdercprice(Integer[] ordercprice) {
		this.ordercprice = ordercprice;
	}
	public Integer[] getOrdercamount() {
		return ordercamount;
	}
	public void setOrdercamount(Integer[] ordercamount) {
		this.ordercamount = ordercamount;
	}
	public Integer[] getOrdercpno() {
		return ordercpno;
	}
	public void setOrdercpno(Integer[] ordercpno) {
		this.ordercpno = ordercpno;
	}
	@Override
	public String toString() {
		return "OrderDTO [oderno=" + oderno + ", ordercpno=" + Arrays.toString(ordercpno) + ", salesdate=" + salesdate
				+ ", waybillno=" + waybillno + ", ordermg=" + ordermg + ", totalprice=" + totalprice + ", userid="
				+ userid + ", deltype=" + deltype + ", ordercprice=" + Arrays.toString(ordercprice) + ", ordercamount="
				+ Arrays.toString(ordercamount) + ", orderuname=" + orderuname + ", orderuaddr1=" + orderuaddr1
				+ ", orderuaddr2=" + orderuaddr2 + ", orderuaddr3=" + orderuaddr3 + ", orderuphone=" + orderuphone
				+ ", orderuemail=" + orderuemail + ", orderstatus=" + orderstatus + ", payuname=" + payuname + "]";
	}


	
}
