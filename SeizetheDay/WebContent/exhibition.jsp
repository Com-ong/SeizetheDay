<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="head.html" %>
<head>
<link rel="stylesheet" href="CSS/header.css">
<link rel="stylesheet" href="CSS/exhibition.css">
</head>
<body>
	<jsp:include page="header2.jsp"></jsp:include>
	<div class = "show-exhibition">
		<div class = "show-title">
			EXHIBITION NAME
		</div>
		<div class = "show-content">
			<button type="button" class="move_btn" id="preivious_btn"><img src="./images/arrow1.png"></button>
			<img id = "photo" src="./images/photo.png">
			<button type="button" class="move_btn" id="next_btn"><img src="./images/arrow2.png"></button>
		</div>
		
	</div>
</body>
</html>