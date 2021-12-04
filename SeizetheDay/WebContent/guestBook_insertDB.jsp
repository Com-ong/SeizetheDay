<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DB ���� ���� �߰� �κ� -->
<%@ page import="java.util.*, java.sql.*, JavaBeans.*, java.sql.Date" %>
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
	
	String user_id = request.getParameter("userid");
	String visited_input = request.getParameter("visited_input");
	String exhibition_name = request.getParameter("exhibition_name");
	
	UserBean user = userMgr.findWithID(user_id); // usermgrpool���� �̸����� ã��
	int user_seq = user.getUSER_SEQ();
	
	int exhibition_seq = 2; // exhibitinomgrpool���� �̸����� ã��
	Calendar cal = Calendar.getInstance();
	//System.out.println(cal.get(Calendar.YEAR) + "-" + cal.get(Calendar.MONTH) + "-" + cal.get(Calendar.DATE));
	int year = cal.get(Calendar.YEAR); int month = cal.get(Calendar.MONTH)+1; int day = cal.get(Calendar.DATE);
	String today = year + "-" + month + "-" + day;
	Date board_date = Date.valueOf(today);
	
	System.out.println(visited_input);
	guest_counter++;
	guestMgr.insertGuest(guest_counter, user_seq, visited_input, board_date, exhibition_seq);
%>
<script>
	alert("��ϵǾ����ϴ�"); // ## ��¥ ������ ���� ���� �ɷ� �ؾ��� ��
	
	location.href="guestBook.jsp";
</script>
</body>
</html>