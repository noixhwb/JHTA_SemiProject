package test.vo;

public class ProimageVo {

	private int piNum;
	private int pNum;
	private String piFilename;
	private long piFilesize;
	private int imgtype;
	public ProimageVo()
	{
		
	}
	
	public ProimageVo(int piNum, int pNum, String piFilename, long piFilesize,int imgtype) {
		super();
		this.piNum = piNum;
		this.pNum = pNum;
		this.piFilename = piFilename;
		this.piFilesize = piFilesize;
		this.imgtype=imgtype;
	}
	public int getImgtype() {
		return imgtype;
	}

	public void setImgtype(int imgtype) {
		this.imgtype = imgtype;
	}

	public int getPiNum() {
		return piNum;
	}
	public void setPiNum(int piNum) {
		this.piNum = piNum;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getPiFilename() {
		return piFilename;
	}
	public void setPiFilename(String piFilename) {
		this.piFilename = piFilename;
	}
	public long getPiFilesize() {
		return piFilesize;
	}
	public void setPiFilesize(long piFilesize) {
		this.piFilesize = piFilesize;
	}
	

}
