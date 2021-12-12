<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Introduce Ourself!</title>
</head>

<style>
	.hiAll {
		background-color : white;
		width : 90%;
		height : 50%;
		margin-left : 5%;
		border-radius:15px;
		margin-top : 15%;
	}
	
	.hiAll .allContent {
		margin-top : 15%;
	}
	
	.hiAll h1 {
		text-align : center;
		margin-top : 15%;
		font-weight : bold;
		margin-bottom : 4%;
	}
	
	.hiAll h3 {
		text-align : center;
		color : #bfbfbf;
	}
	
	
</style>

<body>
	<jsp:include page = "header.jsp"></jsp:include>
	<div class = "hiAll">
		<div class = "allContent">
			<h1>Seize Your Day!</h1>
						
			<h3>언제나 행복한 일만 가득할 수는 없겠죠 그래도 듣고 싶어요 당신의 이야기</h3>
			<h3>매일매일 변하는 기분을 공유해주세요 우리는 언제나 이자리에 있을게요</h3>

			<%@ include file="introduce.html" %>
		</div>
	</div>
</body>
</html>