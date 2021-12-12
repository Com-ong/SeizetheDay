<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, JavaBeans.*" %>
<jsp:useBean id="userMgrs" class="JavaBeans.UserMgrPool"/>
<%
	request.setCharacterEncoding("UTF-8");
	String find_id_name = request.getParameter("find_id_name");
	String find_id_email = request.getParameter("find_id_email");
	/* System.out.println("find_id_name : " + find_id_name);
	System.out.println("find_id_email : " + find_id_email); */
	UserBean userBean = userMgrs.findUserID(find_id_name, find_id_email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기</title>
<link href="CSS/idCheck.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<% if(userBean != null) { %>
		<br/><%-- <b><%=find_id_name%><br><%=find_id_email %></b><br> --%>
		<p><b><%=find_id_name%></b>의 아이디는 <b><%= userBean.getUSER_ID() %></b>입니다.</p><br>
		<%
			} else { 
		%>
		<br/>
		<p><b><%=find_id_name%></b>는 회원이 아닙니다.</p><br>
		<% } %>
		<a onClick="closing()">닫기</a>
	</div>
</body>
<script>
function closing() {
	opener.document.location.href="index.jsp" 
	self.close();
}
</script>
</html>