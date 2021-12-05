package JavaBeans;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	public Vector<ReviewBean> getReviewList() {
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
	
	public void insertReview(int commentSeq, int userSeq, int exhibitionSeq, Date commentDate, String commentText) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = pool.getConnection();
			String strQuery = "insert into review(COMMENT_SEQ, USER_SEQ, EXHIBITION_SEQ, COMMENT_DATE, COMMENT_TEXT)"
					+ " values (?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setInt(1, commentSeq);
			pstmt.setInt(2,  userSeq);
			pstmt.setInt(3, exhibitionSeq);
			pstmt.setDate(4, commentDate);
			pstmt.setString(5, commentText);
			
			pstmt.executeUpdate();
		}
		catch(Exception ex) {
			System.out.println("Exception insertReview " + ex);
		}
		finally {
			try {
				pstmt.close();
				pool.freeConnection(conn);
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void deleteGuest(int commentSeq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = pool.getConnection();
			String strQuery = "delete from review where COMMENT_SEQ = ?";
			
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setInt(1,  commentSeq);
			
			pstmt.executeUpdate();
		}
		catch(Exception ex) {
			System.out.println("Exception deleteGuest " + ex);
		}
		finally {
			try {
				pstmt.close();
				pool.freeConnection(conn);
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
