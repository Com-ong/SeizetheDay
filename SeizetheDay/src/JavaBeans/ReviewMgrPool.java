package JavaBeans;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class ReviewMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public ReviewMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error : 커넥션 얻어오기 실패");
		}
	}
	
	public Vector<ReviewBean> getRegisterList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector<ReviewBean> vlist = new Vector<ReviewBean>();
		try {
			conn = pool.getConnection();
			String strQuery = "select * from review";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			
			while(rs.next()) {
				ReviewBean bean = new ReviewBean();
				bean.setCommentSeq(rs.getInt("COMMENT_SEQ"));
				bean.setUserSeq(rs.getInt("USER_SEQ"));
				bean.setExhibitionSeq(rs.getInt("EXHIBITION_SEQ"));
				bean.setCommentDate(rs.getDate("COMMENT_DATE"));
				bean.setCommentText(rs.getString("COMMENT_TEXT"));
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
