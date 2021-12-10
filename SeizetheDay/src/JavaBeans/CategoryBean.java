package JavaBeans;

public class CategoryBean {
	private int CATEGORY_SEQ;
	private String CATEGORY_NAME;
	
	public void setCATEGORY_SEQ(int CATEGORY_SEQ)
	{
		this.CATEGORY_SEQ = CATEGORY_SEQ;
	}
	public void setCATEGORY_NAME(String CATEGORY_NAME)
	{
		this.CATEGORY_NAME = CATEGORY_NAME;
	}
	public int getCATEGORY_SEQ()
	{
		return CATEGORY_SEQ;
	}
	public String getCATEGORY_NAME()
	{
		return CATEGORY_NAME;
	}
}
