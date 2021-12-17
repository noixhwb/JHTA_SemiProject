package test.vo;

public class CartVo {
	private int cCartNum;
	private int pPrice;
	private String pNum;
	private String mId;
	private String pName;
	private String piFilename;

	public CartVo() {}

	public CartVo(int cCartNum, String pName, int pPrice, String piFilename) {
		super();
		this.cCartNum = cCartNum;
		this.pName = pName;
		this.pPrice = pPrice;
		this.piFilename = piFilename;
	}

	public int getcCartNum() {
		return cCartNum;
	}

	public void setcCartNum(int cCartNum) {
		this.cCartNum = cCartNum;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getPiFilename() {
		return piFilename;
	}

	public void setPiFilename(String piFilename) {
		this.piFilename = piFilename;
	}

//	@Override
//	public String toString() {
//		return "CartVo [cCartNum=" + cCartNum + ", pPrice=" + pPrice + ", pNum=" + pNum + ", mId=" + mId + ", pName="
//				+ pName + ", piFilename=" + piFilename + "]\n";
//	}
//	
//	
	
}
