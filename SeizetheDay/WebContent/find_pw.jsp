<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, JavaBeans.*" %>
<jsp:useBean id="userMgrs" class="JavaBeans.UserMgrPool"/>
<%
	request.setCharacterEncoding("UTF-8");
	String find_pw_id = request.getParameter("find_pw_id");
	String find_pw_name = request.getParameter("find_pw_name");
	String find_pw_email = request.getParameter("find_pw_email");
	UserBean user = userMgrs.findUserPW(find_pw_id, find_pw_name, find_pw_email);
	String new_pw = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 및 재설정</title>
<link href="CSS/find_pw.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<%
			if(user != null) {
		%>
		<br/><b><%= find_pw_name %></b>님은 가입된 회원입니다.<br>
		새 비밀번호를 입력해주세요.<br>
		<form name="find_change_pw_form">
			<p>새 비밀번호 <input type="password" name="new_pw" id="new_pw" value=""></p>
			<p>새 비밀번호 확인 <input type="password" name="new_pw_check" id="new_pw_check" value=""></p><br>
			<input type="button" value="등록" onclick="change_pw(this.form.new_pw.value, this.form.new_pw_check.value)">
			<a onClick="canceled()">취소</a>
		</form>
		<%
			} else {
		%>
		<br/><p><b><%=find_pw_name%></b>는 회원이 아닙니다.</p><br>
		<a onClick="closing()">닫기</a>
		<% } %>
	</div>
</body>
<script type="text/javascript">
function canceled() {
	opener.document.location.reload();
	self.close();
}
function closing() {
	opener.document.location.href="index.jsp"
	self.close();
}
function change_pw(new_pw, new_pw_check) {
	frm = document.find_change_pw_form;
	if (new_pw == "") {
		alert("새 비밀번호를 입력해 주세요.");
		frm.new_pw.focus();
		return;
	}
	if (new_pw_check == "") {
		alert("새 비밀번호 확인을 입력해 주세요.");
		frm.new_pw_check.focus();
		return;
	}
	
	if(new_pw == <%= user.getUSER_PW() %>) {
		alert("기존과 다른 비밀번호를 입력해 주세요.");
		frm.reset();
		frm.new_pw.focus();
		return;
	}
	if(new_pw == new_pw_check) {
		frm.reset();
		url="find_pw_update.jsp?user_seq=" + <%= user.getUSER_SEQ() %> + "&new_pw=" + new_pw;
		location.href = url;
	}
	else {
		alert("새 비밀번호와 새 비밀번호 확인이 다릅니다.");
		frm.reset();
		frm.new_pw.focus();
		return;
	}
	
}
</script>
</html>