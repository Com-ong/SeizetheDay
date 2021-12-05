<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id = "uMgr" class="JavaBeans.UserMgrPool"/>
<jsp:useBean id = "uBean" class="JavaBeans.UserBean"/>
<jsp:setProperty property="*" name="uBean"/>

<%
	boolean result = uMgr.updateUser(uBean);
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