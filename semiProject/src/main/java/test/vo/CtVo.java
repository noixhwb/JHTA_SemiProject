package test.vo;

public class CtVo {
	private int cCartNum;
	private String pName;
	private int pPrice;
	private String piFileName;
	private String proSize;
	private int proCount;
	private String mId;
	
	public CtVo(int cCartNum, String pName, int pPrice, String piFileName, String proSize, int proCount, String mId) {
		super();
		this.cCartNum = cCartNum;
		this.pName = pName;
		this.pPrice = pPrice;
		this.piFileName = piFileName;
		this.proSize = proSize;
		this.proCount = proCount;
		this.mId = mId;
	}
	
	public int getcCartNum() {
		return cCartNum;
	}
	public void setcCartNum(int cCartNum) {
		this.cCartNum = cCartNum;
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
	public String getPiFileName() {
		return piFileName;
	}
	public void setPiFileName(String piFileName) {
		this.piFileName = piFileName;
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
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	
}
