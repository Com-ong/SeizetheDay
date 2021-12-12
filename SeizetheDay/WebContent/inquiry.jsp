<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String user_id = (String)session.getAttribute("idKey");
	  //String USER_SEQ=(String)session.getAttribute("USER_SEQ_KEY");
	  //String USER_SEQ=(String)session.getAttribute("USER_SEQ_KEY");
	  //https://hashcode.co.kr/questions/7228/jsp-nullpointerexception-%EC%98%A4%EB%A5%98-%ED%95%B4%EA%B2%B0%EC%9D%B4-%EC%95%88%EB%90%A9%EB%8B%88%EB%8B%A4-%E3%85%9C%E3%85%9C
	InquiryMgrPool iMgr = new InquiryMgrPool();
	int USER_SEQ_KEY= iMgr.getUSER_SEQ(user_id);
	//request.setAttribute("USER_SEQ", USER_SEQ_KEY);
	System.out.println(USER_SEQ_KEY);
%>
<%@ page import="java.util.*, java.sql.*, JavaBeans.*"%>
<jsp:useBean id="inquiryMgr" class="JavaBeans.InquiryMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="CSS/inquiry.css">
<style>
.div{
	padding:20px;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="inquiry">
		<div class="inquiry-title">1:1 Inquiry </div>
		<!--  <form name="postFrm" method="post" action="noticePost"-->
		<form name="postFrm" method="post" action="inquiryProc.jsp"
			>
			<div class="div">
				<input type="text" name="INQUIRY_TITLE" size="50" maxlength="30" placeholder="���� ����">
				<!--<input type="hidden" name="USER_SEQ" size="50" maxlength="30" placeholder="����" value=-->
				<input type="hidden" name="USER_SEQ" size="50" maxlength="30" placeholder="����" value=<%=USER_SEQ_KEY %>>
			</div >
			<div class="div"><textarea name="INQUIRY_TEXT" rows="10" cols="50" placeholder="���� ������ �ۼ����ּ���."></textarea>
			</div>

			<div class="div">
				<input type="submit" value="���� ���"> <!-- <input type="reset" value="�ٽþ���"> --> 
					<input type="button" value="main" onClick="javascript:location.href='index.jsp'"> 
			</div>
		</form>
	</div>
</body>
</html>