package JavaBeans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
	
	public Vector<ExhibitionBean> getRegisterList() {
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
				bean.setFRAME_SEQ(rs.getInt("FRAME_SEQ"));
				bean.setPHOTO_SEQ(rs.getInt("PHOTO_SEQ"));
				bean.setEXHIBITION_PRIVATE(rs.getBoolean("EXHIBITION_PRIVATE"));
				bean.setEXHIBITION_NAME(rs.getString("EXHIBITION_NAME"));
				bean.setEXHIBITION_TEXT(rs.getString("EXHIBITION_TEXT"));
				bean.setEXHIBITION_PROFILE(rs.getString("EXHIBITION_PROFILE"));
				bean.setEXHIBITION_LIKE_COUNT(rs.getInt("EXHIBITION_LIKE_COUNT"));
				bean.setEXHIBITION_START_DATE(rs.getDate("EXHIBITION_START_DATE"));
				bean.setEXHIBITION_END_DATE(rs.getDate("EXHIBITION_END_DATE"));
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
