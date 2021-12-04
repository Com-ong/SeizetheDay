<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="JavaBeans.UserBean" %>
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
	  
	  //boolean result = mMgr.loginUser(USER_ID, USER_PW);
	  //결과로 userbean을 return하여 session에서 user_id 사용할 수 있게
	  UserBean currUser = new UserBean();
	  currUser=mMgr.loginUserReturnBean(USER_ID, USER_PW);
	  
	  //int USER_SEQ_KEY=(int)mMgr.getUSER_SEQ(USER_ID);
	  if(currUser!=null){
	    //session.setAttribute("idKey",currUser.getUSER_ID());
	    //session.setAttribute("USER_SEQ_KEY",currUser.getUSER_SEQ());
	    session.setAttribute("currUser",currUser);
	    msg = "로그인에 성공 하였습니다.";
	    System.out.println(currUser.getUSER_SEQ());//user_id 확인용
	  }
%>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>