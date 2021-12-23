package test.vo;

import java.sql.Date;

public class MyorderVo {
	private int oNum;
	private String mId;
	private int totalSales;
	private String delocation;
	private Date oDate;
	private int odNum;
	private int pdNum;
	private int dCount;
	private int dPrice;
	private int dState;
	
	public MyorderVo(int oNum, String mId, int totalSales, String delocation, Date oDate, int odNum, int pdNum,
			int dCount, int dPrice, int dState) {
		super();
		this.oNum = oNum;
		this.mId = mId;
		this.totalSales = totalSales;
		this.delocation = delocation;
		this.oDate = oDate;
		this.odNum = odNum;
		this.pdNum = pdNum;
		this.dCount = dCount;
		this.dPrice = dPrice;
		this.dState = dState;
	}

	public int getoNum() {
		return oNum;
	}

	public void setoNum(int oNum) {
		this.oNum = oNum;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}

	public String getDelocation() {
		return delocation;
	}

	public void setDelocation(String delocation) {
		this.delocation = delocation;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public int getOdNum() {
		return odNum;
	}

	public void setOdNum(int odNum) {
		this.odNum = odNum;
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
