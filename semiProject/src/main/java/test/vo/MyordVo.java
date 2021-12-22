package test.vo;

import java.sql.Date;

public class MyordVo {
	private int odNum;
	private int oNum;
	private int pdNum;
	private int dCount;
	private int dPrice;
	private int dState;
	
	public MyordVo(int odNum, int oNum, int pdNum, int dCount, int dPrice, int dState) {
		super();
		this.odNum = odNum;
		this.oNum = oNum;
		this.pdNum = pdNum;
		this.dCount = dCount;
		this.dPrice = dPrice;
		this.dState = dState;
	}
	public int getOdNum() {
		return odNum;
	}
	public void setOdNum(int odNum) {
		this.odNum = odNum;
	}
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public int getPdNum() {
		return pdNum;
	}
	public void setPdNum(int pdNum) {
		this.pdNum = pdNum;
	}
	public int getdCount() {
		return dCount;
	}
	public void setdCount(int dCount) {
		this.dCount = dCount;
	}
	public int getdPrice() {
		return dPrice;
	}
	public void setdPrice(int dPrice) {
		this.dPrice = dPrice;
	}
	public int getdState() {
		return dState;
	}
	public void setdState(int dState) {
		this.dState = dState;
	}
	
	
}
