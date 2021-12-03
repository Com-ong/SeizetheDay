<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, java.sql.*, JavaBeans.*" %>
<%@ page import="JavaBeans.ReviewBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="reviewMgr" class="JavaBeans.ReviewMgrPool" />
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Review Page</title>
<link rel="stylesheet" href="CSS/review.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="review_area1">
	<div class="review_list">
		<table id="review_area2">
			<tr>
				<td><input type="button" id="back_btn" value="����ȸ�� ���ư���"></td>
			</tr>
			<tr>
				<td><h1 id="reviewText">�ı�</h1></td>
				<td><input type="button" id="review_addBtn" value="+" onClick="location.href='reviewWrite.jsp'"></td>
			</tr>
			<tr>
				<td><br><br>����ȸ ���� �� �ı⸦ �����ּ���.<br><br></td>
			</tr>
		</table>
	
		<p>�� �ı� �� : 1</p>
		<table class="review_lists" border=1>
			<thead>
				<tr>
					<th id="review_review">�ı� ����</th>
					<th id="review_writer">�ۼ���</th>
					<th id="review_date">��¥</th>
					<th id="review_change">����</th>
					<th id="review_delete">����</th>
				</tr>
			</thead>
			<tbody>
			<%
			Vector<ReviewBean> vlist = reviewMgr.getRegisterList();
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
					<td><input type="submit" id="review_change_btn" value="����"></td>
					<td><input type="submit" id="review_delete_btn" value="����"></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>