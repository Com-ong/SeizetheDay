package JavaBeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;


public class CategoryMgrPool {

	   private DBConnectionMgr pool;
	   
	   public CategoryMgrPool() {
	      try {
	         pool = DBConnectionMgr.getInstance();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }

	   public CategoryBean getCategorySeq(String category_name) {
		   
	     Connection con = null;
	     PreparedStatement pstmt = null;
	     ResultSet rs = null;
	     CategoryBean bean = null;
	     try {
	        con = pool.getConnection();
	        String sql = "select * from category where CATEGORY_NAME = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, category_name);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	           bean = new CategoryBean();
	           bean.setCATEGORY_SEQ(rs.getInt("CATEGORY_SEQ"));
	           bean.setCATEGORY_NAME(rs.getString("CATEGORY_NAME"));
	        }
	     } catch (Exception e) {
	        e.printStackTrace();
	     } finally {
	        pool.freeConnection(con);
	     }
	     return bean;
	  }
	   
}
