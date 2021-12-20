package test.vo;

public class prodetailVo {

	
	private int pdNum;
	private int pNum;
	private String proSize;
	private int proCount;
	public prodetailVo()
	{
		
	}
	public prodetailVo(int pdNum, int pNum, String proSize, int proCount) {
		super();
		this.pdNum = pdNum;
		this.pNum = pNum;
		this.proSize = proSize;
		this.proCount = proCount;
	}
	public int getPdNum() {
		return pdNum;
	}
	public void setPdNum(int pdNum) {
		this.pdNum = pdNum;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getProSize() {
		return proSize;
	}
	public void setProSize(String proSize) {
		this.proSize = proSize;
	}
	public int getProCount() {
		return proCount;
	}
	public void setProCount(int proCount) {
		this.proCount = proCount;
	}
	
	
}
