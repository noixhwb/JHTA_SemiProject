package myshopVo;

public class OrderDetailVo {
	private int onum;
	private int odnum;
	private int pdnum;
	private int dcount;
	private int dprice;
	private int dstate;
	public OrderDetailVo() {}
	public OrderDetailVo(int onum, int odnum, int pdnum, int dcount, int dprice, int dstate) {
		super();
		this.onum = onum;
		this.odnum = odnum;
		this.pdnum = pdnum;
		this.dcount = dcount;
		this.dprice = dprice;
		this.dstate = dstate;
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
	
}
