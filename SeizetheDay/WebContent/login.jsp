<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SeizetheDay</title>
</head>
<body>
	<div class="head">
		<span>SeizetheDay</span>
	</div>
	<div class="login-section">
		<p class ="login-title">로그인</p>
		<hr>
		<form method="post" action="doLogin">
		<label>아이디
			<input type="text" class = "input-user" name="user_input_id" >
		</label><br />
		<label>비밀번호
			<input type="password" class = "input-user" name="user_input_pw" >
		</label><br />
		
		<button onclick="location='login.jsp'" class = "login-btn"> Login </button>
	</form>
	<button onclick="location='join.jsp'" class = "join-btn"> 회원가입하기 </button>
	</div>		
</body>
</h