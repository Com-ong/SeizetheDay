<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="mMgr" class="JavaBeans.UserMgrPool"/>
<html>
<head>
<meta charset="UTF-8">
<%
	  request.setCharacterEncoding("UTF-8");
	  String USER_ID = request.getParameter("USER_ID");
	  String USER_PW = request.getParameter("USER_PW");
	  String url = "index.jsp";
	  String msg = "로그인에 실패 하였습니다.";
	  
	  boolean result = mMgr.loginUser(USER_ID,USER_PW);
	  if(result){
	    session.setAttribute("idKey",USER_ID);
	    msg = "로그인에 성공 하였습니다.";
	  }
%>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>