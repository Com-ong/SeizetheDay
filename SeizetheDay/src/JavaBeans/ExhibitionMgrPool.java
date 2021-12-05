package JavaBeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.util.Vector;


public class ExhibitionMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public ExhibitionMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error : 커넥션 얻어오기 실패");
		}
	}
	
	public Vector<ExhibitionBean> getExhibitionList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector<ExhibitionBean> vlist = new Vector<ExhibitionBean>();
		try {
			conn = pool.getConnection();
			String strQuery = "select * from exhibition";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			while(rs.next()) {
				ExhibitionBean bean = new ExhibitionBean();
				bean.setEXHIBITION_SEQ(rs.getInt("EXHIBITION_SEQ"));
				bean.setUSER_SEQ(rs.getInt("USER_SEQ"));
				bean.setCATEGORY_SEQ(rs.getInt("CATEGORY_SEQ"));
				bean.setBACKGROUND_SEQ(rs.getInt("BACKGROUND_SEQ"));
				bean.setPHOTO_SEQ(rs.getInt("PHOTO_SEQ"));
				bean.setEXHIBITION_PRIVATE(rs.getBoolean("EXHIBITION_PRIVATE"));
				bean.setEXHIBITION_NAME(rs.getString("EXHIBITION_NAME"));
				bean.setEXHIBITION_TEXT(rs.getString("EXHIBITION_TEXT"));
				bean.setEXHIBITION_PROFILE(rs.getString("EXHIBITION_PROFILE"));
				bean.setEXHIBITION_START_DATE(rs.getDate("EXHIBITION_START_DATE"));
				bean.setEXHIBITION_END_DATE(rs.getDate("EXHIBITION_END_DATE"));
				vlist.addElement(bean);
			}
		} catch (Exception ex) {
			System.out.println("Exception getExhibitionList " + ex);
		} finally {
			pool.freeConnection(conn);
		}
		
		return vlist;
	}
	
	public ExhibitionBean findWithExhibitionSeq(int exhibition_seq)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ExhibitionBean bean = null;
		
		try {
			conn = pool.getConnection();
			String strQuery = "select * from exhibition where EXHIBITION_SEQ = '" + exhibition_seq + "'";
			stmt = conn.createStatement();
			/*pstmt = conn.prepareStatement(strQuery);
			pstmt.setInt(1, exhibition_seq);*/
			rs = stmt.executeQuery(strQuery);
			if(rs.next()==true) rs.previous();
			while(rs.next()) {
				   	bean = new ExhibitionBean();
					bean.setEXHIBITION_SEQ(rs.getInt("EXHIBITION_SEQ"));
		            bean.setUSER_SEQ(rs.getInt("USER_SEQ"));
		            bean.setCATEGORY_SEQ(rs.getInt("CATEGORY_SEQ"));
		            bean.setBACKGROUND_SEQ(rs.getInt("BACKGROUND_SEQ"));
		            bean.setPHOTO_SEQ(rs.getInt("PHOTO_SEQ"));
		            bean.setEXHIBITION_PRIVATE(rs.getBoolean("EXHIBITION_PRIVATE"));
		            bean.setEXHIBITION_NAME(rs.getString("EXHIBITION_NAME"));
		            bean.setEXHIBITION_TEXT(rs.getString("EXHIBITION_TEXT"));
		            bean.setEXHIBITION_PROFILE(rs.getString("EXHIBITION_PROFILE"));
		            bean.setEXHIBITION_START_DATE(rs.getDate("EXHIBITION_START_DATE"));
		            bean.setEXHIBITION_END_DATE(rs.getDate("EXHIBITION_END_DATE"));
				}
		} catch (Exception ex) {
			System.out.println("Exception findWithExhibitionSeq " + ex);
		} finally {
			try {
				stmt.close();
				pool.freeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return bean;
	}
	
	public void updatePhoto(int exhibition_seq, int photo_seq)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = pool.getConnection();
			String strQuery = "update exhibition set PHOTO_SEQ = ? where EXHIBITION_SEQ = ?";
			
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setInt(1, exhibition_seq);
			pstmt.setInt(2, photo_seq);
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Exception updatePhoto " + ex);
		} finally {
			try {
				pstmt.close();
				pool.freeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void insertExhibition(/*int exhibition_seq, */int user_seq, int category_seq, int background_seq, int photo_seq, boolean exhibition_private, 
			String exhibition_name, String exhibition_text, String exhibition_profile, Date exhibition_start_date, Date exhibition_end_date)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = pool.getConnection();
			// String strQuery = "insert into exhibition (EXHIBITION_SEQ, USER_SEQ, CATEGORY_SEQ, BACKGROUND_SEQ, PHOTO_SEQ, EXHIBITION_PRIVATE, EXHIBITION_NAME, EXHIBITION_TEXT, EXHIBITION_PROFILE, EXHIBITION_START_DATE, EXHIBITION_END_DATE) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			String strQuery = "insert into exhibition (USER_SEQ, CATEGORY_SEQ, BACKGROUND_SEQ, PHOTO_SEQ, EXHIBITION_PRIVATE, EXHIBITION_NAME, EXHIBITION_TEXT, EXHIBITION_PROFILE, EXHIBITION_START_DATE, EXHIBITION_END_DATE) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(strQuery);
			//pstmt.setInt(1, exhibition_seq);
			pstmt.setInt(1, user_seq);
			pstmt.setInt(2, category_seq);
			pstmt.setInt(3, background_seq);
			pstmt.setInt(4, photo_seq);
			pstmt.setBoolean(5, exhibition_private);
			pstmt.setString(6, exhibition_name);
			pstmt.setString(7, exhibition_text);
			pstmt.setString(8, exhibition_profile);
			pstmt.setDate(9, exhibition_start_date);
			pstmt.setDate(10, exhibition_end_date);
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Exception insertExhibition " + ex);
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
