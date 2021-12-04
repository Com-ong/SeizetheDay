<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DB ���� ���� �߰� �κ� -->
<%@ page import="java.util.*, java.sql.*, java.sql.Date, JavaBeans.*" %>
<jsp:useBean id="exhibitionMgr" class="JavaBeans.ExhibitionMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<jsp:useBean id="photoMgr" class="JavaBeans.PhotoMgrPool" />
<jsp:useBean id="backgroundMgr" class="JavaBeans.BackgroundMgrPool" />
<!-- #################################### -->
<!-- file upload �߰� �κ� -->
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
	// �� �ּҷ� �����(�����ϱ�)
	String saveFolder = request.getSession().getServletContext().getRealPath("FileStorage"); // ��� ���
	System.out.println(saveFolder);
	File Folder = new File(saveFolder);
	if (!Folder.exists()) {
		try{
		    Folder.mkdir(); //���� �����մϴ�.
		    System.out.println("������ �����Ǿ����ϴ�.");
	        } 
	        catch(Exception e){
		    e.getStackTrace();
		}        
         }else {
		System.out.println("�̹� ������ �����Ǿ� �ֽ��ϴ�.");
	}
	String encType = "UTF-8";
	int maxSize = 5 * 1024 * 1024;
	int file_cnt = 0;
	
	String exhibition_open = "";
	String exhibition_name = "", exhibition_text = "", exhibition_start_date = "", exhibition_end_date = "", exhibition_background_color = "", exhibition_file_cnt="";
	
	String filename[] = new String[5];
	String exhibition_file_explain[] = new String[5];
	
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
			else if(name.equals("exhibition-file-cnt")) {
				System.out.print(value);
				exhibition_file_cnt = value;
				file_cnt = Integer.parseInt(exhibition_file_cnt);
			}
			else if(name.equals("exhibition-file-explain1")){
				 exhibition_file_explain[0]=value;
			}
			for (int i = 1; i < file_cnt;i++){
				if (name.equals("exhibition-file-explain"+Integer.toString(i+1))) exhibition_file_explain[i]=value;
				System.out.println("input test"+i+"="+exhibition_file_explain[i]);
			}
			System.out.println(name + " = " + value + "<br/>");
		}
		
		Enumeration files = multi.getFileNames();
		int i=0;
		while(files.hasMoreElements()) {
			String name = (String) files.nextElement();
			filename[file_cnt-1-i] = multi.getFilesystemName(name);
			String original = multi.getOriginalFileName(name);
			String type = multi.getContentType(name);
			File f = multi.getFile(name);
			System.out.println("�Ķ���� �̸� : " + name + "<br/>");
			System.out.println("���� ���� �̸� : " + original + "<br/>");
			System.out.println("����� ���� �̸� : " + filename + "<br/>");
			System.out.println("���� Ÿ�� : " + type + "<br/>");
			if(f != null) {
				System.out.println("ũ�� : " + f.length() + "����Ʈ");
				System.out.println("<br/>");
			}
			i++;
		}
	} catch (IOException ioe) {
		System.out.println(ioe);
	} catch (Exception ex) {
		System.out.println(ex);
	}
	
	Boolean exhibition_private = false;
	System.out.println(exhibition_open);
	
	if(exhibition_open.equals("public")) exhibition_private = true;
	else if(exhibition_open.equals("private")) exhibition_private = false;
	
	Date startDate = Date.valueOf(exhibition_start_date);
	Date endDate = Date.valueOf(exhibition_end_date);
	counter++;
	background_counter++;
	backgroundMgr.insertBackground(background_counter, exhibition_background_color);
	exhibitionMgr.insertExhibition(counter, 1, 1, background_counter, file_cnt, exhibition_private, exhibition_name, exhibition_text, null, startDate, endDate);
	System.out.println(file_cnt);
	for(int i=0 ; i< file_cnt ; i++){
		photo_counter++;
		photoMgr.insertPhoto(photo_counter, counter, filename[i], filename[i], exhibition_file_explain[i]);
	}
	exhibitionMgr.updatePhoto(counter, photo_counter);
%>
<script>
	location.href="exhibition.jsp?exhibition_seq=<%=counter%>&exhibition_background_seq=<%=background_counter%>";
</script>
</body>
</html>