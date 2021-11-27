package JavaBeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import JavaBeans.DBConnectionMgr;
import JavaBeans.UserBean;

public class UserMgrPool {

	private DBConnectionMgr pool;
	
	public UserMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ID 중복확인
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select USER_ID from userinfo where USER_ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	// 회원가입
	public boolean insertUser(UserBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert userinfo(USER_SEQ,USER_NAME,USER_ID,USER_PW,USER_EMAIL,USER_PROFILE,USER_ROLE"
					+ ")values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getUSER_SEQ());
			pstmt.setString(2, bean.getUSER_NAME());
			pstmt.setString(3, bean.getUSER_ID());
			pstmt.setString(4, bean.getUSER_PW());
			pstmt.setString(5, bean.getUSER_EMAIL());
			pstmt.setString(6, bean.getUSER_PROFILE());
			pstmt.setBoolean(7, bean.getUSER_ROLE());
			
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// 로그인
		public boolean loginUser(String USER_ID, String USER_PW) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "select USER_ID from userinfo where USER_ID = ? and USER_PW = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, USER_ID);
				pstmt.setString(2, USER_PW);
				rs = pstmt.executeQuery();
				flag = rs.next();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return flag;
		}
	//임시, 수정예정
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
