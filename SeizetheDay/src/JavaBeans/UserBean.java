package JavaBeans;

public class UserBean {
	private int USER_SEQ;
	private String USER_NAME;
	private String USER_ID;
	private String USER_PW;
	private String USER_EMAIL;
	private String USER_PROFILE;
	private boolean USER_ROLE;
	
	public void setUSER_SEQ(int USER_SEQ)
	{
		this.USER_SEQ = USER_SEQ;
	}
	public void setUSER_NAME(String USER_NAME)
	{
		this.USER_NAME = USER_NAME;
	}
	public void setUSER_ID(String USER_ID)
	{
		this.USER_ID = USER_ID;
	}
	public void setUSER_PW(String USER_PW)
	{
		this.USER_PW = USER_PW;
	}
	public void setUSER_EMAIL(String USER_EMAIL)
	{
		this.USER_EMAIL = USER_EMAIL;
	}
	public void setUSER_PROFILE(String USER_PROFILE)
	{
		this.USER_PROFILE = USER_PROFILE;
	}
	public void setUSER_ROLE(boolean USER_ROLE)
	{
		this.USER_ROLE = USER_ROLE;
	}
	
	public int getUSER_SEQ() { return USER_SEQ; }
	public String getUSER_NAME() { return USER_NAME; }
	public String getUSER_ID() { return USER_ID; }
	public String getUSER_PW() { return USER_PW; }
	public String getUSER_EMAIL() { return USER_EMAIL; }
	public String getUSER_PROFILE() { return USER_PROFILE; }
	public boolean getUSER_ROLE() { return USER_ROLE; }
}
