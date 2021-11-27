<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- DB 연결 위한 추가 부분 -->
<%@ page import="java.util.*, java.sql.*, JavaBeans.*" %>
<jsp:useBean id="joinMgr" class="JavaBeans.UserMgrPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>

<link rel="stylesheet" href="CSS/join.css">
</head>
<body onLoad="joinForm.id.focus()">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="head">
		<span>SeizetheDay</span>
	</div>
	<div class="join">
		<div class="join-title">JOIN</div>
		<div class="join-content">
			<form name="joinForm" method="post" action="joinProc.jsp" >

				<div class="row gtr-uniform">
					<div class="col-7">
						<input type="text" name="USER_NAME" id="name" value=""
							placeholder="Name">
					</div>
					<div class="col-7">
						<input type="text" name="USER_ID" id="id" value=""
							placeholder="ID">
						<input type="button" value="ID중복확인" style="font-size:0.3em;" class="primary" onClick="idCheck(this.form.id.value)">
					</div>
					<div class="col-7">
						<input type="text" name="USER_PW" id="password" value=""
							placeholder="Password">
					</div>
					<div class="col-7">
						<input type="text" name="password_check" id="password_check" value=""
							placeholder="Password Check">
					</div>
					<div class="col-7">
						<input type="email" name="USER_EMAIL" id="email" value=""
							placeholder="Email">
					</div>
					<div>
						<!-- hidden 숨겨진 값들 -->
						
					</div>
					<!-- Break -->
					<div class="col-12">
						<ul class="actions">
							<!-- <li><input type="submit" value="Join" -->
							<li><input type="button" value="Join"
								class="primary" style="font-size:0.5em;" onclick="inputCheck()"></li>
							<!-- <li><input type="reset" value="Reset"></li> -->
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>


</body>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.joinForm;
		if (id == "") {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
		url = "idCheck.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");
	}
</script>
<script type="text/javascript">
function inputCheck(){
	if(document.joinForm.id.value==""){
		alert("아이디를 입력해 주세요.");
		document.joinForm.id.focus();
		return;
	}
	if(document.joinForm.password.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.joinForm.password.focus();
		return;
	}
	if(document.joinForm.password_check.value==""){
		alert("비밀번호를 확인해 주세요");
		document.joinForm.password_check.focus();
		return;
	}
	if(document.joinForm.password.value != document.joinForm.password_check.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.joinForm.password_check.value="";
		document.joinForm.password_check.focus();
		return;
	}
	if(document.joinForm.name.value==""){
		alert("이름을 입력해 주세요.");
		document.joinForm.name.focus();
		return;
	}
	if(document.joinForm.email.value==""){
		alert("이메일을 입력해 주세요.");
		document.joinForm.email.focus();
		return;
	}
    var str=document.joinForm.email.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	      document.joinForm.email.focus();
		  return;
    }
	document.joinForm.submit();
}

function win_close(){
	self.close();
}/**
 * 
 */
</script>
</html>
