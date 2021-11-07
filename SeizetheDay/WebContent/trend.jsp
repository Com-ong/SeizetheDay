<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trend page</title>
<link rel="stylesheet" href="CSS/trend.css">
</head>
<style>
	#ExhLeft {float : left; width : 300px;  margin-top : 20px; margin-left : 30px; margin-right : 30px; margin-bottom: 20px;
border-radius: 9%; overflow: hidden;
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class = "trend">
		<div class = "trend-title">
			Trend
		</div>
		<table style="margin:0 auto;">
			<tr><td>		
			<div id = "ExhLeft">
				<!-- <input type = "image" src="http://placehold.it/300X200" style="cursor: pointer;" onclick="location.href='make.jsp';"> -->
				 <a href="#"><img class="profile" src="http://placehold.it/300X300"></a>
			</div></td>
		
			<td><div id = "ExhLeft">
				 <a href="#"><img class="profile" src="http://placehold.it/300X300"></a>
			</div></td>
			<td><div id = "ExhLeft">
				 <a href="#"><img class="profile" src="http://placehold.it/300X300"></a>
			</div></td>
		</tr>
		</table>
	</div>
</body>
</html>