package JavaBeans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
	
	public Vector<GuestBean> getRegisterList() {
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
}
