package JavaBeans;

import java.sql.Date;

public class GuestBean {
	private int BOARD_SEQ;
	private int USER_SEQ;
	private String BOARD_TEXT;
	private Date BOARD_DATE;
	private int EXHIBITION_SEQ;
	
	public void setBOARD_SEQ(int BOARD_SEQ)
	{
		this.BOARD_SEQ = BOARD_SEQ;
	}
	public void setUSER_SEQ(int USER_SEQ)
	{
		this.USER_SEQ = USER_SEQ;
	}
	public void setBOARD_TEXT(String BOARD_TEXT)
	{
		this.BOARD_TEXT = BOARD_TEXT;
	}
	public void setBOARD_DATE(Date BOARD_DATE)
	{
		this.BOARD_DATE = BOARD_DATE;
	}
	public void setEXHIBITION_SEQ(int EXHIBITION_SEQ)
	{
		this.EXHIBITION_SEQ = EXHIBITION_SEQ;
	}
	
	public int getBOARD_SEQ() { return BOARD_SEQ; }
	public int getUSER_SEQ() { return USER_SEQ; }
	public String getBOARD_TEXT() { return BOARD_TEXT; }
	public Date getBOARD_DATE() { return BOARD_DATE; }
	public int getEXHIBITION_SEQ() { return EXHIBITION_SEQ; }
}
