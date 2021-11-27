package JavaBeans;

public class PhotoBean {
	private int PHOTO_SEQ;
	private int EXHIBITION_SEQ;
	private String PHOTO_IMAGE;
	private String PHOTO_NAME;
	private String PHOTO_TEXT;
	
	public int getPHOTO_SEQ() {
		return PHOTO_SEQ;
	}
	public void setPHOTO_SEQ(int PHOTO_SEQ) {
		this.PHOTO_SEQ = PHOTO_SEQ;
	}
	public int getEXHIBITION_SEQ() {
		return EXHIBITION_SEQ;
	}
	public void setEXHIBITION_SEQ(int EXHIBITION_SEQ) {
		this.EXHIBITION_SEQ = EXHIBITION_SEQ;
	}
	public String getPHOTO_IMAGE() {
		return PHOTO_IMAGE;
	}
	public void setPHOTO_IMAGE(String PHOTO_IMAGE) {
		this.PHOTO_IMAGE = PHOTO_IMAGE;
	}
	public String getPHOTO_NAME() {
		return PHOTO_NAME;
	}
	public void setPHOTO_NAME(String PHOTO_NAME) {
		this.PHOTO_NAME = PHOTO_NAME;
	}
	public String getPHOTO_TEXT() {
		return PHOTO_TEXT;
	}
	public void setPHOTO_TEXT(String PHOTO_TEXT) {
		this.PHOTO_TEXT = PHOTO_TEXT;
	}
	
	
}
