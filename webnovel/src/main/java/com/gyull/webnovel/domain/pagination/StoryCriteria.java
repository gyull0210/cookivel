package com.gyull.webnovel.domain.pagination;

public class StoryCriteria {

	private int pageNum;
	private int amount;
	private int skip;
	private int member_idx;
	
	public StoryCriteria() {
		this(1, 10, 0);
		this.skip = 0;
	}
	
	public StoryCriteria(int pageNum, int amount, int member_idx) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1)*amount;
		this.member_idx = member_idx;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*this.amount;
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.skip = (this.pageNum-1)*amount;		
		this.amount = amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	
	@Override
	public String toString() {
		return "StoryCriteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", member_idx="+member_idx+"]";
		
	}
	
}