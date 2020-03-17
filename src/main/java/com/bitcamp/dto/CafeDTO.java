package com.bitcamp.dto;

import org.springframework.web.multipart.MultipartFile;

public class CafeDTO {
	private int cafeno;
	private int cafeproduct; 
	private int cafecategory;
	private String menu;
	private String menueng;
	private String allergy;
	private String menuexplain;
	private MultipartFile cafeimgone;
	private MultipartFile cafeimgtwo;
	private MultipartFile cafeimgthree;
	private MultipartFile cafeimgfour;
	private String size;
	private String capacity;
	private int kcal;
	private int sodium;
	private int fat;
	private int sugars;
	private int protein;
	private int caffeine;
	private String orgFileName;
	private String saveFileName;
	private long fileSize;
	
	public CafeDTO(int cafeno, int cafeproduct, int cafecategory, String menu, String menueng, String allergy,
			String menuexplain, MultipartFile cafeimgone, MultipartFile cafeimgtwo, MultipartFile cafeimgthree,
			MultipartFile cafeimgfour, String size, String capacity, int kcal, int sodium, int fat, int sugars,
			int protein, int caffeine) {
		super();
		this.cafeno = cafeno;
		this.cafeproduct = cafeproduct;
		this.cafecategory = cafecategory;
		this.menu = menu;
		this.menueng = menueng;
		this.allergy = allergy;
		this.menuexplain = menuexplain;
		this.cafeimgone = cafeimgone;
		this.cafeimgtwo = cafeimgtwo;
		this.cafeimgthree = cafeimgthree;
		this.cafeimgfour = cafeimgfour;
		this.size = size;
		this.capacity = capacity;
		this.kcal = kcal;
		this.sodium = sodium;
		this.fat = fat;
		this.sugars = sugars;
		this.protein = protein;
		this.caffeine = caffeine;
	}

	public int getCafeno() {
		return cafeno;
	}

	public void setCafeno(int cafeno) {
		this.cafeno = cafeno;
	}

	public int getCafeproduct() {
		return cafeproduct;
	}

	public void setCafeproduct(int cafeproduct) {
		this.cafeproduct = cafeproduct;
	}

	public int getCafecategory() {
		return cafecategory;
	}

	public void setCafecategory(int cafecategory) {
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

	public MultipartFile getCafeimgone() {
		return cafeimgone;
	}

	public void setCafeimgone(MultipartFile cafeimgone) {
		this.cafeimgone = cafeimgone;
	}

	public MultipartFile getCafeimgtwo() {
		return cafeimgtwo;
	}

	public void setCafeimgtwo(MultipartFile cafeimgtwo) {
		this.cafeimgtwo = cafeimgtwo;
	}

	public MultipartFile getCafeimgthree() {
		return cafeimgthree;
	}

	public void setCafeimgthree(MultipartFile cafeimgthree) {
		this.cafeimgthree = cafeimgthree;
	}

	public MultipartFile getCafeimgfour() {
		return cafeimgfour;
	}

	public void setCafeimgfour(MultipartFile cafeimgfour) {
		this.cafeimgfour = cafeimgfour;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public int getSodium() {
		return sodium;
	}

	public void setSodium(int sodium) {
		this.sodium = sodium;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getSugars() {
		return sugars;
	}

	public void setSugars(int sugars) {
		this.sugars = sugars;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getCaffeine() {
		return caffeine;
	}

	public void setCaffeine(int caffeine) {
		this.caffeine = caffeine;
	}
	
	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	
	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "CafeDTO [cafeno=" + cafeno + ", cafeproduct=" + cafeproduct + ", cafecategory=" + cafecategory
				+ ", menu=" + menu + ", menueng=" + menueng + ", allergy=" + allergy + ", menuexplain=" + menuexplain
				+ ", cafeimgone=" + cafeimgone + ", cafeimgtwo=" + cafeimgtwo + ", cafeimgthree=" + cafeimgthree
				+ ", cafeimgfour=" + cafeimgfour + ", size=" + size + ", capacity=" + capacity + ", kcal=" + kcal
				+ ", sodium=" + sodium + ", fat=" + fat + ", sugars=" + sugars + ", protein=" + protein + ", caffeine="
				+ caffeine + "]";
	}
	
	
	
	
}
