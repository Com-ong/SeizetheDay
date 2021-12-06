<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DB 연결 위한 추가 부분 -->
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
	
	/* int user_seq = 1; // usermgrpool에서 이름으로 찾기
	int exhibition_seq = 2; // exhibitinomgrpool에서 이름으로 찾기 */
	guestMgr.deleteGuest(board_seq);
%>
<script>
	alert("삭제되었습니다."); // ## 진짜 성공일 때만 띄우는 걸로 해야할 듯
	
	location.href="guestBook.jsp?exhibition_seq=<%=exhibition_seq%>";
</script>
</body>
</html>