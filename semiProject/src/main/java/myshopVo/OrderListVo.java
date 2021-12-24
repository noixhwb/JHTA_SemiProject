package myshopVo;

import java.sql.Date;

public class OrderListVo {
	private int odnum;
	private String prosize;
	private int dcount;
	private String pname;
	private int dstate;
	private String mid;
	private int dprice;
	private String delocation;
	private Date odate;
	private int sales;
	private String sdate;
	public OrderListVo() {}
	public OrderListVo(int odnum, String prosize, int dcount, String pname, int dstate, String mid, int dprice,
			String delocation, Date odate) {
		super();
		this.odnum = odnum;
		this.prosize = prosize;
		this.dcount = dcount;
		this.pname = pname;
		this.dstate = dstate;
		this.mid = mid;
		this.dprice = dprice;
		this.delocation = delocation;
		this.odate = odate;
	}
	public OrderListVo(int sales,String sdate) {
		this.sales=sales;
		this.sdate=sdate;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public int getOdnum() {
		return odnum;
	}
	public void setOdnum(int odnum) {
		this.odnum = odnum;
	}
	public String getProsize() {
		return prosize;
	}
	public void setProsize(String prosize) {
		this.prosize = prosize;
	}
	public int getDcount() {
		return dcount;
	}
	public void setDcount(int dcount) {
		this.dcount = dcount;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
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
	public int getdprice() {
		return dprice;
	}
	public void setdprice(int dprice) {
		this.dprice = dprice;
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