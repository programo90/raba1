package com.bitcamp.dto;

public class RepairDTO {
	private int reservno;
	private String userid;
	private String reservtxt;
	private int reservlevel;
	private int reservorder;
	private String reservwritedate;
	private String caldate;
	public int getReservno() {
		return reservno;
	}
	public void setReservno(int reservno) {
		this.reservno = reservno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReservtxt() {
		return reservtxt;
	}
	public void setReservtxt(String reservtxt) {
		this.reservtxt = reservtxt;
	}
	public int getReservlevel() {
		return reservlevel;
	}
	public void setReservlevel(int reservlevel) {
		this.reservlevel = reservlevel;
	}
	public int getReservorder() {
		return reservorder;
	}
	public void setReservorder(int reservorder) {
		this.reservorder = reservorder;
	}
	public String getReservwritedate() {
		return reservwritedate;
	}
	public void setReservwritedate(String reservwritedate) {
		this.reservwritedate = reservwritedate;
	}
	public String getCaldate() {
		return caldate;
	}
	public void setCaldate(String caldate) {
		this.caldate = caldate;
	}
	@Override
	public String toString() {
		return "RepairDTO [reservno=" + reservno + ", userid=" + userid + ", reservtxt=" + reservtxt + ", reservlevel="
				+ reservlevel + ", reservorder=" + reservorder + ", reservwritedate=" + reservwritedate + ", caldate="
				+ caldate + "]";
	}
	
	
}
