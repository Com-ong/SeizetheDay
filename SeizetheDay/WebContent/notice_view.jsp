<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice_view page</title>
<!-- 참고링크:https://peterkimlab.github.io/jsp/JSP-%EA%B2%8C%EC%8B%9C%ED%8C%90-%EC%9B%B9-%EC%82%AC%EC%9D%B4%ED%8A%B8-%EB%A7%8C%EB%93%A4%EA%B8%B0/ -->
<!--notice페이지지만  간소화를 위해 css 링크는 trend.css사용. 헷갈림 방지 -->
<link rel="stylesheet" href="CSS/trend.css">
</head>
<style>
	#ExhLeft {float : left; width : 300px;  margin-top : 20px; margin-left : 30px; margin-right : 30px; margin-bottom: 20px;
border-radius: 9%; overflow: hidden;

th{
background-color:#eeeeee; 
text-align: center; 
width:10%;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class = "trend">
		<div class = "trend-title">
			Notice
		</div>
		<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #333344; width:100%;">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">notice</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:10%;">글제목</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"></td>
					</tr>
					<tr style="height:450px;">
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"></td>
					</tr>
				</tbody>
			</table>
			<div class="head1">
			<div class="user-section">
			<a href="notice.jsp" class="user-button" style="border:2px solid #333344;">목록</a>
			</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>