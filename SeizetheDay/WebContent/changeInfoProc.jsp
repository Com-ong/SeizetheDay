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
		alert("ȸ�������� �����Ǿ����ϴ�.");
		location.href="myPage.jsp";
	</script>
<%} else {%>
	<script type = "text/javascript">
		alert("ȸ������ ������ �����߽��ϴ�.");
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

