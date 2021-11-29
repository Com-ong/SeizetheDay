<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<title>Info</title>
<link rel="stylesheet" href="CSS/InfoStyle.css">
</head>

<script> 


</script>



<body>
	<jsp:include page = "header.jsp"></jsp:include>
	
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
							<td><input id="name" type="text"></td>
						</tr>	
						
						<tr>
							<td><label for="mail">이 메 일  </label></td>
							<td><input id="mail" type="email"></td>
						</tr>
						
						<tr>
							<td><label for="password">비 밀 번 호  </label></td>
							<td><input id="password" type="password"></td>
						</tr>
						
						<tr>
							<td><label for="pwcheck">비 밀 번 호 확 인   </label></td>
							<td><input id="pwcheck" type="password"></td>
						</tr>
										
					</table>
				</div>
				</span>
				
				
				<span class = "buttonGroup">
				<div class = "InfoBtnGroup">
					<table>
						<tr>
							<td><input id="btn1" value="C A N C E L" type="button"></td>
							<td><input id="btn2" value="O K" type="button"></td>
						</tr>
					</table>
				</div>
				</span>
				
			</div>
			
		</div>
	</div>


</body>
</html>