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
		alert("ȸ�������� �����Ǿ����ϴ�. Good Bye!");
		location.href="index.jsp";
		session.invalidate();
	</script>
<%} else {%>
	<script type = "text/javascript">
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
		history.go(-1);
	</script>
<% }%>
<html>
<head>
    <title>ȸ�� ���� ó��</title>
</head>
<body>

</body>
</html>