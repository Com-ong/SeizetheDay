<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice page</title>
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
		<div class="container" style="padding:20px;">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #333344; width:100%;">
				<thead>
					<tr >
						<th>번호</th>
						<th style="width:70%;">제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr style="height:60px;">
						<td>1</td>
						<td><a href="notice_view.jsp">안녕하세요</a></td>
						<td>홍길동</td>
						<td>2017-05-04</td>
					</tr>
					<tr style="height:60px;">
						<td>2</td>
						<td><a href="notice_view.jsp">해킹 당했습니다.</a></td>
						<td>관리자</td>
						<td>2017-05-04</td>
					</tr>
				</tbody>
			</table>
			<!--<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>  -->
		</div>
	</div>
	</div>
</body>
</html>