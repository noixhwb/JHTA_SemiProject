package myshopVo;

import java.sql.Date;

public class OrdersVo {
	private int onum;
	private String mid;
	private int totalsales;
	private String delocation;
	private Date odate;
	public OrdersVo() {}
	
	public OrdersVo(int onum, String mid, int totalsales, String delocation, Date odate) {
		super();
		this.onum = onum;
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
