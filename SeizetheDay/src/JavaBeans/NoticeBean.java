package JavaBeans;

import java.sql.Date;

public class NoticeBean {
	private int NOTICE_SEQ;
	private int USER_SEQ;
	private String NOTICE_TITLE;
	private String NOTICE_TEXT;
	private Date NOTICE_DATE;

	public void setNOTICE_SEQ(int NOTICE_SEQ)
	{
		this.NOTICE_SEQ = NOTICE_SEQ;
	}
	public void setUSER_SEQ(int USER_SEQ)
	{
		this.USER_SEQ = USER_SEQ;
	}
	public void setNOTICE_TITLE(String NOTICE_TITLE)
	{
		this.NOTICE_TITLE = NOTICE_TITLE;
	}
	public void setNOTICE_TEXT(String NOTICE_TEXT)
	{
		this.NOTICE_TEXT = NOTICE_TEXT;
	}
	public void setNOTICE_DATE(Date NOTICE_DATE)
	{
		this.NOTICE_DATE = NOTICE_DATE;
	}
	
	public int getNOTICE_SEQ() { return NOTICE_SEQ; }
	public int getUSER_SEQ() { return USER_SEQ; }
	public String getNOTICE_TITLE() { return NOTICE_TITLE; }
	public String getNOTICE_TEXT() { return NOTICE_TEXT; }
	public Date getNOTICE_DATE() { return NOTICE_DATE; }
}
