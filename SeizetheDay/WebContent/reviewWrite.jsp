<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.*, java.sql.*, JavaBeans.*, java.sql.Date" %>
<jsp:useBean id ="reviewMgr" class="JavaBeans.ReviewMgrPool"/>
<jsp:useBean id="userMgr" class="JavaBeans.UserMgrPool"/>
<%
	  request.setCharacterEncoding("UTF-8");
	  String user_id = (String)session.getAttribute("idKey");
%>
<%
	UserBean writerBean = userMgr.findWithID(user_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Add Review</title>
<link rel = "stylesheet" href = "CSS/ReviewWritePageCSS.css">
</head>
<body>
	
<<<<<<< HEAD
	<jsp:include page="header.jsp"></jsp:include>
	<div class="reviewWrite_area1">
	<div class="reviewWrite_list">
	<div class="insert_review_area">
		<% String action_url = "review_insert.jsp?userid="+writerBean.getUSER_ID(); %>
		<form method="post" action=<%= action_url %>>
			<table id="reviewWrite_area2">
			<tr>
				<td><input type="button" id="back_btn" value="후기 목록으로 돌아가기" onClick="if(confirm('작성하던 내용이 사라집니다.\n돌아가시겠습니까?')){location.href='ReviewPage.html';} else {return false;}"></td>
			</tr>
			<tr>
				<td><h1 id="reviewWriteText">후기 작성하기</h1></td>
			</tr>
			<tr>
				<td><br><br>전시 관람 후 후기를 작성해주세요.<br><br></td>
			</tr>
			<tr>
				<td><label><b>[관람한 전시 제목]</b></label>
			<tr>
			<tr>
				<td>
					<label id="reviewWrite_title">제목</label>
					<input type="text" id="reviewWrite_title_input" name="review_title" value="">
				</td>
			</tr>
			<tr>
				<td>작성자 : <label id="userid" name="userid"><%= writerBean.getUSER_NAME() %></label></td>
			</tr>
			<tr>
				<td>
					<textarea name="review_input" class="reviewWrite_input" rows="10" cols="100" required>여기에 전시 관람 후기를 작성하세요.</textarea>
				</td>
			</tr>
			<tr>
				<td id="reviewWrite_btns">
					<input type="submit" id="reviewWrite_cancel" value="취소" onClick="if(confirm('작성하던 내용이 사라집니다.\n계속하시겠습니까?')){location.href='review.jsp';} else {return false;}">
					<input type="submit" id="reviewWrite_store" value="저장" onClick="if(confirm('후기를 저장하시겠습니까?')){location.href='review.jsp';} else {return false;}">
				</td>
			</tr>
		</table>
		</form>
	</div>
		
	</div>
</div>
</body>
</html>