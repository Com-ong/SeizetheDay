package JavaBeans;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//import swcho_training_ch15.UtilMgr;

public class NoticeMgrPool {
	
	private DBConnectionMgr pool = null;
	private static final String  SAVEFOLDER = "C:/Jsp/myapp/WebContent/ch15/fileupload";
	private static final String ENCTYPE = "EUC-KR";
	private static int MAXSIZE = 5*1024*1024;
	
	public NoticeMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Error : Ŀ�ؼ� ������ ����");
		}
	}
	
	public boolean insertNotice(NoticeBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		System.out.println(bean.getUSER_SEQ());
		try {
			con = pool.getConnection();
			sql = "insert notice(NOTICE_SEQ,USER_SEQ,NOTICE_TITLE,NOTICE_TEXT,NOTICE_DATE"
					+ ")values(?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNOTICE_SEQ());
			pstmt.setInt(2, bean.getUSER_SEQ());
			pstmt.setString(3, bean.getNOTICE_TITLE());
			pstmt.setString(4, bean.getNOTICE_TEXT());
			//pstmt.setString(5, bean.getNOTICE_DATE());
			
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
//	// 게시글 작성
//		public void insertBoard(HttpServletRequest req) {
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			String sql = null;
//			MultipartRequest multi = null;
//			int NOTICE_SEQ=0;
//			int USER_SEQ=0;
//			try {
//				con = pool.getConnection();
//				sql = "select max(NOTICE_SEQ) from notice";
//				pstmt = con.prepareStatement(sql);
//				rs = pstmt.executeQuery();
//				
//				int ref = 1;
//				if (rs.next())
//				USER_SEQ=
//				ref = rs.getInt(1) + 1;
//				File file = new File(SAVEFOLDER);
//				if (!file.exists())
//					file.mkdirs();
//				multi = new MultipartRequest(req, SAVEFOLDER,MAXSIZE, ENCTYPE,
//						new DefaultFileRenamePolicy());
//				
//				//String content = multi.getParameter("NOTICE_TEXT");
//				sql = "insert notice(NOTICE_SEQ,USER_SEQ,NOTICE_TITLE,NOTICE_TEXT,NOTICE_DATE)";
//				sql += "values(?, ?, ?, ?, now())";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setInt(1, Integer.parseInt(multi.getParameter(NOTICE_SEQ)));
//				pstmt.setInt(2, multi.getParameter(USER_SEQ));
//				pstmt.setString(3, multi.getParameter("NOTICE_TITLE"));//setInt로 해야 하는데..
//				pstmt.setString(4,multi.getParameter("NOTICETEXT"));
//				
//				//pstmt.setString(3, multi.getParameter("subject"));
//				//pstmt.setString(5, multi.getParameter("pass"));
//				//pstmt.setString(6, multi.getParameter("ip"));
//				pstmt.executeUpdate();
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				pool.freeConnection(con, pstmt, rs);
//			}
//		}
//	
		//게시글 작성시 user_id로 User_seq 불러오기 
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
		
		//게시글 관람 시 작성자의 이름 불러오기
		public String getUSER_NAME(int USER_SEQ) {
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			String USER_NAME=null;
			System.out.println(USER_SEQ);
			try {
				conn = pool.getConnection();
				String strQuery = "select USER_NAME from userinfo where USER_SEQ = '"+USER_SEQ+"'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(strQuery);
				
				if(rs.next()) {
					USER_NAME=rs.getString("USER_NAME");
				}
			} catch (Exception ex) {
				System.out.println("Exception " + ex);
			} finally {
				pool.freeConnection(conn);
			}
			System.out.println(USER_NAME);
			return USER_NAME;
		}
		
		/*public int getUSER_SEQ(HttpServletRequest request) {
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			int USER_SEQ_KEY=0;
			try {
				conn = pool.getConnection();
				String strQuery = "select USER_SEQ from notice where USER_ID = ?";
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
		}*/
		
		
		
		
		
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
