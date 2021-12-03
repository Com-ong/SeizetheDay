package JavaBeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class PhotoMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public PhotoMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error : 커넥션 얻어오기 실패");
		}
	}
	
	public Vector<PhotoBean> getPhotoList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector<PhotoBean> vlist = new Vector<PhotoBean>();
		try {
			conn = pool.getConnection();
			String strQuery = "select * from photo";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			while(rs.next()) {
				PhotoBean bean = new PhotoBean();
				bean.setPHOTO_SEQ(rs.getInt("PHOTO_SEQ"));
				bean.setEXHIBITION_SEQ(rs.getInt("EXHIBITION_SEQ"));
				bean.setPHOTO_IMAGE(rs.getString("PHOTO_IMAGE"));
				bean.setPHOTO_NAME(rs.getString("PHOTO_NAME"));
				bean.setPHOTO_TEXT(rs.getString("PHOTO_TEXT"));	
				vlist.addElement(bean);
			}
		} catch (Exception ex) {
			System.out.println("Exception getPhotoList " + ex);
		} finally {
			pool.freeConnection(conn);
		}
		
		return vlist;
	}
	
	public PhotoBean getPhoto(int exhibition_seq)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PhotoBean bean = null;
		//PhotoBean pb = new PhotoBean();
		try {
			conn = pool.getConnection();
			String strQuery = "select * from photo where EXHIBITION_SEQ = exhibition_seq";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			while(rs.next()) {
				bean = new PhotoBean();
				bean.setPHOTO_SEQ(rs.getInt("PHOTO_SEQ"));
				bean.setEXHIBITION_SEQ(rs.getInt("EXHIBITION_SEQ"));
				bean.setPHOTO_IMAGE(rs.getString("PHOTO_IMAGE"));
				bean.setPHOTO_NAME(rs.getString("PHOTO_NAME"));
				bean.setPHOTO_TEXT(rs.getString("PHOTO_TEXT"));	
			}
		} catch (Exception ex) {
			System.out.println("Exception getPhoto " + ex);
		}
		
		return bean;
	}
	
	public void insertPhoto(int photo_seq, int exhibition_seq, String photo_image, String photo_name, String photo_text)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = pool.getConnection();
			String strQuery = "insert into photo (PHOTO_SEQ, EXHIBITION_SEQ, PHOTO_IMAGE, PHOTO_NAME, PHOTO_TEXT) values (?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setInt(1, photo_seq);
			pstmt.setInt(2, exhibition_seq);
			pstmt.setString(3, photo_image);
			pstmt.setString(4, photo_name);
			pstmt.setString(5, photo_text);
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Exception insertPhoto " + ex);
		} finally {
			try {
				pstmt.close();
				pool.freeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}