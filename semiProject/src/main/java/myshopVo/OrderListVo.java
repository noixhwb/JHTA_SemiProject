package myshopVo;

import java.sql.Date;

public class OrderListVo {
	private int onum;
	private int odnum;
	private int pdnum;
	private int dcount;
	private int dprice;
	private int dstate;
	private String mid;
	private int totalsales;
	private String delocation;
	private Date odate;
	public OrderListVo() {}
	
	public OrderListVo(int onum, int odnum, int pdnum, int dcount, int dprice, int dstate, String mid, int totalsales,
			String delocation, Date odate) {
		super();
		this.onum = onum;
		this.odnum = odnum;
		this.pdnum = pdnum;
		this.dcount = dcount;
		this.dprice = dprice;
		this.dstate = dstate;
		this.mid = mid;
		this.totalsales = totalsales;
		this.delocation = delocation;
		this.odate = odate;
	}

	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	public int getOdnum() {
		return odnum;
	}
	public void setOdnum(int odnum) {
		this.odnum = odnum;
	}
	public int getPdnum() {
		return pdnum;
	}
	public void setPdnum(int pdnum) {
		this.pdnum = pdnum;
	}
	public int getDcount() {
		return dcount;
	}
	public void setDcount(int dcount) {
		this.dcount = dcount;
	}
	public int getDprice() {
		return dprice;
	}
	public void setDprice(int dprice) {
		this.dprice = dprice;
	}
	public int getDstate() {
		return dstate;
	}
	public void setDstate(int dstate) {
		this.dstate = dstate;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getTotalsales() {
		return totalsales;
	}
	public void setTotalsales(int totalsales) {
		this.totalsales = totalsales;
	}
	public String getDelocation() {
		return delocation;
	}
	public void setDelocation(String delocation) {
		this.delocation = delocation;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	
}
