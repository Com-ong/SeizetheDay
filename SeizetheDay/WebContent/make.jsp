<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="head.html" %>
<head>
<link rel="stylesheet" href="CSS/header.css">
<link rel="stylesheet" href="CSS/make.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class = "make-title">
		전시회 생성
	</div>
	<div class = "make-exhibition">
	<form method="post" action="makeServlet">
		<span>제목 </span><input type="text" id="exhibition-title"><br><br>
		<span>주제 </span><input type="text" id="exhibition-theme"><br><br>
		<span>기간 </span><input type="date" id="exhibition-start-date"> ~ 
					<input type="date" id="exhibition-finish-date"><br><br>
		<span>공개 비공개 설정 </span>
					<input type="radio" name="exhibition-open" id="public" value="public" checked>
					<label for="public">공개</label>
					<input type="radio" name="exhibition-open" id="private" value="private">
					<label for="private">비공개</label><br><br>
		<span>전시회 간단설명 </span><input type="text" id="exhibition-title"><br><br>
		<span>배경 </span><input type="color" id="exhibition-background-color"><br><br>
		<span>작품 사진 </span><input type="file" id="exhibition-file"><br><br>
		<div class = "submit-btn">
			<input type="button" id="exhibition-cancel-btn" name="cancel" value = "취소">
			<input type="submit" id="exhibition-make-btn" name="make" value = "생성">
		</div>
	</form>
	</div>
</body>
</html>