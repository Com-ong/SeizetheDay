<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, java.sql.*, JavaBeans.*, java.sql.Date" %>
<jsp:useBean id="reviewMgr" class="JavaBeans.ReviewMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	Vector<ReviewBean> vlist = reviewMgr.getReviewList();
	int review_counter = vlist.size();

	String userid=request.getParameter("userid");
	int exhibition_seq = Integer.parseInt(request.getParameter("exhibition_seq"));
	String review_input = request.getParameter("review_input");

	UserBean user = userMgr.findWithID(userid);
	int user_seq = user.getUSER_SEQ();

	//int exhibition_seq = 1;
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int day = cal.get(Calendar.DATE);

	String todayDate = year + "-" + month + "-" + day;
	Date board_date = Date.valueOf(todayDate);
	//review_counter++;
	System.out.println(review_counter);
	System.out.println(user_seq);
	System.out.println(exhibition_seq);
	System.out.println(board_date);
	System.out.println(review_input);
	reviewMgr.insertReview(/* review_counter,  */user_seq, exhibition_seq, board_date, review_input);
%>

<script>
alert("후기가 등록되었습니다");
location.href="review.jsp?exhibition_seq=<%=exhibition_seq%>";
</script>
</body>
</html>