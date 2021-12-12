<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "JavaBeans.UserBean"%>
<jsp:useBean id = "uMgr" class="JavaBeans.UserMgrPool"/> 
<%
	request.setCharacterEncoding("EUC-KR");
	UserBean currUser = (UserBean)session.getAttribute("currUser");
	
	currUser.setUSER_ID(currUser.getUSER_ID());
	currUser.setUSER_PW(currUser.getUSER_PW());

	String delete_pw = request.getParameter("delete_pw");
	String curr_id = currUser.getUSER_ID();
	
	int check = uMgr.deleteUser(curr_id, delete_pw);
	if(check == 1) {
%>
	<script type="text/javascript">
		alert("회원정보가 삭제되었습니다. Good Bye!");
		location.href="index.jsp";
		session.invalidate();
	</script>
<%} else {%>
	<script type = "text/javascript">
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<% }%>
<html>
<head>
    <title>회원 삭제 처리</title>
</head>
<body>

</body>
</html>