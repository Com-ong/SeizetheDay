<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
				<td><input type="button" id="back_btn" value="전시회로 돌아가기"></td>
			</tr>
			<tr>
				<td><h1 id="reviewText">후기</h1></td>
				<td><input type="button" id="review_addBtn" value="+" onClick="location.href='reviewWrite.jsp'"></td>
			</tr>
			<tr>
				<td><br><br>전시회 관람 후 후기를 남겨주세요.<br><br></td>
			</tr>
		</table>
	
		<p>총 후기 수 : 1</p>
		<table class="review_lists" border=1>
			<thead>
				<tr>
					<th id="review_review">후기 내용</th>
					<th id="review_writer">작성자</th>
					<th id="review_date">날짜</th>
					<th id="review_change">수정</th>
					<th id="review_delete">삭제</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="review_review_input">좋은 전시였습니다.</td>
					<td id="review_writer_input">작성자1</td>
					<td id="review_date_input">2021-10-22</td>
					<td><input type="submit" id="review_change_btn" value="수정"></td>
					<td><input type="submit" id="review_delete_btn" value="삭제"></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>