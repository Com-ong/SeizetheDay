<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
				<td id="ment"><br>짧은 문구로 방명록을 남겨주세요.<br><br></td>
			</tr>
			<tr>
				<td>작성자 : <label id="userid">작성자2</label></td>
			</tr>
			<tr>
				<td>
					<textarea class="visited_input" rows="4" cols="70" required>여기에 짧은 문구를 작성하세요.</textarea>
				</td>
				<td><input type="submit" id="visited_store" value="저장"></td>
			</tr>
		</table>
		
		<p>총 방문자 수 : 1</p>
		<table class="visited_lists" border=1>
			<thead>
				<tr>
					<th id="visited_writer">guest</th>
					<th id="visited_visited">guestBook</th>
					<th id="visited_date">Date</th>
					<th id="visited_change">수정</th>
					<th id="visited_delete">삭제</th>
				</tr>
			</thead>
			<tbody>
			<%
			//while(db.next()){
			%>
				<tr>
					<td class="visited_writer_input">작성자1</td>
					<td class="visited_visited_input">방명록1</td>
					<td class="visited_date_input">2021-11-21</td>
					<td><input type="submit" class="visited_change_btn" value="수정"></td>
					<td><input type="submit" class="visited_delete_btn" value="삭제"></td>
				</tr>
				<%
				//}
				%>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>