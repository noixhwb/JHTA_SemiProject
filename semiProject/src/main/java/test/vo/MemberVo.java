package test.vo;

import java.sql.Date;

public class MemberVo {
	private String mid;
	private String mpwd;
	private String mname;
	private String maddr;
	private String mphone;
	private Date regdate;
	
	public MemberVo() {}

	public MemberVo(String mid, String mpwd, String mname, String maddr, String mphone, int mstate , Date regdate) {
		this.mid = mid;
		this.mpwd = mpwd;
		this.mname = mname;
		this.maddr = maddr;
		this.mphone = mphone;
		this.regdate = regdate;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
