package test.vo;

public class MyodVo {
	private int pNum;
	private String pName;
	private int pPrice;
	private int pBuyCount;
	private int pdNum;
	
	public MyodVo(int pNum, String pName, int pPrice, int pBuyCount, int pdNum) {
		super();
		this.pNum = pNum;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pBuyCount = pBuyCount;
		this.pdNum = pdNum;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpBuyCount() {
		return pBuyCount;
	}
	public void setpBuyCount(int pBuyCount) {
		this.pBuyCount = pBuyCount;
	}
	public int getPdNum() {
		return pdNum;
	}
	public void setPdNum(int pdNum) {
		this.pdNum = pdNum;
	}
	
}
