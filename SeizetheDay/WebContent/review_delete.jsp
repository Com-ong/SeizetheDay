<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DB 연결 위한 추가 부분 -->
<%@ page import="java.util.*, java.sql.*, JavaBeans.*" %>
<jsp:useBean id="reviewMgr" class="JavaBeans.ReviewMgrPool" />
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

	/* Vector<GuestBean> vlist = guestMgr.getGuestList();
	int guest_counter = vlist.size(); */
	
	int comment_seq = Integer.parseInt(request.getParameter("comment_seq"));
	int exhibition_seq = Integer.parseInt(request.getParameter("exhibition_seq"));
	
	/* int user_seq = 1; // usermgrpool에서 이름으로 찾기
	int exhibition_seq = 2; // exhibitinomgrpool에서 이름으로 찾기 */
	reviewMgr.deleteReview(comment_seq);
%>
<script>
	alert("삭제되었습니다."); // ## 진짜 성공일 때만 띄우는 걸로 해야할 듯
	
	location.href="review.jsp?exhibition_seq=<%=exhibition_seq%>";
</script>
</body>
</html>