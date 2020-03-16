package com.bitcamp.dto;

public class NoticeDTO {

	private int ntcno;
	private String ntccontent;
	private String ntctitle;
	private String ntcdate;
	
	
	
	@Override
	public String toString() {
		return "NoticeDTO [ntcno=" + ntcno + ", ntccontent=" + ntccontent + ", ntctitle=" + ntctitle + ", ntcdate="
				+ ntcdate + "]";
	}
	public int getNtcno() {
		return ntcno;
	}
	public void setNtcno(int ntcno) {
		this.ntcno = ntcno;
	}
	public String getNtccontent() {
		return ntccontent;
	}
	public void setNtccontent(String ntccontent) {
		this.ntccontent = ntccontent;
	}
	public String getNtctitle() {
		return ntctitle;
	}
	public void setNtctitle(String ntctitle) {
		this.ntctitle = ntctitle;
	}
	public String getNtcdate() {
		return ntcdate;
	}
	public void setNtcdate(String ntcdate) {
		this.ntcdate = ntcdate;
	}
	
	
	
}
