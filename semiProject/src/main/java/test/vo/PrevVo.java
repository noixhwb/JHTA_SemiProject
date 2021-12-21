package test.vo;

public class PrevVo {
	private String pName;
	private String proSize;
	private int pdNum;
	private String piFileName;
	private int odNum;
	
	public PrevVo(String pName, String proSize, int pdNum, String piFileName, int odNum) {
		super();
		this.pName = pName;
		this.proSize = proSize;
		this.pdNum = pdNum;
		this.piFileName = piFileName;
		this.odNum = odNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getProSize() {
		return proSize;
	}
	public void setProSize(String proSize) {
		this.proSize = proSize;
	}
	public int getPdNum() {
		return pdNum;
	}
	public void setPdNum(int pdNum) {
		this.pdNum = pdNum;
	}
	public String getPiFileName() {
		return piFileName;
	}
	public void setPiFileName(String piFileName) {
		this.piFileName = piFileName;
	}
	public int getOdNum() {
		return odNum;
	}
	public void setOdNum(int odNum) {
		this.odNum = odNum;
	}
	
	
}
