package JavaBeans;

import java.sql.Date;

public class InquiryBean {
	
	private int INQUIRY_SEQ;
	public int getINQUIRY_SEQ() {
		return INQUIRY_SEQ;
	}
	public void setINQUIRY_SEQ(int iNQUIRY_SEQ) {
		INQUIRY_SEQ = iNQUIRY_SEQ;
	}
	public int getUSER_SEQ() {
		return USER_SEQ;
	}
	public void setUSER_SEQ(int uSER_SEQ) {
		USER_SEQ = uSER_SEQ;
	}
	public String getINQUIRY_TITLE() {
		return INQUIRY_TITLE;
	}
	public void setINQUIRY_TITLE(String iNQUIRY_TITLE) {
		INQUIRY_TITLE = iNQUIRY_TITLE;
	}
	public String getINQUIRY_TEXT() {
		return INQUIRY_TEXT;
	}
	public void setINQUIRY_TEXT(String iNQUIRY_TEXT) {
		INQUIRY_TEXT = iNQUIRY_TEXT;
	}
	public Date getINQUIRY_DATE() {
		return INQUIRY_DATE;
	}
	public void setINQUIRY_DATE(Date iNQUIRY_DATE) {
		INQUIRY_DATE = iNQUIRY_DATE;
	}
	private int USER_SEQ;
	private String INQUIRY_TITLE;
	private String INQUIRY_TEXT;
	private Date INQUIRY_DATE;
	
}
