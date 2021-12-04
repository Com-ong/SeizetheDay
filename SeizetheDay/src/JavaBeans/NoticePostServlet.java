package JavaBeans;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/noticePost")
public class NoticePostServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		NoticeMgrPool nMgr = new NoticeMgrPool();
		//nMgr.getUSER_SEQ(request);
		nMgr.insertBoard(request);
		response.sendRedirect("notice.jsp");
	}
}