package JavaBeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class InquiryMgrPool {
private DBConnectionMgr pool = null;
	
	public InquiryMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error : Ŀ�ؼ� ������ ����");
		}
	}
	

	public boolean insertInquiry(InquiryBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		System.out.println(bean.getUSER_SEQ());
		try {
			con = pool.getConnection();
			sql = "insert inquiry(INQUIRY_SEQ,USER_SEQ,INQUIRY_TITLE,INQUIRY_TEXT,INQUIRY_DATE"
					+ ")values(?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getINQUIRY_SEQ());
			pstmt.setInt(2, bean.getUSER_SEQ());
			pstmt.setString(3, bean.getINQUIRY_TITLE());
			pstmt.setString(4, bean.getINQUIRY_TEXT());
			//pstmt.setString(5, bean.getINQUIRY_DATE());
			
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public int getUSER_SEQ(String USER_ID) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int USER_SEQ_KEY=0;
		try {
			conn = pool.getConnection();
			String strQuery = "select USER_SEQ from userinfo where USER_ID = '"+USER_ID+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			
			if(rs.next()) {
				USER_SEQ_KEY=rs.getInt("USER_SEQ");
			}
		} catch (Exception ex) {
			System.out.println("Exception " + ex);
		} finally {
			pool.freeConnection(conn);
		}
		
		return USER_SEQ_KEY;
	}
}
