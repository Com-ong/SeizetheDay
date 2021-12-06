<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.*, java.sql.*, JavaBeans.*, java.sql.Date" %>
<jsp:useBean id ="reviewMgr" class="JavaBeans.ReviewMgrPool"/>
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool"/>
<jsp:useBean id="exhibitionMgr" class="JavaBeans.ExhibitionMgrPool" />
<%
	request.setCharacterEncoding("UTF-8");
	UserBean currUser = (UserBean)session.getAttribute("currUser");
	int exhibition_seq = Integer.parseInt(request.getParameter("exhibition_seq"));
	
	UserBean writerBean = userMgr.findWithID(currUser.getUSER_ID());
	ExhibitionBean exhibitionBean = exhibitionMgr.findWithExhibitionSeq(exhibition_seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Add Review</title>
<!-- <link rel = "stylesheet" href = "CSS/ReviewWritePageCSS.css"> -->
<link rel = "stylesheet" href = "CSS/review.css">
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	<div class="review_area1">
	<div class="reviewWrite_list">
	<div class="insert_review_area">
		<% String action_url = "review_insert.jsp?userid="+writerBean.getUSER_ID()+"&exhibition_seq="+exhibition_seq; %>
		<form method="post" action=<%= action_url %>>
			<table id="reviewWrite_area2">
			<tr>
				<td><input type="button" id="back_btn" value="�ı� ������� ���ư���" onClick="if(confirm('�ۼ��ϴ� ������ ������ϴ�.\n���ư��ðڽ��ϱ�?')){location.href='review.jsp?exhibition_seq=<%=exhibition_seq%>';} else {return false;}"></td>
			</tr>
			<tr>
				<td><h1 id="reviewWriteText">�ı� �ۼ��ϱ�</h1></td>
			</tr>
			<tr>
				<td><br><br>���� ���� �� �ı⸦ �ۼ����ּ���.<br><br></td>
			</tr>
			<tr>
				<td><label><b><%= exhibitionBean.getEXHIBITION_NAME() %></b></label>
			<tr>
			<!-- <tr>
				<td>
					<label id="reviewWrite_title">����</label>
					<input type="text" id="reviewWrite_title_input" name="review_title" value="">
				</td>
			</tr> -->
			<tr>
				<td>�ۼ��� : <label id="userid" name="userid"><%= writerBean.getUSER_NAME() %></label></td>
			</tr>
			<tr>
				<td>
					<textarea name="review_input" class="reviewWrite_input" rows="10" cols="100" required placeholder="���⿡ ���� ���� �ı⸦ �ۼ��ϼ���."></textarea>
				</td>
			</tr>
			<tr>
				<td id="reviewWrite_btns">
					<input type="button" id="reviewWrite_cancel" value="���" onClick="if(confirm('�ۼ��ϴ� ������ ������ϴ�.\n����Ͻðڽ��ϱ�?')){location.href='review.jsp?exhibition_seq=<%=exhibition_seq%>';} else {return false;}">
					<input type="submit" id="reviewWrite_store" value="����" onClick="if(confirm('�ı⸦ �����Ͻðڽ��ϱ�?')){location.href='review.jsp';} else {return false;}">
				</td>
			</tr>
		</table>
		</form>
	</div>
		
	</div>
</div>
</body>
</html>