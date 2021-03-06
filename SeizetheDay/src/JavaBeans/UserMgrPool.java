package JavaBeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

   // mypage에서 user 가져오기
   public UserBean getUser(String id) {
	   
     Connection con = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     UserBean bean = null;
     try {
        con = pool.getConnection();
        String sql = "select * from userinfo where USER_ID = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if (rs.next()) {
           bean = new UserBean();
           bean.setUSER_SEQ(rs.getInt("USER_SEQ"));
           bean.setUSER_ID(rs.getString("USER_ID"));
           bean.setUSER_PW(rs.getString("USER_PW"));
           bean.setUSER_NAME(rs.getString("USER_NAME"));
           bean.setUSER_EMAIL(rs.getString("USER_EMAIL"));
           bean.setUSER_PROFILE(rs.getString("USER_PROFILE"));
           bean.setUSER_ROLE(rs.getBoolean("USER_ROLE"));
        }
     } catch (Exception e) {
        e.printStackTrace();
     } finally {
        pool.freeConnection(con);
     }
     return bean;
  }
   
   // user_seq로 userbean 찾기
   public UserBean findUserWithSeq(int user_seq)
   {
	   Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		UserBean bean = null;
		
		try {
			conn = pool.getConnection();
			String strQuery = "select * from userinfo where USER_SEQ = '" + user_seq + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			if(rs.next()==true) rs.previous(); 
			while(rs.next()) {
				bean = new UserBean();
				bean.setUSER_SEQ(rs.getInt("USER_SEQ"));
	            bean.setUSER_ID(rs.getString("USER_ID"));
	            //System.out.println(rs.getString("USER_ID"));
	            bean.setUSER_PW(rs.getString("USER_PW"));
	            bean.setUSER_NAME(rs.getString("USER_NAME"));
	            bean.setUSER_EMAIL(rs.getString("USER_EMAIL"));
	            bean.setUSER_PROFILE(rs.getString("USER_PROFILE"));
	            bean.setUSER_ROLE(rs.getBoolean("USER_ROLE"));
			}
		} catch (Exception ex) {
			System.out.println("Exception findUserSeq " + ex);
		}
		
		return bean;
   }
   
   // mypage 정보 수정하면 db update하기
   public boolean updateUser(UserBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "update userinfo set USER_NAME = ?, USER_PW = ?, USER_EMAIL = ? where USER_ID = ?";
			pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, bean.getUSER_NAME());
	        pstmt.setString(2, bean.getUSER_PW());
	        pstmt.setString(3, bean.getUSER_EMAIL());
	        pstmt.setString(4, bean.getUSER_ID());
	        
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}	

   //mypage에서 회원탈퇴
   public int deleteUser(String id, String pw) 
   {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       UserBean bean = null;

       String dbpw = ""; // DB상의 비밀번호를 담아둘 변수
       int x = -1;

       try {
           conn = pool.getConnection();
    	   String sql = "select USER_PW, USER_ID from userinfo where USER_ID = ?";

           // 회원 삭제
    	   String sql1 = "set foreign_key_checks = 0";
    	   String sql2 = "DELETE FROM userinfo WHERE USER_ID = ?";
    	   String sql3 = "set foreign_key_checks = 1";
    	   
           pstmt = conn.prepareStatement(sql); 
           pstmt.setString(1, id);
           
           rs = pstmt.executeQuery();
           
           if (rs.next()) 
           {
        	   bean = new UserBean();
               bean.setUSER_ID(rs.getString("USER_ID"));
               bean.setUSER_PW(rs.getString("USER_PW"));
               
               dbpw = bean.getUSER_PW();
               if (dbpw.equals(pw)) 
               {
                   pstmt = conn.prepareStatement(sql1);
                   pstmt.executeUpdate();
                   
                   pstmt = conn.prepareStatement(sql2);
                   pstmt.setString(1, id);
                   pstmt.executeUpdate();
                       
                   pstmt = conn.prepareStatement(sql3);
                   pstmt.executeUpdate();
                   x = 1;
               } else {
                   x = 0; // 비밀번호 비교결과 다름
               }
           }
           return x;
           
       } catch (Exception e) {
           e.printStackTrace();
       } finally {
          pool.freeConnection(conn);
       }
       return -1;
    }
   
 
   // 아이디로 사용자 찾기
   public UserBean findWithID(String id)
   {
	   Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		UserBean bean = null;
		
		try {
			conn = pool.getConnection();
			String strQuery = "select * from userinfo where USER_ID = '" + id + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			if(rs.next()==true) rs.previous(); 
			while(rs.next()) {
				bean = new UserBean();
				bean.setUSER_SEQ(rs.getInt("USER_SEQ"));
	            bean.setUSER_ID(rs.getString("USER_ID"));
	            //System.out.println(rs.getString("USER_ID"));
	            bean.setUSER_PW(rs.getString("USER_PW"));
	            bean.setUSER_NAME(rs.getString("USER_NAME"));
	            bean.setUSER_EMAIL(rs.getString("USER_EMAIL"));
	            bean.setUSER_PROFILE(rs.getString("USER_PROFILE"));
	            bean.setUSER_ROLE(rs.getBoolean("USER_ROLE"));
			}
		} catch (Exception ex) {
			System.out.println("Exception findUserSeq " + ex);
		}
		
		return bean;
   }
   
   // ID 찾기
   public UserBean findUserID(String name, String email)
   {
	   Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		UserBean bean = null;
		
		try {
			conn = pool.getConnection();
			String strQuery = "select * from userinfo where USER_NAME = '" + name + "' and USER_EMAIL = '" + email + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			if(rs.next()==true) rs.previous(); 
			while(rs.next()) {
				bean = new UserBean();
				bean.setUSER_SEQ(rs.getInt("USER_SEQ"));
	            bean.setUSER_ID(rs.getString("USER_ID"));
	            //System.out.println(rs.getString("USER_ID"));
	            bean.setUSER_PW(rs.getString("USER_PW"));
	            bean.setUSER_NAME(rs.getString("USER_NAME"));
	            bean.setUSER_EMAIL(rs.getString("USER_EMAIL"));
	            bean.setUSER_PROFILE(rs.getString("USER_PROFILE"));
	            bean.setUSER_ROLE(rs.getBoolean("USER_ROLE"));
			}
		} catch (Exception ex) {
			System.out.println("Exception findUserSeq " + ex);
		}
		
		return bean;
   }
   
   // PW 찾기 - 사용자 찾기
   public UserBean findUserPW(String id, String name, String email)
   {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   UserBean bean = null;
	   
	   try {
		   conn = pool.getConnection();
		   String strQuery = "select * from userinfo where USER_ID = '" + id + "' and USER_NAME = '" + name + "' and USER_EMAIL = '" + email + "'";
		   stmt = conn.createStatement();
		   rs = stmt.executeQuery(strQuery);
		   if(rs.next()==true) rs.previous(); 
		   while(rs.next()) {
			   	bean = new UserBean();
				bean.setUSER_SEQ(rs.getInt("USER_SEQ"));
	            bean.setUSER_ID(rs.getString("USER_ID"));
	            //System.out.println(rs.getString("USER_ID"));
	            bean.setUSER_PW(rs.getString("USER_PW"));
	            bean.setUSER_NAME(rs.getString("USER_NAME"));
	            bean.setUSER_EMAIL(rs.getString("USER_EMAIL"));
	            bean.setUSER_PROFILE(rs.getString("USER_PROFILE"));
	            bean.setUSER_ROLE(rs.getBoolean("USER_ROLE"));
			}
		} catch (Exception ex) {
			System.out.println("Exception findUserSeq " + ex);
		}
		
		return bean;
   }
   
   // PW 찾기 - 새 PW update
   public void updatePW(int user_seq, String new_pw)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = pool.getConnection();
			String strQuery = "update userinfo set USER_PW = ? where USER_SEQ = ?";
			
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, new_pw);
			pstmt.setInt(2, user_seq);
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Exception updatePW " + ex);
		} finally {
			try {
				pstmt.close();
				pool.freeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
      
      public UserBean loginUserReturnBean(String USER_ID, String USER_PW) {
          Connection con = null;
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          String sql = null;
          UserBean currUser = new UserBean();
          try {
             con = pool.getConnection();
             sql = "select * from userinfo where USER_ID = ? and USER_PW = ?";
             pstmt = con.prepareStatement(sql);
             pstmt.setString(1, USER_ID);
             pstmt.setString(2, USER_PW);
             rs = pstmt.executeQuery();
             if(rs.next()) {
            	 currUser.setUSER_SEQ(rs.getInt("USER_SEQ"));
                 currUser.setUSER_ID(rs.getString("USER_ID"));
                 //currUser.setUSER_PW(rs.getString("USER_PW"));
                 currUser.setUSER_NAME(rs.getString("USER_NAME"));
                 currUser.setUSER_EMAIL(rs.getString("USER_EMAIL"));
                 return currUser;
             }
             
          } catch (Exception e) {
             e.printStackTrace();
          } finally {
             pool.freeConnection(con, pstmt, rs);
          }
          return null;
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