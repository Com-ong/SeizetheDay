<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MyPage</title>
<link rel="stylesheet" href="CSS/myStyle.css" type="text/css"/>

<style>
	h3:hover { color : blue; }
	h4 {font-weight : bold;}
</style>

</head>
<body>

	<div id="MenuBar">
	<table id="topMenu">
		<tr>
		
		<!--차후에 서버 연결후 로그인 로그아웃 구현-->
		
			<td id="myHome">MAIN</td>
			<td> | </td>
			<td id="mylogout">LOGOUT</td>
			
		</tr>
	</table>
	</div>
	
	<h1 id="title">Seize The Day</h1>
	

	<div id = "myContent">
		<table id = "myMenu">
			<tr>
				<td></td>
				<td id = myExhibit><a href="make.jsp"><h3>전시 생성</h3></a></td>
				<td id = myFavorite><a href="ReviewPage.html"><h3>후기</h3></a></td>
				<td id = myEdit><a href="VisitPage.html"><h3>방명록</h3></a></td>
			
			</tr>
		</table>
		
		<div id = "myExhList">
			<div id = "ExhLeft">
				<input type = "image" src="http://placehold.it/300X200" style="cursor: pointer;" onclick="location.href='make.jsp';">
			</div>
				
			<div id = "ExhRight">
			<h4>What A Wonderful World!</h4>
				Open the gates and seize the day 
				Don't be afraid and don't delay
				Nothing can break us
				No one can make us
				Give our rights away
				Arise and seize the day
				Open the gates and seize the day
				Don't be afraid and don't delay
				Nothing can break us
				No one can make us
				Give our rights away
				Arise and seize the day
				Now is the time to seize the day
				Send out the call and join 
			</div>
		</div>
		
		<div id = "myExhList2">
			<div id = "ExhLeft2">
				<input type = "image" src="http://placehold.it/300X200" style="cursor: pointer;" onclick="location.href='make.jsp';">
			</div>
				
			<div id = "ExhRight2">
				<h4>Sunday Morning</h4>
				Sunday morning, rain is falling
				Steal some covers, share some skin
				Clouds are shrouding us in moments unforgettable
				You twist to fit the mold that I am in
				But things just get so crazy
				Living life gets hard to do
				And I would gladly hit the road, get up and go if I knew
				That someday it would lead me back to you
				That someday it would lead me back to you
			</div>
			
		</div>
		
	</div>
	
</body>
</html> 