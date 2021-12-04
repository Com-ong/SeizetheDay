<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!-- DB 연결 위한 추가 부분 -->
<%
	  request.setCharacterEncoding("EUC-KR");
	  String user_id = (String)session.getAttribute("idKey");
	  //String USER_SEQ=(String)session.getAttribute("USER_SEQ_KEY");
	  //String USER_SEQ=(String)session.getAttribute("USER_SEQ_KEY");
	  //https://hashcode.co.kr/questions/7228/jsp-nullpointerexception-%EC%98%A4%EB%A5%98-%ED%95%B4%EA%B2%B0%EC%9D%B4-%EC%95%88%EB%90%A9%EB%8B%88%EB%8B%A4-%E3%85%9C%E3%85%9C
	NoticeMgrPool nMgr = new NoticeMgrPool();
	int USER_SEQ_KEY= nMgr.getUSER_SEQ(user_id);
	//request.setAttribute("USER_SEQ", USER_SEQ_KEY);
	System.out.println(USER_SEQ_KEY);
%>
<%@ page import="java.util.*, java.sql.*, JavaBeans.*"%>
<jsp:useBean id="noticeMgr" class="JavaBeans.NoticeMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<jsp:useBean id="joinMgr" class="JavaBeans.UserMgrPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="CSS/notice.css">
<style>
.div{
	padding:20px;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="notice">
		<div class="notice-title">Notice</div>
		<!--  <form name="postFrm" method="post" action="noticePost"-->
		<form name="postFrm" method="post" action="noticeProc.jsp"
			>
			<div class="div">
				<input type="text" name="NOTICE_TITLE" size="50" maxlength="30" placeholder="제목">
				<!--<input type="hidden" name="USER_SEQ" size="50" maxlength="30" placeholder="제목" value=-->
				<input type="hidden" name="USER_SEQ" size="50" maxlength="30" placeholder="제목" value=<%=USER_SEQ_KEY %>>
			</div >
			<div class="div"><textarea name="NOTICE_TEXT" rows="10" cols="50" placeholder="내용"></textarea>
			</div>

			<div class="div">
				<input type="submit" value="등록"> <!-- <input type="reset" value="다시쓰기"> --> 
					<input type="button" value="공지사항 목록" onClick="javascript:location.href='notice.jsp'"> 
			</div>
		</form>
	</div>
</body>
</html>