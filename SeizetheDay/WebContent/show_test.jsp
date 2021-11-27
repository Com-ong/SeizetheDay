<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DB ���� ���� �߰� �κ� -->
<%@ page import="java.util.*, java.sql.*, java.sql.Date, JavaBeans.*" %>
<jsp:useBean id="exhibitionMgr" class="JavaBeans.ExhibitionMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<jsp:useBean id="photoMgr" class="JavaBeans.PhotoMgrPool" />
<jsp:useBean id="backgroundMgr" class="JavaBeans.BackgroundMgrPool" />
<!-- #################################### -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int exhibition_seq = Integer.parseInt(request.getParameter("exhibition_seq")); // �����ؼ� ���� ����ȸ ��ȣ
	int background_seq = Integer.parseInt(request.getParameter("exhibition_background_seq"));
	System.out.println("background_seq = " + request.getParameter("exhibition_background_seq"));
	System.out.println(request.getParameter("exhibition_seq"));
	System.out.println(exhibition_seq);
	int user_seq = 1; // �α����� ����� ��ȣ
	PhotoBean pb = photoMgr.getPhoto(exhibition_seq);
	BackgroundBean bb = backgroundMgr.getBackground(background_seq);
	System.out.println(pb.getPHOTO_NAME());
	System.out.println(bb.getBACKGROUND_COLOR());
	//String imagePath = "FileStorage/" + pb.getPHOTO_NAME(); // �� ���ڱ� �� �ȳ���..
%>
<div style="background-color: <%=bb.getBACKGROUND_COLOR()%>">
<img src="FileStorage/<%= pb.getPHOTO_NAME() %>" width="500" alt=<%= pb.getPHOTO_NAME() %> /><br>
<p> <%= pb.getPHOTO_TEXT() %></p><br>
<a href="index.jsp">ó������</a>
</div>
</body>
</html>