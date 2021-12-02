<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My PAGE</title>
<link rel="stylesheet" href="CSS/myStyle.css">

<style>
	.btn1 img:last-child{display:none} 
	.btn1:hover img:first-child{display:none} 
	.btn1:hover img:last-child{display:inline-block}
	
	.btn2 img:last-child{display:none} 
	.btn2:hover img:first-child{display:none} 
	.btn2:hover img:last-child{display:inline-block}
	
	.btn3 img:last-child{display:none} 
	.btn3:hover img:first-child{display:none} 
	.btn3:hover img:last-child{display:inline-block}
 </style>


</head>
<body>
	<jsp:include page = "header.jsp"></jsp:include>
	
	<div class = "myPage">
	
		<div class = "myTitle">MYPAGE</div>
		<div class = "myInfo"><img id="myImg" src="mypage_image/empty.png"></div>
		<div class = "username">[ U S E R N A M E ] 님</div>

		<div class = "myBtnGroup">
			<table>
			<tr>
				<td><div class = "btn1"><a href="ChangeInfo.jsp"><img src="mypage_image/changeInfo1.png"><img a href="ChangeInfo.jsp" src="mypage_image/changeInfo2.png"></a></div></td>
				<td><div class = "btn2"><img src="mypage_image/myImg1.png"><img src="mypage_image/myImg2.png"></div></td>
				<td><div class = "btn3"><img src="mypage_image/askWith1.png"><img src="mypage_image/askWith2.png"></div></td>
			</tr>
			</table>
		</div>
	
		<div class = "deleteInfo">회원탈퇴</div>
		
	</div>

	
</body>
</html> 

