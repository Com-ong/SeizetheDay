<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="head.html" %>
<head>
<link rel="stylesheet" href="CSS/header.css">
<link rel="stylesheet" href="CSS/exhibition_list.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class = "show-exhibition">
	<div class = "show-list-title">
		SHOW LIST
	</div>
	<div class = "show-content w3-row-padding">
		<div class="w3-col s4 photo"><img src="./images/photo.png"></div>
 		<div class="w3-col s4 photo"><img src="./images/photo.png"></div>
  		<div class="w3-col s4 photo"><img src="./images/photo.png"></div>
	</div>
	<div class = "show-content w3-row-padding">
		<div class="w3-col s4 photo"><img src="./images/photo.png"></div>
 		<div class="w3-col s4 photo"><img src="./images/photo.png"></div>
  		<div class="w3-col s4 photo"><img src="./images/photo.png"></div>
	</div>
	<div class = "show-content w3-row-padding">
		<div class="w3-col s4 photo"><img src="./images/photo.png"></div>
 		<div class="w3-col s4 photo"><img src="./images/photo.png"></div>
  		<div class="w3-col s4 photo"><img src="./images/photo.png"></div>
	</div>
	
	<div class="w3-bar w3-center">
		<a href="#" class="w3-button">«</a>
  		<a href="#" class="w3-button w3-green">1</a>
  		<a href="#" class="w3-button">2</a>
  		<a href="#" class="w3-button">3</a>
  		<a href="#" class="w3-button">4</a>
  		<a href="#" class="w3-button">»</a>
	</div>
	</div>
</body>
</html>