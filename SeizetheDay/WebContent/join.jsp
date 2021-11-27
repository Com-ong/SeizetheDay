<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Story Reader</title>
</head>
<body>

	<div class="head">
		<span>SeizetheDay</span>
	</div>
	<div class="login-section">
		<p class = "login-title">회원가입</p>
		<hr>
		<form method="post" action="doJoin" onsubmit="return checkValue();'">
		<label>이름<br>
			<input type="text" id = "name" name="user_input_name" class = "input-user">
		</label><br />
		<label>아이디<br>
			<input type="text" id="id" name="user_input_id" class = "input-user">
		</label><br />
		<label>비밀번호<br>
			<input type="password" id = "password"name="user_input_pw" class = "input-user">
		</label><br />
		<button class = "login-btn"> Join </button>
	</form>
	</div>
	
		
</body>
</html> 