<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DB 연결 위한 추가 부분 -->
<%@ page import="java.util.*, java.sql.*, java.sql.Date, JavaBeans.*" %>
<jsp:useBean id="exhibitionMgr" class="JavaBeans.ExhibitionMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<jsp:useBean id="photoMgr" class="JavaBeans.PhotoMgrPool" />
<jsp:useBean id="backgroundMgr" class="JavaBeans.BackgroundMgrPool" />
<!-- #################################### -->
<!-- file upload 추가 부분 -->
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
<!-- #################################### -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	Vector<ExhibitionBean> vlist = exhibitionMgr.getExhibitionList();
	int counter = vlist.size();
	Vector<PhotoBean> plist = photoMgr.getPhotoList();
	int photo_counter = plist.size();
	Vector<BackgroundBean> blist = backgroundMgr.getBackgroundList();
	int background_counter = blist.size();
	
	// C:\Jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SeizetheDay\FileStorage
	// 이 주소로 저장됨(참고하기)
	String saveFolder = request.getSession().getServletContext().getRealPath("FileStorage"); // 상대 경로
	System.out.println(saveFolder);
	String encType = "UTF-8";
	int maxSize = 5 * 1024 * 1024;
	String filename = "";
	String exhibition_open = "";
	String exhibition_name = "", exhibition_text = "", exhibition_start_date = "", exhibition_end_date = "", exhibition_background_color = "", exhibition_file_explain = "";
	try {
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration params = multi.getParameterNames();
		
		while(params.hasMoreElements()) {
			String name = (String) params.nextElement();
			String value = multi.getParameter(name);
			
			if(name.equals("exhibition-open")) exhibition_open = value;
			else if(name.equals("exhibition-title")) exhibition_name = value;
			else if(name.equals("exhibition-explain")) exhibition_text = value;
			else if(name.equals("exhibition-start-date")) exhibition_start_date = value;
			else if(name.equals("exhibition-finish-date")) exhibition_end_date = value;
			else if(name.equals("exhibition-background-color")) exhibition_background_color = value;
			else if(name.equals("exhibition-file-explain")) exhibition_file_explain = value;
			System.out.println(name + " = " + value + "<br/>");
		}
		
		Enumeration files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String name = (String) files.nextElement();
			filename = multi.getFilesystemName(name);
			String original = multi.getOriginalFileName(name);
			String type = multi.getContentType(name);
			File f = multi.getFile(name);
			System.out.println("파라미터 이름 : " + name + "<br/>");
			System.out.println("실제 파일 이름 : " + original + "<br/>");
			System.out.println("저장된 파일 이름 : " + filename + "<br/>");
			System.out.println("파일 타입 : " + type + "<br/>");
			if(f != null) {
				System.out.println("크기 : " + f.length() + "바이트");
				System.out.println("<br/>");
			}
		}
	} catch (IOException ioe) {
		System.out.println(ioe);
	} catch (Exception ex) {
		System.out.println(ex);
	}
	
	// 정보 가져오기
	//String exhibition_name = request.getParameter("exhibition-title");
	//String exhibition_text = request.getParameter("exhibition-explain");
	//String exhibition_start_date = request.getParameter("exhibition-start-date");
	//String exhibition_end_date = request.getParameter("exhibition-finish-date");
	Boolean exhibition_private = false;
	//System.out.println(request.getParameter("exhibition-open"));
	System.out.println(exhibition_open);
	if(exhibition_open.equals("public")) exhibition_private = true;
	else if(exhibition_open.equals("private")) exhibition_private = false;
	//String exhibition_file = request.getParameter("exhibtion_file");
	//System.out.println(exhibition_file);
	//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date startDate = Date.valueOf(exhibition_start_date);
	Date endDate = Date.valueOf(exhibition_end_date);
	int index = 8;
	counter++;
	photo_counter++;
	background_counter++;
	//exhibitionMgr.insertExhibition(exhibition_seq, user_seq, category_seq, background_seq, photo_seq, exhibition_private, exhibition_name, exhibition_text, exhibition_profile, exhibition_start_date, exhibition_end_date)
	backgroundMgr.insertBackground(background_counter, exhibition_background_color);
	exhibitionMgr.insertExhibition(counter, 1, 1, background_counter, 1, exhibition_private, exhibition_name, exhibition_text, null, startDate, endDate);
	photoMgr.insertPhoto(photo_counter, counter, filename, filename, exhibition_file_explain);

	exhibitionMgr.updatePhoto(counter, photo_counter);
	
%>
<script>
	alert("저장 성공"); // ## 진짜 성공일 때만 띄우는 걸로 해야할 듯
	
	location.href="show_test.jsp?exhibition_seq=<%=counter%>&exhibition_background_seq=<%=background_counter%>";
</script>
</body>
</html>