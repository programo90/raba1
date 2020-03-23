package com.bitcamp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class YoutubeDTO {
	private int youtubeno;
	private String youtubetitle;
	private String youtubeurl;
	private String youtubedate;
	
	public YoutubeDTO() {}
	
	
	public YoutubeDTO(String youtubetitle, String youtubeurl, int youtubeno) {
		super();
		this.youtubetitle = youtubetitle;
		this.youtubeurl = youtubeurl;
		this.youtubeno=youtubeno;
	}

	public int getYoutubeno() {
		return youtubeno;
	}
	public void setYoutubeno(int youtubeno) {
		this.youtubeno = youtubeno;
	}
	
	public String getYoutubetitle() {
		return youtubetitle;
	}

	public void setYoutubetitle(String youtubetitle) {
		this.youtubetitle = youtubetitle;
	}

	public String getYoutubeurl() {
		return youtubeurl;
	}
	public void setYoutubeurl(String youtubeurl) {
		this.youtubeurl = youtubeurl;
	}
	public String getYoutubedate() {
		return youtubedate;
	}
	public void setYoutubedate(String youtubedate) {
		this.youtubedate = youtubedate;
	}

	@Override
	public String toString() {
		return "YoutubeDTO [youtubeno=" + youtubeno + ", youtubetitle=" + youtubetitle + ", youtubeurl=" + youtubeurl
				+ ", youtubedate=" + youtubedate + "]";
	}
	
	
	
}
