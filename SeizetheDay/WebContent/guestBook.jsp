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
<title>Guest Book</title>
<link rel="stylesheet" href="CSS/guestBook.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="visited_area1">
	<div class="visited_list">
		<table id="visited_area2">
			<tr>
				<td><h1 id="visitedText">GuestBook</h1></td>
			</tr>
			<tr>
				<td id="ment"><br>ª�� ������ ������ �����ּ���.<br><br></td>
			</tr>
			<tr>
				<td>�ۼ��� : <label id="userid">�ۼ���2</label></td>
			</tr>
			<tr>
				<td>
					<textarea class="visited_input" rows="4" cols="70" required>���⿡ ª�� ������ �ۼ��ϼ���.</textarea>
				</td>
				<td><input type="submit" id="visited_store" value="����"></td>
			</tr>
		</table>
		
		<p>�� �湮�� �� : 1</p>
		<table class="visited_lists" border=1>
			<thead>
				<tr>
					<th id="visited_writer">guest</th>
					<th id="visited_visited">guestBook</th>
					<th id="visited_date">Date</th>
					<th id="visited_change">����</th>
					<th id="visited_delete">����</th>
				</tr>
			</thead>
			<tbody>
				<!-- DB ���� ���� �߰� �κ� -->
				<%
					Vector<GuestBean> vlist = guestMgr.getRegisterList();
					Vector<UserBean> userlist = userMgr.getRegisterList();	
					String board_writer = "";
					//int board_seq;
					int counter = vlist.size();
					for(int i=0; i<vlist.size(); i++)
					{
						GuestBean guestBean = vlist.get(i);
						for(int j=0; j<userlist.size(); j++)
						{
							UserBean userBean = userlist.get(j);
							if(userBean.getUSER_SEQ() == guestBean.getUSER_SEQ())
							{	
								board_writer = userBean.getUSER_NAME();
								break;
							}
						}
							
					%>
				<tr>
					<td class="visited_writer_input"><%= board_writer%></td>
					<td class="visited_visited_input"><%= guestBean.getBOARD_TEXT() %></td>
					<td class="visited_date_input"><%= guestBean.getBOARD_DATE() %></td>
					<td><input type="submit" class="visited_change_btn" value="����"></td>
					<td><input type="submit" class="visited_delete_btn" value="����"></td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>