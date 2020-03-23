package com.bitcamp.dto;

public class CafeDTO {
	private int cafeno;
	private String cafeproduct; 
	private String cafecategory;
	private String menu;
	private String menueng;
	private String allergy;
	private String menuexplain;
	
	
	public int getCafeno() {
		return cafeno;
	}
	public void setCafeno(int cafeno) {
		this.cafeno = cafeno;
	}
	public String getCafeproduct() {
		return cafeproduct;
	}
	public void setCafeproduct(String cafeproduct) {
		this.cafeproduct = cafeproduct;
	}
	public String getCafecategory() {
		return cafecategory;
	}
	public void setCafecategory(String cafecategory) {
		this.cafecategory = cafecategory;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getMenueng() {
		return menueng;
	}
	public void setMenueng(String menueng) {
		this.menueng = menueng;
	}
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	public String getMenuexplain() {
		return menuexplain;
	}
	public void setMenuexplain(String menuexplain) {
		this.menuexplain = menuexplain;
	}
	@Override
	public String toString() {
		return "CafeDTO [cafeno=" + cafeno + ", cafeproduct=" + cafeproduct + ", cafecategory=" + cafecategory
				+ ", menu=" + menu + ", menueng=" + menueng + ", allergy=" + allergy + ", menuexplain=" + menuexplain
				+ "]";
	}
	
	
}
