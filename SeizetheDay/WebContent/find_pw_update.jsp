<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, java.sql.*, JavaBeans.*" %>
<jsp:useBean id="userMgrs" class="JavaBeans.UserMgrPool"/>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("EUC-KR");
	int user_seq = Integer.parseInt(request.getParameter("user_seq"));
	String new_pw = request.getParameter("new_pw");
	userMgrs.updatePW(user_seq, new_pw);

%>

<script>
	opener.document.location.href="index.jsp"
	self.close();/* 
	location.href = "index.jsp"; */
</script>