package JavaBeans;

public class ExhibitionBean {
	
	private int exhibition_seq;
	private int member_seq;
	private String exhibition_name;
	private String exhibition_text;
	private String exhibition_profile;
	private int frame_seq;
	private int exhibition_like_cnt;
	private String exhibition_start_date;
	private String exhibition_end_date;
	private int photo_seq;
	private int category_seq;
	
	public int getExhibition_seq() {
		return exhibition_seq;
	}
	public void setExhibition_seq(int exhibition_seq) {
		 this.exhibition_seq=exhibition_seq;
	}
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq= member_seq;
	}
	public String getExhibition_name() {
		return exhibition_name;
	}
	public void setExhibition_name(String exhibition_name) {
		this.exhibition_name = exhibition_name;
	}
	public String getExhibition_text() {
		return exhibition_text;
	}
	public void setExhibition_text(String exhibition_text) {
		this.exhibition_text = exhibition_text;
	}
	public String getExhibition_profile() {
		return exhibition_profile;
	}
	public void setExhibition_profile(String exhibition_profile) {
		this.exhibition_profile = exhibition_profile;
	}
	public int getFrame_seq() {
		return frame_seq;
	}
	public void setFrame_seq(int frame_seq) {
		this.frame_seq = frame_seq;
	}
	public int getExhibition_like_cnt() {
		return exhibition_like_cnt;
	}
	public void setExhibition_like_cnt(int exhibition_like_cnt) {
		this.exhibition_like_cnt = exhibition_like_cnt;
	}
	public String getExhibition_start_date() {
		return exhibition_start_date;
	}
	public void setExhibition_start_date(String exhibition_start_date) {
		this.exhibition_start_date = exhibition_start_date;
	}
	public String getExhibition_end_date() {
		return exhibition_end_date;
	}
	public void setExhibition_end_date(String exhibition_end_date) {
		this.exhibition_end_date = exhibition_end_date;
	}
	public int getPhoto_seq() {
		return photo_seq;
	}
	public void setPhoto_seq(int photo_seq) {
		this.photo_seq = photo_seq;
	}
	public int getCategory_seq() {
		return category_seq;
	}
	public void setCategory_seq(int category_seq) {
		this.category_seq = category_seq;
	}
}
