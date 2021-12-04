<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<jsp:useBean id="mMgr" class="JavaBeans.UserMgrPool"/>
<html>
<head>
<meta charset="EUC-KR">
<%
	  request.setCharacterEncoding("EUC-KR");
	  String USER_ID = request.getParameter("USER_ID");
	  String USER_PW = request.getParameter("USER_PW");
	  String url = "index.jsp";
	  String msg = "로그인에 실패 하였습니다.";
	  
	  boolean result = mMgr.loginUser(USER_ID, USER_PW);
	  int USER_SEQ_KEY=(int)mMgr.getUSER_SEQ(USER_ID);
	  if(result){
	    session.setAttribute("idKey",USER_ID);
	    session.setAttribute("USER_SEQ_KEY",USER_SEQ_KEY);
	    msg = "로그인에 성공 하였습니다.";
	    System.out.println(session.getAttribute("USER_SEQ_KEY"));//user_id 확인용
	  }
%>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>