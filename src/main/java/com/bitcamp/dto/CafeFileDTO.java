package com.bitcamp.dto;

public class CafeFileDTO {
	private int cafeFileno;
	private int cafeno;
	private String cafeFileurl;
	private String fileoriginalname;
	private String filesystemname;
	
	
	public int getCafeFileno() {
		return cafeFileno;
	}
	public void setCafeFileno(int cafeFileno) {
		this.cafeFileno = cafeFileno;
	}
	public int getCafeno() {
		return cafeno;
	}
	public void setCafeno(int cafeno) {
		this.cafeno = cafeno;
	}
	public String getCafeFileurl() {
		return cafeFileurl;
	}
	public void setCafeFileurl(String cafeFileurl) {
		this.cafeFileurl = cafeFileurl;
	}
	public String getFileoriginalname() {
		return fileoriginalname;
	}
	public void setFileoriginalname(String fileoriginalname) {
		this.fileoriginalname = fileoriginalname;
	}
	public String getFilesystemname() {
		return filesystemname;
	}
	public void setFilesystemname(String filesystemname) {
		this.filesystemname = filesystemname;
	}
	@Override
	public String toString() {
		return "CafeFileDTO [cafeFileno=" + cafeFileno + ", cafeno=" + cafeno + ", cafeFileurl=" + cafeFileurl
				+ ", fileoriginalname=" + fileoriginalname + ", filesystemname=" + filesystemname + "]";
	}
	
	
}
