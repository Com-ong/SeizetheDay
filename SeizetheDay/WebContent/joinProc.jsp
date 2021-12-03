<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bean" class="JavaBeans.UserBean"/>
<jsp:useBean id="mgr" class="JavaBeans.UserMgrPool"/>
<!DOCTYPE html>
<jsp:setProperty property="*" name="bean"/>
<%
		boolean result = mgr.insertUser(bean);
		String msg = "회원가입에 실패 하였습니다.";
		String location = "join.jsp";
		if(result){
			msg = "회원가입을 하였습니다.";
			location = "index.jsp";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>
