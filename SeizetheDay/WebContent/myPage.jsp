<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My PAGE</title>
<link rel="stylesheet" href="CSS/myStyle.css">
<body>
	<jsp:include page = "header.jsp"></jsp:include>
	
	<div class = "myPage">
		<div class = "aboutMy">
			<div class = "myTitle">MYPAGE</div>
			<div class = "myInfo">
				<a href="#"><img class="myImg" src="mypage_image/empty.png"></a>
				<div class = "username">[ U S E R N A M E ] 님</div>
			</div>
			
		</div>
	
		<div class = myBtnGroup>
			<div class = myBtn1><label>MY SHOW ROOM</label></div>
			<div class = myBtn2><label>CHANGE INFO</label></div>

		</div>
		
		<div class = "deleteInfo">회원탈퇴</div>
	</div>

	
</body>
</html> 

