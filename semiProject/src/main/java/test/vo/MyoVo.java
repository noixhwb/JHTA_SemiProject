package test.vo;

import java.sql.Date;

public class MyoVo {
	private int oNum;
	private String mId;
	private int totalSales;
	private String delocation;
	private Date oDate;
	
	public MyoVo(int oNum, String mId, int totalSales, String delocation, Date oDate) {
		super();
		this.oNum = oNum;
		this.mId = mId;
		this.totalSales = totalSales;
		this.delocation = delocation;
		this.oDate = oDate;
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
	
}
