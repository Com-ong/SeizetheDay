package JavaBeans;

import java.sql.Date;

public class ExhibitionBean {
	private int EXHIBITION_SEQ;
	private int USER_SEQ;
	private int CATEGORY_SEQ;
	private int FRAME_SEQ;
	private int PHOTO_SEQ;
	private boolean EXHIBITION_PRIVATE;
	private String EXHIBITION_NAME;
	private String EXHIBITION_TEXT;
	private String EXHIBITION_PROFILE;
	private Date EXHIBITION_START_DATE;
	private Date EXHIBITION_END_DATE;
	
	public int getEXHIBITION_SEQ() {
		return EXHIBITION_SEQ;
	}
	public int getUSER_SEQ() {
		return USER_SEQ;
	}
	public int getCATEGORY_SEQ() {
		return CATEGORY_SEQ;
	}
	public int getFRAME_SEQ() {
		return FRAME_SEQ;
	}
	public int getPHOTO_SEQ() {
		return PHOTO_SEQ;
	}
	public boolean getEXHIBITION_PRIVATE() {
		return EXHIBITION_PRIVATE;
	}
	public String getEXHIBITION_NAME() {
		return EXHIBITION_NAME;
	}
	public String getEXHIBITION_TEXT() {
		return EXHIBITION_TEXT;
	}
	public String getEXHIBITION_PROFILE() {
		return EXHIBITION_PROFILE;
	}
	public Date getEXHIBITION_START_DATE() {
		return EXHIBITION_START_DATE;
	}
	public Date getEXHIBITION_END_DATE() {
		return EXHIBITION_END_DATE;
	}
	
	public void setEXHIBITION_SEQ(int EXHIBITION_SEQ) {
		this.EXHIBITION_SEQ = EXHIBITION_SEQ;
	}
	public void setUSER_SEQ(int USER_SEQ) {
		this.USER_SEQ = USER_SEQ;
	}
	public void setCATEGORY_SEQ(int CATEGORY_SEQ) {
		this.CATEGORY_SEQ = CATEGORY_SEQ;
	}
	public void setFRAME_SEQ(int FRAME_SEQ) {
		this.FRAME_SEQ = FRAME_SEQ;
	}
	public void setPHOTO_SEQ(int PHOTO_SEQ) {
		this.PHOTO_SEQ = PHOTO_SEQ;
	}
	public void setEXHIBITION_PRIVATE(boolean EXHIBITION_PRIVATE) {
		this.EXHIBITION_PRIVATE = EXHIBITION_PRIVATE;
	}
	public void setEXHIBITION_NAME(String EXHIBITION_NAME) {
		this.EXHIBITION_NAME = EXHIBITION_NAME;
	}
	public void setEXHIBITION_TEXT(String EXHIBITION_TEXT) {
		this.EXHIBITION_TEXT = EXHIBITION_TEXT;
	}
	public void setEXHIBITION_PROFILE(String EXHIBITION_PROFILE) {
		this.EXHIBITION_PROFILE = EXHIBITION_PROFILE;
	}
	public void setEXHIBITION_START_DATE(Date EXHIBITION_START_DATE) {
		this.EXHIBITION_START_DATE = EXHIBITION_START_DATE;
	}
	
	public void setEXHIBITION_END_DATE(Date EXHIBITION_END_DATE) {
		this.EXHIBITION_END_DATE = EXHIBITION_END_DATE;
	}
}
