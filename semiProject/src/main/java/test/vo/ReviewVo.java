package test.vo;

import java.sql.Date;

public class ReviewVo {
	private int coNum;
	private int odNum;
	private String cScore;
	private String content;
	private String mid;
	private Date cDate;
	
	public ReviewVo(int coNum, int odNum, String cScore, String content, String mid, Date cDate) {
		super();
		this.coNum = coNum;
		this.odNum = odNum;
		this.cScore = cScore;
		this.content = content;
		this.mid = mid;
		this.cDate = cDate;
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
