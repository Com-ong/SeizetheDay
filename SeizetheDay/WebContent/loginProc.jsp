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
	  String msg = "�α��ο� ���� �Ͽ����ϴ�.";
	  
	  //boolean result = mMgr.loginUser(USER_ID, USER_PW);
	  //����� userbean�� return�Ͽ� session���� user_id ����� �� �ְ�
	  UserBean currUser = new UserBean();
	  currUser=mMgr.loginUserReturnBean(USER_ID, USER_PW);
	  
	  //int USER_SEQ_KEY=(int)mMgr.getUSER_SEQ(USER_ID);
	  if(currUser!=null){
	    //session.setAttribute("idKey",currUser.getUSER_ID());
	    //session.setAttribute("USER_SEQ_KEY",currUser.getUSER_SEQ());
	    session.setAttribute("currUser",currUser);
	    msg = "�α��ο� ���� �Ͽ����ϴ�.";
	    System.out.println(currUser.getUSER_SEQ());//user_id Ȯ�ο�
	  }
%>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>