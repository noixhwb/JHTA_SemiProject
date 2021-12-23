package test.vo;

import java.sql.Date;

public class RevprodVo {
	private int pNum;
	private String cScore;
	private String content;
	private String mid;
	private Date cDate;
	
	public RevprodVo(int pNum, String cScore, String content, String mid, Date cDate) {
		super();
		this.pNum = pNum;
		this.cScore = cScore;
		this.content = content;
		this.mid = mid;
		this.cDate = cDate;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
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
