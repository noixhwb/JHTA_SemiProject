package test.vo;

public class CartdelVo {
	private int cCartNum;
	private int pNum;
	private int mId;
	private int cCount;
	
	public CartdelVo(int cCartNum, int pNum, int mId, int cCount) {
		super();
		this.cCartNum = cCartNum;
		this.pNum = pNum;
		this.mId = mId;
		this.cCount = cCount;
	}
	
	public int getcCartNum() {
		return cCartNum;
	}
	public void setcCartNum(int cCartNum) {
		this.cCartNum = cCartNum;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public int getcCount() {
		return cCount;
	}
	public void setcCount(int cCount) {
		this.cCount = cCount;
	}
	
	
}
