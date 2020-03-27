package com.bitcamp.dto;

public class TourPage {
	private int currPage;
	private int totalRow;
	private int pageSize;
	private int blockSize;
	
	private int startRow;
	private int endRow;
	private int startBlock;
	private int endBlock;
	private int totalPage;
	
	private boolean prev;
	private boolean next;
	
	public TourPage(int currPage, int totalRow, int pageSize, int blockSize) {
		super();
		this.currPage = currPage;
		this.totalRow = totalRow;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		
		calPage();
	}
	
	private void calPage() {
		startRow = (currPage-1)*pageSize;
		endRow = startRow + pageSize;
		if(endRow>totalRow) {
			endRow = totalRow;
		}
		
		totalPage = (int)Math.ceil(totalRow/(float)pageSize);
		startBlock = ((currPage-1)/blockSize)*blockSize +1;
		endBlock = startBlock + blockSize - 1;
		if(endBlock > totalPage) {
			endBlock = totalPage;
		}
		
		prev = (startBlock==1)?false:true;
		next = (endBlock==totalPage)?false:true;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	
}
