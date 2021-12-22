package test.vo;

public class CategoryVo {

	private int pnum;
	private String pname;
	private int pprice;
	private String code;
	public CategoryVo(int pnum, String pname, int pprice, String code) {
		super();
		this.pnum = pnum;
		this.pname = pname;
		this.pprice = pprice;
		this.code = code;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
