package JavaBeans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.util.Vector;


public class GuestMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public GuestMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error : 커넥션 얻어오기 실패");
		}
	}
	
	public Vector<GuestBean> getGuestList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector<GuestBean> vlist = new Vector<GuestBean>();
		try {
			conn = pool.getConnection();
			String strQuery = "select * from guest";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			
			while(rs.next()) {
				GuestBean bean = new GuestBean();
				bean.setBOARD_SEQ(rs.getInt("BOARD_SEQ"));
				bean.setUSER_SEQ(rs.getInt("USER_SEQ"));
				bean.setBOARD_TEXT(rs.getString("BOARD_TEXT"));
				bean.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				bean.setEXHIBITION_SEQ(rs.getInt("EXHIBITION_SEQ"));
				vlist.addElement(bean);
			}
		} catch (Exception ex) {
			System.out.println("Exception " + ex);
		} finally {
			pool.freeConnection(conn);
		}
		
		return vlist;
	}
	
	public void insertGuest(int board_seq, int user_seq, String board_text, Date board_date, int exhibition_seq)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = pool.getConnection();
			String strQuery = "insert into guest (BOARD_SEQ, USER_SEQ, BOARD_TEXT, BOARD_DATE, EXHIBITION_SEQ) values (?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setInt(1, board_seq);
			pstmt.setInt(2, user_seq);
			pstmt.setString(3, board_text);
			pstmt.setDate(4, board_date);
			pstmt.setInt(5, exhibition_seq);
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Exception insertGuest " + ex);
		} finally {
			try {
				pstmt.close();
				pool.freeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void deleteGuest(int board_seq)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = pool.getConnection();
			String strQuery = "delete from guest where BOARD_SEQ = ?";
			
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setInt(1, board_seq);
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Exception deleteGuest " + ex);
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
