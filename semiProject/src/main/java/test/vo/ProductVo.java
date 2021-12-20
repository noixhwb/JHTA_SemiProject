package test.vo;

public class ProductVo {

	private int pNum;
	private String pName;
	private String pContent;
	private int pPrice;
	private int pByCount;
	private String cName;
	public ProductVo() {}
	public ProductVo(int pNum, String pName, String pContent, int pPrice, int pByCount, String cName) {
		super();
		this.pNum = pNum;
		this.pName = pName;
		this.pContent = pContent;
		this.pPrice = pPrice;
		this.pByCount = pByCount;
		this.cName = cName;
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
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpByCount() {
		return pByCount;
	}
	public void setpByCount(int pByCount) {
		this.pByCount = pByCount;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
}
