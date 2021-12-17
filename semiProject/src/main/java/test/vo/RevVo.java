package test.vo;

import java.sql.Date;

public class RevVo {
	private String pName;
	private String proSize;
	private int pdNum;
	private int coNum;
	private int odNum;
	private String cScore;
	private String content;
	private String mid;
	private Date cDate;
	
	public RevVo(String pName, String proSize, int pdNum, int coNum, int odNum, String cScore, String content,
			String mid, Date cDate) {
		super();
		this.pName = pName;
		this.proSize = proSize;
		this.pdNum = pdNum;
		this.coNum = coNum;
		this.odNum = odNum;
		this.cScore = cScore;
		this.content = content;
		this.mid = mid;
		this.cDate = cDate;
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
	public int getCoNum() {
		return coNum;
	}
	public void setCoNum(int coNum) {
		this.coNum = coNum;
	}
	public int getOdNum() {
		return odNum;
	}
	public void setOdNum(int odNum) {
		this.odNum = odNum;
	}
	public String getcScore() {
		return cScore;
	}
	public void setcScore(String cScore) {
		this.cScore = cScore;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	
	
}
