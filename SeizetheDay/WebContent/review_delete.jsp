<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DB ���� ���� �߰� �κ� -->
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
	
	/* int user_seq = 1; // usermgrpool���� �̸����� ã��
	int exhibition_seq = 2; // exhibitinomgrpool���� �̸����� ã�� */
	reviewMgr.deleteReview(comment_seq);
%>
<script>
	alert("�����Ǿ����ϴ�."); // ## ��¥ ������ ���� ���� �ɷ� �ؾ��� ��
	
	location.href="review.jsp?exhibition_seq=<%=exhibition_seq%>";
</script>
</body>
</html>