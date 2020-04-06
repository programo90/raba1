package com.bitcamp.dto;

public class CafeNutrtionDTO {
	private int MEAL_NO;
	private String MEAL_NAME;
	private int MEAL_AMOUNT;
	private String MEAL_UNIT;
	private double MEAL_KCAL;
	private double MEAL_PROTEIN;
	private double MEAL_FAT;
	private double MEAL_CARB;
	private double MEAL_SODIUM;
	private int CAFENO;
	public CafeNutrtionDTO() {
		super();
	}
	public CafeNutrtionDTO(int mEAL_NO, String mEAL_NAME, int mEAL_AMOUNT, String mEAL_UNIT, double mEAL_KCAL,
			double mEAL_PROTEIN, double mEAL_FAT, double mEAL_CARB, double mEAL_SODIUM, int cAFENO) {
		super();
		MEAL_NO = mEAL_NO;
		MEAL_NAME = mEAL_NAME;
		MEAL_AMOUNT = mEAL_AMOUNT;
		MEAL_UNIT = mEAL_UNIT;
		MEAL_KCAL = mEAL_KCAL;
		MEAL_PROTEIN = mEAL_PROTEIN;
		MEAL_FAT = mEAL_FAT;
		MEAL_CARB = mEAL_CARB;
		MEAL_SODIUM = mEAL_SODIUM;
		CAFENO = cAFENO;
	}



	public int getMEAL_NO() {
		return MEAL_NO;
	}
	public void setMEAL_NO(int mEAL_NO) {
		MEAL_NO = mEAL_NO;
	}
	
	public int getCAFENO() {
		return CAFENO;
	}
	public void setCAFENO(int cAFENO) {
		CAFENO = cAFENO;
	}
	public String getMEAL_NAME() {
		return MEAL_NAME;
	}
	public void setMEAL_NAME(String mEAL_NAME) {
		MEAL_NAME = mEAL_NAME;
	}
	public int getMEAL_AMOUNT() {
		return MEAL_AMOUNT;
	}
	public void setMEAL_AMOUNT(int mEAL_AMOUNT) {
		MEAL_AMOUNT = mEAL_AMOUNT;
	}
	public String getMEAL_UNIT() {
		return MEAL_UNIT;
	}
	public void setMEAL_UNIT(String mEAL_UNIT) {
		MEAL_UNIT = mEAL_UNIT;
	}
	public double getMEAL_KCAL() {
		return MEAL_KCAL;
	}
	public void setMEAL_KCAL(double mEAL_KCAL) {
		MEAL_KCAL = mEAL_KCAL;
	}
	public double getMEAL_PROTEIN() {
		return MEAL_PROTEIN;
	}
	public void setMEAL_PROTEIN(double mEAL_PROTEIN) {
		MEAL_PROTEIN = mEAL_PROTEIN;
	}
	public double getMEAL_FAT() {
		return MEAL_FAT;
	}
	public void setMEAL_FAT(double mEAL_FAT) {
		MEAL_FAT = mEAL_FAT;
	}
	public double getMEAL_CARB() {
		return MEAL_CARB;
	}
	public void setMEAL_CARB(double mEAL_CARB) {
		MEAL_CARB = mEAL_CARB;
	}
	public double getMEAL_SODIUM() {
		return MEAL_SODIUM;
	}
	public void setMEAL_SODIUM(double mEAL_SODIUM) {
		MEAL_SODIUM = mEAL_SODIUM;
	}
	@Override
	public String toString() {
		return "CafeNutrtionDTO [MEAL_NO=" + MEAL_NO + ", MEAL_NAME=" + MEAL_NAME + ", MEAL_AMOUNT=" + MEAL_AMOUNT
				+ ", MEAL_UNIT=" + MEAL_UNIT + ", MEAL_KCAL=" + MEAL_KCAL + ", MEAL_PROTEIN=" + MEAL_PROTEIN
				+ ", MEAL_FAT=" + MEAL_FAT + ", MEAL_CARB=" + MEAL_CARB + ", MEAL_SODIUM=" + MEAL_SODIUM + ", CAFENO="
				+ CAFENO + "]";
	}
	
}
