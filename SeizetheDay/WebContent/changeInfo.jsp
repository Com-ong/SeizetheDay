<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "JavaBeans.UserBean"%>
<jsp:useBean id = "uMgr" class="JavaBeans.UserMgrPool"/>

<%
	request.setCharacterEncoding("EUC-KR");
	UserBean currUser = (UserBean)session.getAttribute("currUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<title>Info</title>
<link rel="stylesheet" href="CSS/InfoStyle.css">
</head>
<body>
	<jsp:include page = "header.jsp"></jsp:include>
	<form name="regFrm" method="post" action="changeInfoProc.jsp">
	<div class = "changeInfo">
		<div class = "aboutInfo">
			<div class = "infoTitle">CHANGE INFORMATION</div>
			
			<div class = "myInfo">
				<img class="myImg" id="imgDefault" src="mypage_image/empty.png">
				<span class = "UploadImg">
					<input type="text" class="ImgText" style="padding-right : 10px;">
					<span class= "Imgbtn">SELECT</span>
					<span class="ImgSelect">
						<input type="file" id="inputImg" class="inputImg" onchange="readImage(input) " size="3" accept="image/*">
					</span>
				</span>
		
				<span class = "realInfo">
				<div class = "InfoInsert">
					<table>
						<tr>
							<td><label for="name">이 름  </label></td>
							<td><input id="name" type="text" name="user_name" value="<%=currUser.getUSER_NAME()%>"></td>

						</tr>	
						
						<tr>
							<td><label for="mail">이 메 일  </label></td>
							<td><input id="mail" type="email" name="user_email" value="<%=currUser.getUSER_EMAIL()%>"></td>
						</tr>
						
						<tr>
							<td><label for="password">비 밀 번 호  </label></td>
							<td><input id="password" type="password" name="user_pw"></td>
						</tr>
						
						<tr>
							<td><label for="pwcheck">비 밀 번 호 확 인   </label></td>
							<td><input id="pwcheck" type="password" name="user_pw"></td>

						</tr>					
					</table>
				</div>
				
				<div class = "idChng"><labels>* 아 이 디 는 변 경 할 수 없 습 니 다.</label></div>
				</span>
				
				
				<span class = "buttonGroup">
				<div class = "InfoBtnGroup">
					<table>
						<tr>
							<td><input id="btn1" value="C A N C E L" type="button"></td>
							<td><input id="btn2" value="O K" type="submit"></td>
						</tr>
					</table>
					</form>
				</div>
				</span>
				
			</div>
			
		</div>
	</div>


</body>
</html>