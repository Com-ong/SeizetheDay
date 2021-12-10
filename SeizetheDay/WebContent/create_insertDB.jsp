<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DB 연결 위한 추가 부분 -->
<%@ page import="java.util.*, java.sql.*, java.sql.Date, JavaBeans.*" %>
<jsp:useBean id="exhibitionMgr" class="JavaBeans.ExhibitionMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<jsp:useBean id="photoMgr" class="JavaBeans.PhotoMgrPool" />
<jsp:useBean id="backgroundMgr" class="JavaBeans.BackgroundMgrPool" />
<jsp:useBean id="categoryMgr" class="JavaBeans.CategoryMgrPool" />
<!-- file upload 추가 부분 -->
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
	UserBean currUser= (UserBean)session.getAttribute("currUser");//사용자 정보 받아오기
	int user_seq = currUser.getUSER_SEQ();//DB에 삽입할 user_seq
	System.out.println("유저 seq"+user_seq);
	//각 테이블의 데이터 개수 -> 삽입할 데이터의 seq 계산
	Vector<ExhibitionBean> vlist = exhibitionMgr.getExhibitionList();
	int counter = vlist.size();
	Vector<PhotoBean> plist = photoMgr.getPhotoList();
	int photo_counter = plist.size();
	Vector<BackgroundBean> blist = backgroundMgr.getBackgroundList();
	int background_counter = blist.size();
	
	// C:\Jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SeizetheDay\FileStorage
	String saveFolder = request.getSession().getServletContext().getRealPath("FileStorage"); // 상대 경로
	System.out.println(saveFolder);
	
	File Folder = new File(saveFolder);//해당 위치에 FileStorage 폴더 없을 시 생성
	if (!Folder.exists()) {
		try{
		    Folder.mkdir();
		    System.out.println("폴더가 생성되었습니다.");
		}catch(Exception e){
		    e.getStackTrace();
		}        
    }
	else {
		System.out.println("이미 폴더가 생성되어 있습니다.");
	}
	
	String encType = "EUC-KR";
	int maxSize = 5 * 1024 * 1024;
	int file_cnt = 0;//사용자가 exhibition에 업로드한 photo의 개수
	
	String exhibition_open = "";
	String exhibition_name = "", exhibition_text = "", exhibition_start_date = "", 
			exhibition_end_date = "", exhibition_background_color = "", exhibition_file_cnt="";
	
	
	String exhibition_theme=""; // 전시 테마
	String profile_file = ""; // 업로드한 썸네일 이름
	
	// 썸네일 추가 전
	/* String filename[] = new String[5];//업로드한 photo의 파일 이름 -> 최대 5개
	String exhibition_file_explain[] = new String[5];//업로드한 photo의 설명 -> 최대 5개 */
	
	// 썸네일 추가 후
	String filename[] = new String[6];// 업로드한 photo의 파일 이름 -> 최대 6개 (썸네일 1개, 사진 5개)
	String exhibition_file_explain[] = new String[6];//업로드한 photo의 설명 -> 최대 6개 (썸네일 1개, 사진 5개)
	
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
			
			// 썸네일 추가 전
			/* else if(name.equals("exhibition-file-explain1")){
				 exhibition_file_explain[0]=value;
			} */
			
			// 썸네일 추가 후
			else if(name.equals("exhibition-file-explain0")){ // 썸네일 부분 설명
				 exhibition_file_explain[0]=value;
			}
			else if(name.equals("exhibition-file-explain1")){ // 썸네일 다음 첫번째 사진 부분 설명
				 exhibition_file_explain[1]=value;
			}
			
			// 전시 테마
			else if(name.equals("exhibition-theme")) {
				exhibition_theme = value;
			}
			
			// 썸네일 추가 전
			/* for (int i = 1; i < file_cnt;i++){
				if (name.equals("exhibition-file-explain"+Integer.toString(i+1))) exhibition_file_explain[i]=value;
				System.out.println("input test"+i+"="+exhibition_file_explain[i]);
			} */
			
			// 썸네일 추가 후
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
	
	// 추가 부분 ////////////
	// 전시 테마 설정
	CategoryBean categoryBean = categoryMgr.getCategorySeq(exhibition_theme);
	int input_theme_seq = categoryBean.getCATEGORY_SEQ();
	
	// 전시 썸네일 파일 주가
	profile_file = filename[0];
	/////////////////////
	
	Date startDate = Date.valueOf(exhibition_start_date);
	Date endDate = Date.valueOf(exhibition_end_date);
	counter++;
	background_counter++;
	backgroundMgr.insertBackground(background_counter, exhibition_background_color);//배경 색 삽입
	
	// 전시 테마, 썸네일 추가 전
	// exhibitionMgr.insertExhibition(/* counter,  */user_seq, 1, background_counter, file_cnt, //user_id, category_id
	//		exhibition_private, exhibition_name, exhibition_text, null, startDate, endDate); */
	
	// 전시 테마, 썸네일 추가 후
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