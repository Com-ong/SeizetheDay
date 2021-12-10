<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DB ���� ���� �߰� �κ� -->
<%@ page import="java.util.*, java.sql.*, java.sql.Date, JavaBeans.*" %>
<jsp:useBean id="exhibitionMgr" class="JavaBeans.ExhibitionMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<jsp:useBean id="photoMgr" class="JavaBeans.PhotoMgrPool" />
<jsp:useBean id="backgroundMgr" class="JavaBeans.BackgroundMgrPool" />
<jsp:useBean id="categoryMgr" class="JavaBeans.CategoryMgrPool" />
<!-- file upload �߰� �κ� -->
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	UserBean currUser= (UserBean)session.getAttribute("currUser");//����� ���� �޾ƿ���
	int user_seq = currUser.getUSER_SEQ();//DB�� ������ user_seq
	System.out.println("���� seq"+user_seq);
	//�� ���̺��� ������ ���� -> ������ �������� seq ���
	Vector<ExhibitionBean> vlist = exhibitionMgr.getExhibitionList();
	int counter = vlist.size();
	Vector<PhotoBean> plist = photoMgr.getPhotoList();
	int photo_counter = plist.size();
	Vector<BackgroundBean> blist = backgroundMgr.getBackgroundList();
	int background_counter = blist.size();
	
	// C:\Jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SeizetheDay\FileStorage
	String saveFolder = request.getSession().getServletContext().getRealPath("FileStorage"); // ��� ���
	System.out.println(saveFolder);
	
	File Folder = new File(saveFolder);//�ش� ��ġ�� FileStorage ���� ���� �� ����
	if (!Folder.exists()) {
		try{
		    Folder.mkdir();
		    System.out.println("������ �����Ǿ����ϴ�.");
		}catch(Exception e){
		    e.getStackTrace();
		}        
    }
	else {
		System.out.println("�̹� ������ �����Ǿ� �ֽ��ϴ�.");
	}
	
	String encType = "EUC-KR";
	int maxSize = 5 * 1024 * 1024;
	int file_cnt = 0;//����ڰ� exhibition�� ���ε��� photo�� ����
	
	String exhibition_open = "";
	String exhibition_name = "", exhibition_text = "", exhibition_start_date = "", 
			exhibition_end_date = "", exhibition_background_color = "", exhibition_file_cnt="";
	
	
	String exhibition_theme=""; // ���� �׸�
	String profile_file = ""; // ���ε��� ����� �̸�
	
	// ����� �߰� ��
	/* String filename[] = new String[5];//���ε��� photo�� ���� �̸� -> �ִ� 5��
	String exhibition_file_explain[] = new String[5];//���ε��� photo�� ���� -> �ִ� 5�� */
	
	// ����� �߰� ��
	String filename[] = new String[6];// ���ε��� photo�� ���� �̸� -> �ִ� 6�� (����� 1��, ���� 5��)
	String exhibition_file_explain[] = new String[6];//���ε��� photo�� ���� -> �ִ� 6�� (����� 1��, ���� 5��)
	
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
			
			// ����� �߰� ��
			/* else if(name.equals("exhibition-file-explain1")){
				 exhibition_file_explain[0]=value;
			} */
			
			// ����� �߰� ��
			else if(name.equals("exhibition-file-explain0")){ // ����� �κ� ����
				 exhibition_file_explain[0]=value;
			}
			else if(name.equals("exhibition-file-explain1")){ // ����� ���� ù��° ���� �κ� ����
				 exhibition_file_explain[1]=value;
			}
			
			// ���� �׸�
			else if(name.equals("exhibition-theme")) {
				exhibition_theme = value;
			}
			
			// ����� �߰� ��
			/* for (int i = 1; i < file_cnt;i++){
				if (name.equals("exhibition-file-explain"+Integer.toString(i+1))) exhibition_file_explain[i]=value;
				System.out.println("input test"+i+"="+exhibition_file_explain[i]);
			} */
			
			// ����� �߰� ��
			for (int i = 2; i < file_cnt;i++){
				if (name.equals("exhibition-file-explain"+Integer.toString(i))) exhibition_file_explain[i]=value;
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
	
	// �߰� �κ� ////////////
	// ���� �׸� ����
	CategoryBean categoryBean = categoryMgr.getCategorySeq(exhibition_theme);
	int input_theme_seq = categoryBean.getCATEGORY_SEQ();
	
	// ���� ����� ���� �ְ�
	profile_file = filename[0];
	/////////////////////
	
	Date startDate = Date.valueOf(exhibition_start_date);
	Date endDate = Date.valueOf(exhibition_end_date);
	counter++;
	background_counter++;
	backgroundMgr.insertBackground(background_counter, exhibition_background_color);//��� �� ����
	
	// ���� �׸�, ����� �߰� ��
	// exhibitionMgr.insertExhibition(/* counter,  */user_seq, 1, background_counter, file_cnt, //user_id, category_id
	//		exhibition_private, exhibition_name, exhibition_text, null, startDate, endDate); */
	
	// ���� �׸�, ����� �߰� ��
	exhibitionMgr.insertExhibition(user_seq, input_theme_seq, background_counter, file_cnt-1, //user_id, category_id
			exhibition_private, exhibition_name, exhibition_text, profile_file, startDate, endDate);
	
	System.out.println(file_cnt);
	Vector<ExhibitionBean> list = exhibitionMgr.getExhibitionList();
	ExhibitionBean bean = list.get(vlist.size());
	counter=bean.getEXHIBITION_SEQ();
	
	for(int i=0 ; i< file_cnt ; i++){
		//photo_counter++;
		photoMgr.insertPhoto(/* photo_counter,  */counter, filename[i], filename[i], exhibition_file_explain[i]);
	}
	exhibitionMgr.updatePhoto(counter, photo_counter);
%>
<script>
	location.href="exhibition.jsp?exhibition_seq=<%=counter%>&exhibition_background_seq=<%=background_counter%>";
</script>
</body>
</html>