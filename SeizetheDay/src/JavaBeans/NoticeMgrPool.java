package JavaBeans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class NoticeMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public NoticeMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error : 커넥션 얻어오기 실패");
		}
	}
	
	public Vector<NoticeBean> getNoticeList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector<NoticeBean> vlist = new Vector<NoticeBean>();
		try {
			conn = pool.getConnection();
			String strQuery = "select * from notice";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			
			while(rs.next()) {
				NoticeBean bean = new NoticeBean();
				bean.setUSER_SEQ(rs.getInt("USER_SEQ"));
				bean.setNOTICE_SEQ(rs.getInt("NOTICE_SEQ"));
				bean.setNOTICE_TITLE(rs.getString("NOTICE_TITLE"));
				bean.setNOTICE_TEXT(rs.getString("NOTICE_TEXT"));
				bean.setNOTICE_DATE(rs.getDate("NOTICE_DATE"));
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
