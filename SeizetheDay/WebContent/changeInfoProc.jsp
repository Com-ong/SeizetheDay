<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "JavaBeans.UserBean"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id = "uMgr" class="JavaBeans.UserMgrPool"/>
<%
	UserBean currUser = (UserBean)session.getAttribute("currUser");
	currUser.setUSER_NAME(request.getParameter("user_name"));
	currUser.setUSER_EMAIL(request.getParameter("user_email"));
	currUser.setUSER_PW(request.getParameter("user_pw"));
	currUser.setUSER_ID(currUser.getUSER_ID());
	
	boolean result = uMgr.updateUser(currUser);

	if(result) {
%>
	<script type="text/javascript">
		alert("회원정보가 수정되었습니다.");
		location.href="myPage.jsp";
	</script>
<%} else {%>
	<script type = "text/javascript">
		alert("회원정보 수정에 실패했습니다.");
		history.back();
	</script>
<% }%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CHANGE!!</title>
</head>
<body>

</body>
</html>

