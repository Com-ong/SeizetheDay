package JavaBeans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class UserMgrPool {

	private DBConnectionMgr pool = null;
	
	public UserMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error : 커넥션 얻어오기 실패");
		}
	}
	
	public Vector<UserBean> getRegisterList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector<UserBean> vlist = new Vector<UserBean>();
		try {
			conn = pool.getConnection();
			String strQuery = "select * from userinfo";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			while(rs.next()) {
				UserBean bean = new UserBean();
				bean.setUSER_SEQ(rs.getInt("USER_SEQ"));
				bean.setUSER_ID(rs.getString("USER_ID"));
				bean.setUSER_PW(rs.getString("USER_PW"));
				bean.setUSER_NAME(rs.getString("USER_NAME"));
				bean.setUSER_EMAIL(rs.getString("USER_EMAIL"));
				bean.setUSER_PROFILE(rs.getString("USER_PROFILE"));
				bean.setUSER_ROLE(rs.getBoolean("USER_ROLE"));
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
