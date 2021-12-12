<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, java.sql.*, JavaBeans.*" %>
<%@ page import="JavaBeans.ReviewBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="reviewMgr" class="JavaBeans.ReviewMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool"/>
<jsp:useBean id="exhibitionMgr" class="JavaBeans.ExhibitionMgrPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR"> 
<title>Review Page</title>
<link rel="stylesheet" href="CSS/ReviewPageCSS.css">
</head>
<%
	request.setCharacterEncoding("UTF-8");
	UserBean currUser= (UserBean)session.getAttribute("currUser");
	int exhibition_seq = Integer.parseInt(request.getParameter("exhibition_seq"));
	ExhibitionBean exhibitionBean = exhibitionMgr.findWithExhibitionSeq(exhibition_seq);
%>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="review_area1">
	<div class="review_list">
		<table id="review_area2">
			<tr>
				<td><input type="button" id="back_btn" value="����ȸ�� ���ư���" 
				onClick="location.href='exhibition.jsp?exhibition_seq=<%=exhibition_seq%>&exhibition_background_seq=<%= exhibitionBean.getBACKGROUND_SEQ() %>'"></td>
			</tr>
			<tr>
				<td><h1 id="reviewText">�ı�</h1></td>
				<td><input type="button" id="review_addBtn" value="+" onClick="location.href='reviewWrite.jsp?exhibition_seq=<%=exhibition_seq%>'"></td>
			</tr>
			<tr>
			<td><%= exhibitionBean.getEXHIBITION_NAME() %></td>
			</tr>
			<tr>
				<td><br><br>����ȸ ���� �� �ı⸦ �����ּ���.<br><br></td>
			</tr>
		</table>
		<%
			//Vector<ReviewBean> vlist = reviewMgr.getReviewList();
			Vector<ReviewBean> vlist = reviewMgr.getEachReviewList(exhibition_seq);
			int count = vlist.size();
		%>
	
		<p>�� �ı� �� : <%= count %></p>
		
		<table class="review_lists" border=1>
			<thead>
				<tr>
					<th id="review_writer">�ۼ���</th>
					<th id="review_review">�ı� ����</th>
					<th id="review_date">��¥</th>
					<th id="review_change">����</th>
					<th id="review_delete">����</th>
				</tr>
			</thead>
			<tbody>
			<%
			//Vector<ReviewBean> vlist = reviewMgr.getRegisterList();
			Vector<UserBean> userlist = userMgr.getRegisterList();
			String board_writer="";
			
			int counter = vlist.size();
			for(int i = 0; i < vlist.size(); i++){
				ReviewBean reviewBean = vlist.get(i);
				for(int j = 0; j < userlist.size(); j++){
					UserBean userBean = userlist.get(j);
					if(userBean.getUSER_SEQ() == reviewBean.getUserSeq()){
						board_writer = userBean.getUSER_NAME();
						break;
					}
				}
			%>
				<tr>
					<td id="review_writer_input"><%= board_writer %></td>
					<td id="review_review_input"><%= reviewBean.getCommentText() %></td>
					<td id="review_date_input"><%= reviewBean.getCommentDate() %></td>
					<%if(reviewBean.getUserSeq() == currUser.getUSER_SEQ()) { %>
					<td><input type="submit" id="review_change_btn" value="����"
					 onClick="location.href='reviewRevise.jsp?comment_writer=<%=board_writer %>&exhibition_seq=<%=exhibition_seq%>&comment_seq=<%=reviewBean.getCommentSeq() %>'"></td>
					<td><input type="button" id="review_delete_btn" value="����" 
					onClick="location.href='review_delete.jsp?exhibition_seq=<%=exhibition_seq%>&comment_seq=<%=reviewBean.getCommentSeq() %>'"></td>
					<% } else {%>
					<td><input type="submit" id="review_change_btn" value="����"></td>
					<td><input type="button" id="review_delete_btn" value="����"></td>
					<% } %>
					
					
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>