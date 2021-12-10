package test.vo;

import java.sql.Date;

public class AdminVo {

	private String aId;
	private String aPwd;
	private int alevel;
	private Date regdate;
	
	public AdminVo() {}


	public AdminVo(String aId, String aPwd, int alevel, Date regdate) {
		super();
		this.aId = aId;
		this.aPwd = aPwd;
		this.alevel = alevel;
		this.regdate = regdate;
	}


	public String getaId() {
		return aId;
	}


	public void setaId(String aId) {
		this.aId = aId;
	}


	public String getaPwd() {
		return aPwd;
	}


	public void setaPwd(String aPwd) {
		this.aPwd = aPwd;
	}


	public int getAlevel() {
		return alevel;
	}


	public void setAlevel(int alevel) {
		this.alevel = alevel;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}	
	
}
