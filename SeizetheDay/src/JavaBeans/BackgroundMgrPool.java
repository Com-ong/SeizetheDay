package JavaBeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class BackgroundMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public BackgroundMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error : 커넥션 얻어오기 실패");
		}
	}
	
	public void deleteBackground(int background_seq)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = pool.getConnection();
			String strQuery = "delete from background where BACKGROUND_SEQ = ?";
			
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setInt(1, background_seq);
			
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
	
	public Vector<BackgroundBean> getBackgroundList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector<BackgroundBean> vlist = new Vector<BackgroundBean>();
		
		try {
			conn = pool.getConnection();
			String strQuery = "select * from background";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			while(rs.next()) {
				BackgroundBean bean = new BackgroundBean();
				bean.setBACKGROUND_SEQ(rs.getInt("BACKGROUND_SEQ"));
				bean.setBACKGROUND_COLOR(rs.getString("BACKGROUND_COLOR"));
				vlist.addElement(bean);
			}
		} catch (Exception ex) {
			System.out.println("Exception getBackgroundList " + ex);
		} finally {
			pool.freeConnection(conn);
		}
		
		return vlist;
	}
	
	public BackgroundBean getBackground(int background_seq)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		BackgroundBean bean = null;
		
		try {
			conn = pool.getConnection();
			String strQuery = "select * from background where BACKGROUND_SEQ = background_seq";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			while(rs.next()) {
				bean = new BackgroundBean();
				bean.setBACKGROUND_SEQ(rs.getInt("BACKGROUND_SEQ"));
				bean.setBACKGROUND_COLOR(rs.getString("BACKGROUND_COLOR"));
			}
		} catch (Exception ex) {
			System.out.println("Exception getBackground " + ex);
		}
		
		return bean;
	}
	
	public void insertBackground(/*int background_seq,*/ String background_color)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = pool.getConnection();
			//String strQuery = "insert into background (BACKGROUND_SEQ, BACKGROUND_COLOR) values (?, ?)";
			String strQuery = "insert into background (BACKGROUND_COLOR) values (?)";
			pstmt = conn.prepareStatement(strQuery);
			//pstmt.setInt(1, background_seq);
			pstmt.setString(1, background_color);
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Exception insertBackground " + ex);
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
