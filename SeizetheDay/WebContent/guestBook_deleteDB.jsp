<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DB ���� ���� �߰� �κ� -->
<%@ page import="java.util.*, java.sql.*, JavaBeans.*" %>
<jsp:useBean id="guestMgr" class="JavaBeans.GuestMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<!-- #################################### -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	Vector<GuestBean> vlist = guestMgr.getGuestList();
	int guest_counter = vlist.size();
	
	int board_seq = Integer.parseInt(request.getParameter("board_seq"));
	int exhibition_seq = Integer.parseInt(request.getParameter("exhibition_seq"));
	
	/* int user_seq = 1; // usermgrpool���� �̸����� ã��
	int exhibition_seq = 2; // exhibitinomgrpool���� �̸����� ã�� */
	guestMgr.deleteGuest(board_seq);
%>
<script>
	alert("�����Ǿ����ϴ�."); // ## ��¥ ������ ���� ���� �ɷ� �ؾ��� ��
	
	location.href="guestBook.jsp?exhibition_seq=<%=exhibition_seq%>";
</script>
</body>
</html>